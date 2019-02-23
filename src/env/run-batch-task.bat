@echo off
setlocal

rem Copyright (c) 2019 Metacoda Group Pty Ltd.
rem Runs a Metacoda Plug-ins batch task

rem Requirements (see readme.txt for more info):
rem 1) JREHOME environment variable points to an appropriate JRE
rem 2) All required jar files present in the lib dir
rem 3) Batch task XML files provided on the command line contains metadata connection details/credentials.

rem -----------------------------------------------------------------------------
rem STEP1: Please specify the JRE location (edit as necessary)

rem Example for SAS 9.2:
rem set JREHOME=C:\Program Files\Java\jre6

rem Example for SAS 9.3:
rem set JREHOME=C:\Program Files\Java\jre6

rem Example for SAS 9.4:
rem set JREHOME=C:\Program Files\SASHome2\SASPrivateJavaRuntimeEnvironment\9.4\jre

set JREHOME=${site.env.jrehome}

rem -----------------------------------------------------------------------------
rem NOTE: no more editing should be required past this point
rem -----------------------------------------------------------------------------

rem Determine the full absolute path for this script and its directory
set dir=%~dp0
set script=%~f0

set batchxml=%dir%%1.xml
echo Using Batch XML: %batchxml%
set userprefsxml=%dir%%1-prefs.xml
echo Using User Preferences XML: %userprefsxml%

rem Verify the JRE can be found.
echo Using Java Runtime Environment (JREHOME): %JREHOME%
if not exist "%JREHOME%\bin\java.exe" (
    echo ERROR: No Java executable was found in the specified JREHOME "%JREHOME%"
    echo Please edit this script "%script%" and supply a valid JREHOME
    pause
    exit 1
)

rem Build up Java Options
set javaopts=-Dcom.metacoda.plugins.userPrefsFile="%userprefsxml%"
rem set javaopts=%javaopts% -Dcom.metacoda.common.exportAnonymous=true
set javaopts=%javaopts% -Dcom.metacoda.smc.licenseFile="%dir%metacoda-plugins-v6.lic"
rem set javaopts=%javaopts% -Dfile.encoding=utf-8
set javaopts=%javaopts% -Djava.awt.headless=true
echo Using Java Options: %javaopts%

rem Build up the required classpath
set cp="%dir%lib\activation.jar"
set cp=%cp%;"%dir%lib\bsh.jar"
set cp=%cp%;"%dir%lib\commons-codec.jar"
set cp=%cp%;"%dir%lib\commons-httpclient.jar"
set cp=%cp%;"%dir%lib\dl.util.concurrent.jar"
set cp=%cp%;"%dir%lib\icu4j.jar"
set cp=%cp%;"%dir%lib\jh.jar"
set cp=%cp%;"%dir%lib\log4j.jar"
set cp=%cp%;"%dir%lib\mail.jar"
set cp=%cp%;"%dir%lib\mailapi.jar"
set cp=%cp%;"%dir%lib\smtp.jar"
set cp=%cp%;"%dir%lib\sastpj.rutil.jar"
set cp=%cp%;"%dir%lib\sas.antlr.jar"
set cp=%cp%;"%dir%lib\sas.core.jar"
set cp=%cp%;"%dir%lib\sas.core.net.jar"
set cp=%cp%;"%dir%lib\sas.entities.jar"
set cp=%cp%;"%dir%lib\sas.framework.commons.jar"
set cp=%cp%;"%dir%lib\sas.framework.workspace.jar"
set cp=%cp%;"%dir%lib\sas.icons.jar"
set cp=%cp%;"%dir%lib\sas.icons.contents.jar"
set cp=%cp%;"%dir%lib\sas.nls.collator.jar"
set cp=%cp%;"%dir%lib\sas.oma.auth.jar"
set cp=%cp%;"%dir%lib\sas.oma.joma.jar"
set cp=%cp%;"%dir%lib\sas.oma.joma.rmt.jar"
set cp=%cp%;"%dir%lib\sas.oma.omi.jar"
set cp=%cp%;"%dir%lib\sas.rutil.jar"
set cp=%cp%;"%dir%lib\sas.security.sspi.jar"
set cp=%cp%;"%dir%lib\sas.smc.jar"
set cp=%cp%;"%dir%lib\sas.storage.jar"
set cp=%cp%;"%dir%lib\sas.svc.cache.jar"
set cp=%cp%;"%dir%lib\sas.svc.connection.jar"
set cp=%cp%;"%dir%lib\sas.svc.connection.platform.jar"
set cp=%cp%;"%dir%lib\sas.svc.core.jar"
set cp=%cp%;"%dir%lib\sas.svc.sec.login.jar"
set cp=%cp%;"%dir%lib\sas.svc.storedprocess.jar"
set cp=%cp%;"%dir%lib\sas.svc.webdav.jar"
set cp=%cp%;"%dir%lib\metacoda.plugins.jar"
echo Using Java Classpath: %cp%

rem Launch the Metacoda Plug-ins batch interface
rem (add -verbose below to troubleshoot class loading issues)
"%JREHOME%/bin/java" -Xmx1024m -cp %cp% %javaopts% com.metacoda.smc.batch.BatchPluginsApp "%batchxml%"