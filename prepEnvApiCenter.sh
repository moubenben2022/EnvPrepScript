#!/bin/bash
# This file should be stored at /home/production/apicenter

LOG_DIR="/home/ming/Desktop/work/logs"
LOG_FILE="$LOG_DIR/APICenter.log"

# Create the directory if it doesn't exist
mkdir -p "$LOG_DIR"

# Create an empty file or do nothing if it already exists
touch "$LOG_FILE"