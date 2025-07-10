#!/bin/bash

cat server_logs.txt | awk -v exclude_pattern="192.168." -f solution.awk
