#!/bin/bash

url="$1"

if [ -z "$url" ]; then
        echo "Give me a URL"
        exit 1
fi


start_time=$(date '+%Y-%m-%d %H:%M:%S')

result=$(curl -s -o /dev/null -w "%{http_code} %{time_total}" "$url")

curl_exit=$?

if [ "$curl_exit" -ne 0 ]; then
        echo "Time: $start_time"
        echo "Status: FAILED"
        echo "Could not reach: $url"
        exit
fi

status=$(echo "$result" | awk '{print $1}')
response_time=$(echo "$result" | awk '{print $2}')

echo "Time: $start_time"
echo "Status: $status"
echo "Response time: ${response_time}s"

if [ "$status" -ge 200 ] && [ "$status" -lt 400 ]; then
        exit 0
else
        exit 1
fi

