#!/bin/bash

http_status=$(curl -s -o /dev/null -w "%{http_code}" http://localhost)

if [ "$http_status" -eq 200 ]
then
    echo "Website is healthy"
else
    echo "Website is unhealthy"
fi
