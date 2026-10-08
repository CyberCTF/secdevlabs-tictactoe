#!/bin/sh
# A new player signs up and logs in, then reads its statistics: the data route takes the player
# from the `user` query parameter.
set -e
jar=$(mktemp)
user="probe$$"
curl -fsS -o /dev/null --data "username=$user&password=probe-pass&passwordconf=probe-pass" http://web:10005/create
sleep 1
curl -sS -o /dev/null -c "$jar" --data "username=$user&password=probe-pass" http://web:10005/login
grep -q tictacsession "$jar"
curl -fsS -b "$jar" "http://web:10005/statistics/data?user=$user" | grep -q '"numbers"'
