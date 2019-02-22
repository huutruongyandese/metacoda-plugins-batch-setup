# Metacoda Plug-ins Batch Setup

## Intro

This repository provides a tool to help Metacoda customers and partners to setup and use the
Batch Interface for [Metacoda® Security Plug-ins](https://www.metacoda.com/en/products/security-plug-ins/)
with [SAS®](https://www.sas.com/) software.

The Metacoda Plug-ins Batch Interface is used to automate and schedule activities that you might
otherwise do manually using Metacoda Plug-ins inside SAS Management Console. This can include:
* Exporting HTML reports to document a SAS metadata security implementation (ACTs, ACEs, Users, 
  Groups, Roles, Capabilities, Protected Objects, Logins, Internal Logins, Authentication Domains,
  External Identities)
* Exporting simple CSV files for ACTs, ACEs, Users, Groups, Roles, Capabilities etc.
* Exporting Metadata Security Test XML files to use for subsequent security testing
* Running SAS metadata security implementation, effective permission and recommended practice
  tests using the [Metacoda Security Testing Framework](https://www.metacoda.com/en/products/security-plug-ins/testing-framework/)
* Populating SAS metadata users, groups, and roles by synchronizing with Microsoft Active Directory
  using the [Metacoda Identity Sync Plug-in](https://www.metacoda.com/en/products/security-plug-ins/identity-sync/)

After creating properties files with site-specific information, such as SAS metadata server 
connection details and SMTP server details, you run an [Apache Ant](https://ant.apache.org/)
driven setup script to generate site-specific sample scripts that you can use as-is or as the
basis for further customization.
Those generated site-specific sample scripts can be moved elsewhere if required as they have no
further dependency on this setup tool. This means, for example, you can download and run the
setup script on an internet connected machine and then move the generated scripts onto servers
that may have no or limited internet connectivity.    

# Usage

* TODO: specify JRE (JAVA_HOME) for Ant to use to generate the scripts (SAS Private JRE or other)
* TODO: create site-specific global properties file (cross-environment properties)
* TODO: create one or more site-specific environment properties file (e.g. Lev1, Lev2, Lev3)
* TODO: run environment setup script for each environment e.g.
* TODO:     setup.sh create acme-lev1
* TODO:     setup.sh create acme-lev2
* TODO: moved generated script to target server (if required)
* TODO: run generated scripts on target server (none of the generated sample script make any changes to metadata without manual changes)
 
# Resources

You may find the following resources useful when reviewing this documentation, the maps and sample code:

* [Metacoda Security Plug-ins Product Page](https://www.metacoda.com/en/products/security-plug-ins/)
* [Metacoda Security Testing Framework Product Page](https://www.metacoda.com/en/products/security-plug-ins/testing-framework/)
* [Metacoda Plug-ins Customer Documentation](https://support.metacoda.com/docs/plugins/v6.1/) (requires login)

# License

The setup scripts and samples contained in this repository are licensed under the terms of the
[Apache License 2.0](https://opensource.org/licenses/Apache-2.0).
See [LICENSE.txt](LICENSE.txt) for more information.

Metacoda Plug-ins, as required to run any batch scripts generated using this tool, is a commercial
product from Metacoda Pty Ltd, and must be separately licensed and obtained from Metacoda.

# Trademarks

Metacoda® and all other Metacoda product or service names are registered trademarks or trademarks of
[Metacoda Group Pty Ltd](https://www.metacoda.com/) in the USA and other countries.

SAS® and all other SAS Institute Inc. product or service names are registered trademarks or
trademarks of [SAS Institute Inc.](https://www.sas.com/) in the USA and other countries. ® indicates
USA registration.

Other product and company names mentioned herein may be registered trademarks or trademarks of
their respective owners.