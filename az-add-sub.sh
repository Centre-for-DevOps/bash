#!/bin/bash

userlist="myemail"
role="whatever"

subs=(
"name::guid"
)

for us in $userlist
do
    for index in "${subs[@]}"; do
        KEY="${index%%::*}"
        VALUE="${index##*::}"
        echo  "Granting access $KEY/$VALUE to $userlist"
        az role assignment create --assignee "$us" --role "$role" --scope "/subscriptions/$VALUE" --verbose
    done
done
