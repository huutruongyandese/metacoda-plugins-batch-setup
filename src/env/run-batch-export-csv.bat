@echo off
rem Copyright (c) 2019 Metacoda Group Pty Ltd.
rem Runs all Metacoda Plug-ins Batch CSV exports in turn.

rem Change to this scripts dir so all relative paths are relative to this dir. 
cd "%~dp0"

rem Create output directories for the generated CSV reports.
mkdir "%~dp0output"
mkdir "%~dp0output\csv"

echo Running Metacoda Plug-ins Batch CSV export: ACTs
call "%~dp0run-batch-task.bat" batch-export-csv\acts

echo Running Metacoda Plug-ins Batch CSV export: ACEs
call "%~dp0run-batch-task.bat" batch-export-csv\aces

echo Running Metacoda Plug-ins Batch CSV export: Users
call "%~dp0run-batch-task.bat" batch-export-csv\users

echo Running Metacoda Plug-ins Batch CSV export: Groups
call "%~dp0run-batch-task.bat" batch-export-csv\groups

echo Running Metacoda Plug-ins Batch CSV export: Roles
call "%~dp0run-batch-task.bat" batch-export-csv\roles

echo Running Metacoda Plug-ins Batch CSV export: Capabilities
call "%~dp0run-batch-task.bat" batch-export-csv\capabilities

echo Running Metacoda Plug-ins Batch CSV export: Protected Objects
call "%~dp0run-batch-task.bat" batch-export-csv\protected-objects

echo Running Metacoda Plug-ins Batch CSV export: Logins
call "%~dp0run-batch-task.bat" batch-export-csv\logins

echo Running Metacoda Plug-ins Batch CSV export: Internal Logins
call "%~dp0run-batch-task.bat" batch-export-csv\internal-logins

echo Running Metacoda Plug-ins Batch CSV export: Authentication Domains
call "%~dp0run-batch-task.bat" batch-export-csv\auth-domains

echo Running Metacoda Plug-ins Batch CSV export: External Identities
call "%~dp0run-batch-task.bat" batch-export-csv\external-identities