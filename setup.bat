#!/bin/sh
rem Copyright (c) 2019 Metacoda Group Pty Ltd.
call "%~dp0ant\bin\ant.bat"--noconfig -buildfile %~dp0setup.xml %*