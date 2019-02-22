#!/bin/sh
# Copyright (c) 2019 Metacoda Group Pty Ltd.
# Runs all Metacoda Plug-ins Batch HTML exports in turn.

# Determine the full absolute path for this script and its directory
dir="$( cd -P "$( dirname "$0" )" && pwd )"
script="$dir/$(basename "$0")"

# Change to this scripts dir so all relative paths are relative to this dir.
cd ${dir}

# Create output directories for the generated HTML reports.
mkdir -p ${dir}/output/html

echo "Running Metacoda Plug-ins Batch HTML export: ACTs"
mkdir -p ${dir}/output/html/acts
${dir}/run-batch-task.sh batch-export-html/acts

echo "Running Metacoda Plug-ins Batch HTML export: ACEs"
mkdir -p ${dir}/output/html/aces
${dir}/run-batch-task.sh batch-export-html/aces

echo "Running Metacoda Plug-ins Batch HTML export: Users"
mkdir -p ${dir}/output/html/users
${dir}/run-batch-task.sh batch-export-html/users

echo "Running Metacoda Plug-ins Batch HTML export: Groups"
mkdir -p ${dir}/output/html/groups
${dir}/run-batch-task.sh batch-export-html/groups

echo "Running Metacoda Plug-ins Batch HTML export: Roles"
mkdir -p ${dir}/output/html/roles
${dir}/run-batch-task.sh batch-export-html/roles

echo "Running Metacoda Plug-ins Batch HTML export: Capabilities"
mkdir -p ${dir}/output/html/capabilities
${dir}/run-batch-task.sh batch-export-html/capabilities

echo "Running Metacoda Plug-ins Batch HTML export: Protected Objects"
mkdir -p ${dir}/output/html/protected-objects
${dir}/run-batch-task.sh batch-export-html/protected-objects

echo "Running Metacoda Plug-ins Batch HTML export: Logins"
mkdir -p ${dir}/output/html/logins
${dir}/run-batch-task.sh batch-export-html/logins

echo "Running Metacoda Plug-ins Batch HTML export: Internal Logins"
mkdir -p ${dir}/output/html/internal-logins
${dir}/run-batch-task.sh batch-export-html/internal-logins

echo "Running Metacoda Plug-ins Batch HTML export: Authentication Domains"
mkdir -p ${dir}/output/html/auth-domains
${dir}/run-batch-task.sh batch-export-html/auth-domains

echo "Running Metacoda Plug-ins Batch HTML export: External Identities"
mkdir -p ${dir}/output/html/external-identities
${dir}/run-batch-task.sh batch-export-html/external-identities

echo "Running Metacoda Plug-ins Batch HTML export: Security Tools"
mkdir -p ${dir}/output/html/security-tools
${dir}/run-batch-task.sh batch-export-html/security-tools