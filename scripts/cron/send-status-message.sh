#!/bin/sh

PUSHOVER_TOKEN=""
PUSHOVER_USER=""

curl -s --form-string "token=$PUSHOVER_TOKEN"   --form-string "user=$PUSHOVER_USER"   --form-string "message=instance still on after 30 minutes"   https://api.pushover.net/1/messages.json
