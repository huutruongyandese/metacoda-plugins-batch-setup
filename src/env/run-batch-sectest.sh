#!/bin/sh
# Copyright (c) 2019 Metacoda Group Pty Ltd.
# Runs all Metacoda Plug-ins Batch Security Tests.

# Determine the full absolute path for this script and its directory
dir="$( cd -P "$( dirname "$0" )" && pwd )"
script="$dir/$(basename "$0")"

# Change to this scripts dir so all relative paths are relative to this dir. 
cd ${dir}

# Create output directories for the generated Security Test results.
mkdir -p ${dir}/output/sectest-results

echo "Running Metacoda Plug-ins Batch Security Tests"
${dir}/run-batch-task.sh batch-sectest/sectest