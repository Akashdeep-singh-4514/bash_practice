#!/usr/bin/env bash

if [[ ! -f config.txt ]]; then
    echo "normal message"
    echo "Error: config.txt missing" >&2
    exit 1
fi

