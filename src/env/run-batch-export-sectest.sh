#!/bin/sh
# Copyright (c) 2019 Metacoda Group Pty Ltd.
# Runs all Metacoda Plug-ins Batch Security Test XML exports in turn.

# Determine the full absolute path for this script and its directory
dir="$( cd -P "$( dirname "$0" )" && pwd )"
script="$dir/$(basename "$0")"

# Change to this scripts dir so all relative paths are relative to this dir. 
cd ${dir}

# Create output directories for the generated Security Test XML files.
mkdir -p ${dir}/output/sectest

echo "Running Metacoda Plug-ins Batch Security Test XML export: ACTs"
${dir}/run-batch-task.sh batch-export-sectest/acts

echo "Running Metacoda Plug-ins Batch Security Test XML export: Users"
${dir}/run-batch-task.sh batch-export-sectest/users

echo "Running Metacoda Plug-ins Batch Security Test XML export: Groups"
${dir}/run-batch-task.sh batch-export-sectest/groups

echo "Running Metacoda Plug-ins Batch Security Test XML export: Roles"
${dir}/run-batch-task.sh batch-export-sectest/roles

echo "Running Metacoda Plug-ins Batch Security Test XML export: Capabilities"
${dir}/run-batch-task.sh batch-export-sectest/capabilities

echo "Running Metacoda Plug-ins Batch Security Test XML export: Protected Objects"
${dir}/run-batch-task.sh batch-export-sectest/protected-objects

echo "Running Metacoda Plug-ins Batch Security Test XML export: Internal Logins"
${dir}/run-batch-task.sh batch-export-sectest/internal-logins

echo "Running Metacoda Plug-ins Batch Security Test XML export: Authentication Domains"
${dir}/run-batch-task.sh batch-export-sectest/auth-domains