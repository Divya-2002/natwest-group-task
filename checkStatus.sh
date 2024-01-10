#!/bin/bash

# Check if file containing URLs is provided as argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <URLs_file>"
    exit 1
fi

URLS_FILE=$1

# Check if the file exists 
if [ ! -f "$URLS_FILE" ]; then
    echo "Error: File '$URLS_FILE' not found or is not accessible."
    exit 1
fi

#  fetch http status code for  url
get_http_status() {
    local url="$1"
    local status_code=$(curl -s -o /dev/null -w "%{http_code}" "$url")
    echo "$url - HTTP status code: $status_code"
}

# process url in the file
while IFS= read -r url; do
    get_http_status "$url" >> http_status_logs.txt
done < "$URLS_FILE"

echo "HTTP status codes for URLs logged in http_status_logs.txt"

# here this script will create a file https_status_logs.txt and put the output into it
