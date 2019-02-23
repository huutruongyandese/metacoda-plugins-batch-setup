@echo off
setlocal

rem Copyright (c) 2019 Metacoda Group Pty Ltd.
rem Runs all Metacoda Plug-ins Batch Security Tests.

rem Change to this scripts dir so all relative paths are relative to this dir. 
cd "%~dp0"

rem Create output directories for the generated Security Test results.
mkdir "%~dp0output"
mkdir "%~dp0output\sectest-results"

echo Running Metacoda Plug-ins Batch Security Tests
call "%~dp0run-batch-task.bat" batch-sectest\sectest