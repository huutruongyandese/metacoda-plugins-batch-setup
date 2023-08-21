#!/bin/sh
# Copyright (c) 2019 Metacoda Group Pty Ltd.
# Runs a Metacoda Plug-ins batch task

# Requirements (see readme.txt for more info):
# 1) JREHOME environment variable points to an appropriate JRE
# 2) All required jar files present in the lib dir
# 3) Batch task XML files provided on the command line contains metadata connection details/credentials.

# -----------------------------------------------------------------------------
# STEP1: Please specify the JRE location (edit as necessary)

# Example for SAS 9.2:
#JREHOME=/opt/sas92m3/sashome/jre1.5.0_14

# Example for SAS 9.3:
#JREHOME=/opt/sas93m2/sashome/jre1.6.0_21

# Example for SAS 9.4:
#JREHOME=/opt/sas94m3/sashome/SASPrivateJavaRuntimeEnvironment/9.4/jre

JREHOME=${site.env.jrehome}

# -----------------------------------------------------------------------------
# NOTE: no more editing should be required past this point
# -----------------------------------------------------------------------------

# Determine the full absolute path for this script and its directory
dir="$( cd -P "$( dirname "$0" )" && pwd )"
script="$dir/$(basename "$0")"

batchxml=${dir}/$1.xml
echo "Using Batch XML: $batchxml"
userprefsxml=${dir}/$1-prefs.xml
echo "Using User Preferences XML: $userprefsxml"

# Verify the JRE can be found.
echo "Using Java Runtime Environment (JREHOME): $JREHOME"
if [ ! -x ${JREHOME}/bin/java ]; then
    echo "ERROR: No Java executable was found in the specified JREHOME ($JREHOME)"
    echo "Please edit this script '$script' and supply a valid JREHOME"
    exit 1
fi

# Build up Java Options
javaopts="-Dcom.metacoda.plugins.userPrefsFile=$userprefsxml"
javaopts="$javaopts -Djava.security.egd=file:/dev/./urandom"
#javaopts="$javaopts -Dcom.metacoda.common.exportAnonymous=true"
#javaopts="$javaopts -Dcom.metacoda.plugins.systemPrefsFile=$sysprefsxml"
javaopts="$javaopts -Dcom.metacoda.smc.licenseFile=${dir}/metacoda-plugins-v6.lic"
#javaopts="$javaopts -Dfile.encoding=utf-8"
javaopts="$javaopts -Djava.awt.headless=true"
echo "Using Java Options: $javaopts"

# Build up the required classpath
cp="$dir/lib/activation.jar"
cp="$cp:$dir/lib/bsh.jar"
cp="$cp:$dir/lib/commons-codec.jar"
cp="$cp:$dir/lib/commons-httpclient.jar"
cp="$cp:$dir/lib/commons-logging.jar"
cp="$cp:$dir/lib/dl.util.concurrent.jar"
cp="$cp:$dir/lib/glassfish-corba-internal-api.jar"
cp="$cp:$dir/lib/glassfish-corba-orb.jar"
cp="$cp:$dir/lib/glassfish-corba-omgapi.jar"
cp="$cp:$dir/lib/httpclient.jar"
cp="$cp:$dir/lib/httpcore.jar"
cp="$cp:$dir/lib/icu4j.jar"
cp="$cp:$dir/lib/jackrabbit-webdav.jar"
cp="$cp:$dir/lib/jh.jar"
cp="$cp:$dir/lib/log4j.jar"
cp="$cp:$dir/lib/log4j-api.jar"
cp="$cp:$dir/lib/log4j-core.jar"
cp="$cp:$dir/lib/mail.jar"
cp="$cp:$dir/lib/mailapi.jar"
cp="$cp:$dir/lib/pfl-basic.jar"
cp="$cp:$dir/lib/pfl-tf.jar"
cp="$cp:$dir/lib/smtp.jar"
cp="$cp:$dir/lib/sastpj.rutil.jar"
cp="$cp:$dir/lib/sas.antlr.jar"
cp="$cp:$dir/lib/sas.core.jar"
cp="$cp:$dir/lib/sas.core.net.jar"
cp="$cp:$dir/lib/sas.entities.jar"
cp="$cp:$dir/lib/sas.framework.commons.jar"
cp="$cp:$dir/lib/sas.framework.workspace.jar"
cp="$cp:$dir/lib/sas.icons.jar"
cp="$cp:$dir/lib/sas.icons.contents.jar"
cp="$cp:$dir/lib/sas.nls.collator.jar"
cp="$cp:$dir/lib/sas.oma.auth.jar"
cp="$cp:$dir/lib/sas.oma.joma.jar"
cp="$cp:$dir/lib/sas.oma.joma.rmt.jar"
cp="$cp:$dir/lib/sas.oma.omi.jar"
cp="$cp:$dir/lib/sas.oma.util.jar"
cp="$cp:$dir/lib/sas.rutil.jar"
cp="$cp:$dir/lib/sas.security.sspi.jar"
cp="$cp:$dir/lib/sas.smc.jar"
cp="$cp:$dir/lib/sas.smc.usermgr.jar"
cp="$cp:$dir/lib/sas.storage.jar"
cp="$cp:$dir/lib/sas.svc.cache.jar"
cp="$cp:$dir/lib/sas.svc.connection.jar"
cp="$cp:$dir/lib/sas.svc.connection.platform.jar"
cp="$cp:$dir/lib/sas.svc.core.jar"
cp="$cp:$dir/lib/sas.svc.sec.login.jar"
cp="$cp:$dir/lib/sas.svc.storedprocess.jar"
cp="$cp:$dir/lib/sas.svc.webdav.jar"
cp="$cp:$dir/lib/metacoda.plugins.jar"
echo "Using Java Classpath: $cp"

# Launch the Metacoda Plug-ins batch interface
# (add -verbose below to troubleshoot class loading issues)
${JREHOME}/bin/java -Xmx1024m -cp ${cp} ${javaopts} com.metacoda.smc.batch.BatchPluginsApp ${batchxml}