#!/bin/bash -e
echo "Running Blin with parameters: $@"
cp -r /Blin /mnt
cd /mnt/Blin
bin/blin.p6 $@
