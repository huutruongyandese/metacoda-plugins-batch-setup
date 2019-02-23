@echo off
setlocal

rem Copyright (c) 2019 Metacoda Group Pty Ltd.
rem Runs a batch Metacoda Plug-ins Identity Sync using an Active Directory source.

rem Change to this scripts dir so all relative paths are relative to this dir. 
cd "%~dp0"

rem Create output directories for the generated audit reports.
mkdir "%~dp0output"
mkdir "%~dp0output\idsync-ad"

echo Running Metacoda Plug-ins Identity Sync using an Active Directory source
call "%~dp0run-batch-task.bat" batch-idsync-ad\idsync-ad