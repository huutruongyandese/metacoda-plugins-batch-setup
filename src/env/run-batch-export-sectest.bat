@echo off
setlocal

rem Copyright (c) 2019 Metacoda Group Pty Ltd.
rem Runs all Metacoda Plug-ins Batch Security Test XML exports in turn.

rem Change to this scripts dir so all relative paths are relative to this dir. 
cd "%~dp0"

rem Create output directories for the generated Security Test XML files.
mkdir "%~dp0output"
mkdir "%~dp0output\sectest"

echo Running Metacoda Plug-ins Batch Security Test XML export: ACTs
call "%~dp0run-batch-task.bat" batch-export-sectest\acts

echo Running Metacoda Plug-ins Batch Security Test XML export: Users
call "%~dp0run-batch-task.bat" batch-export-sectest\users

echo Running Metacoda Plug-ins Batch Security Test XML export: Groups
call "%~dp0run-batch-task.bat" batch-export-sectest\groups

echo Running Metacoda Plug-ins Batch Security Test XML export: Roles
call "%~dp0run-batch-task.bat" batch-export-sectest\roles

echo Running Metacoda Plug-ins Batch Security Test XML export: Capabilities
call "%~dp0run-batch-task.bat" batch-export-sectest\capabilities

echo Running Metacoda Plug-ins Batch Security Test XML export: Protected Objects
call "%~dp0run-batch-task.bat" batch-export-sectest\protected-objects

echo Running Metacoda Plug-ins Batch Security Test XML export: Internal Logins
call "%~dp0run-batch-task.bat" batch-export-sectest\internal-logins

echo Running Metacoda Plug-ins Batch Security Test XML export: Authentication Domains
call "%~dp0run-batch-task.bat" batch-export-sectest\auth-domains