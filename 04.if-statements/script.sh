#!/usr/bin/env bash

age=20
if [[ $age -ge 18 ]]; then
    echo "You are an adult."
elif [[ $age -lt 13 ]]; then
    echo "You are a child."
else
    echo "You are a teenager."
fi

