#!/bin/bash
#
# Shuts down the host on inactivity.
#
# Designed to be executed as root from a cron job.
# It will power off on the 2nd consecutive run without an active ssh session.
# That prevents an undesirable shutdown when the machine was just started, or on a brief disconnect.
#
# To enable, add this entry to /etc/crontab:
# */5 *   * * *   root    /home/ubuntu/dotfiles/bin/shutdown-if-inactive
#
set -o nounset -o errexit -o pipefail

echo "Trying to start"

MARKER_FILE="/tmp/ssh-inactivity-flag"
PUSHOVER_TOKEN=""
PUSHOVER_USER=""

STATUS=$(netstat | grep ssh | grep ESTABLISHED &>/dev/null && echo active || echo inactive)
echo "status" $STATUS

if [ "$STATUS" == "inactive" ]; then
  if [ -f "$MARKER_FILE" ]; then
    echo "Powering off due to ssh inactivity."
    curl -s   --form-string "token=$PUSHOVER_TOKEN"   --form-string "user=$PUSHOVER_USER"   --form-string "message=powering off due to inactivity"   https://api.pushover.net/1/messages.json
    sudo shutdown -h now
    # poweroff  # See https://unix.stackexchange.com/a/196014/56711
  else
    # Create a marker file so that it will shut down if still inactive on the next time this script runs.
    touch "$MARKER_FILE"
  fi
else
  # Delete marker file if it exists
  rm --force "$MARKER_FILE"
fi
