#!/bin/bash

source /retry_func.sh

retry 6 10 psql -h db -p 5432 -d postgres -U postgres -c 'select now();' || {
    echo "Could not connect to db container!"
    exit 1;
}

node pg_notify_listener.js
