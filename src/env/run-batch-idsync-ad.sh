#!/bin/sh
# Copyright (c) 2019 Metacoda Group Pty Ltd.
# Runs a batch Metacoda Plug-ins Identity Sync using an Active Directory source.

# Determine the full absolute path for this script and its directory
dir="$( cd -P "$( dirname "$0" )" && pwd )"
script="$dir/$(basename "$0")"

# Change to this scripts dir so all relative paths are relative to this dir.
cd ${dir}

# Create output directories for the generated audit reports.
mkdir -p ${dir}/output/idsync-ad

echo "Running batch Metacoda Plug-ins Identity Sync using an Active Directory source"
$dir/run-batch-task.sh batch-idsync-ad/idsync-ad