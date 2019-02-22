#!/bin/sh
# Copyright (c) 2019 Metacoda Group Pty Ltd.
# Runs all Metacoda Plug-ins Batch CSV exports in turn.

# Determine the full absolute path for this script and its directory
dir="$( cd -P "$( dirname "$0" )" && pwd )"
script="$dir/$(basename "$0")"

# Change to this scripts dir so all relative paths are relative to this dir.
cd ${dir}

# Create output directories for the generated CSV reports.
mkdir -p ${dir}/output/csv

echo "Running Metacoda Plug-ins Batch CSV export: ACTs"
${dir}/run-batch-task.sh batch-export-csv/acts

echo "Running Metacoda Plug-ins Batch CSV export: ACEs"
${dir}/run-batch-task.sh batch-export-csv/aces

echo "Running Metacoda Plug-ins Batch CSV export: Users"
${dir}/run-batch-task.sh batch-export-csv/users

echo "Running Metacoda Plug-ins Batch CSV export: Groups"
${dir}/run-batch-task.sh batch-export-csv/groups

echo "Running Metacoda Plug-ins Batch CSV export: Roles"
${dir}/run-batch-task.sh batch-export-csv/roles

echo "Running Metacoda Plug-ins Batch CSV export: Capabilities"
${dir}/run-batch-task.sh batch-export-csv/capabilities

echo "Running Metacoda Plug-ins Batch CSV export: Protected Objects"
${dir}/run-batch-task.sh batch-export-csv/protected-objects

echo "Running Metacoda Plug-ins Batch CSV export: Logins"
${dir}/run-batch-task.sh batch-export-csv/logins

echo "Running Metacoda Plug-ins Batch CSV export: Internal Logins"
${dir}/run-batch-task.sh batch-export-csv/internal-logins

echo "Running Metacoda Plug-ins Batch CSV export: Authentication Domains"
${dir}/run-batch-task.sh batch-export-csv/auth-domains

echo "Running Metacoda Plug-ins Batch CSV export: External Identities"
${dir}/run-batch-task.sh batch-export-csv/external-identities