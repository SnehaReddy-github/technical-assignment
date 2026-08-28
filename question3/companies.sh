#!/bin/bash

# Check that the URL argument was supplied
if [ -z "$1" ]; then
    echo "Usage: bash companies.sh <CSV_URL>"
    exit 1
fi

# Download the CSV
csv_data=$(curl -s "$1")

# Handle download failure
if [ -z "$csv_data" ]; then
    echo "Failed to retrieve the dataset."
    exit 1
fi

# Print the output header
echo "Company | Location | Founding Year"

# Process the CSV
echo "$csv_data" |
awk 'BEGIN {FPAT="([^,]+)|(\"[^\"]+\")"} NR > 1 {
    gsub(/^"|"$/, "", $2)
    gsub(/^"|"$/, "", $5)
    gsub(/^"|"$/, "", $8)
    match($8, /[0-9]{4}/, year)
    print year[0] " | " $2 " | " $5
}' |
sort -n |
sort -n |
awk -F'[|]' '{
    gsub(/^[[:space:]]+|[[:space:]]+$/, "", $1)
    gsub(/^[[:space:]]+|[[:space:]]+$/, "", $2)
    gsub(/^[[:space:]]+|[[:space:]]+$/, "", $3)
    print $2 " | " $3 " | " $1
}'