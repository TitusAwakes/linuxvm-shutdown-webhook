#!/bin/bash

# Set the Discord Webhook URL
DISCORD_WEBHOOK_URL=""

# Message to send with the boot notification
MESSAGE="Linux system has **started** on **$(hostname)**."

# Payload for the webhook request
PAYLOAD="{\"content\": \"$MESSAGE\"}"

# Log the initiation of the boot notification
echo "$(date) - Preparing to send boot notification..." >> /var/log/linux-notifications.log

# Send the webhook request to Discord using the verified curl format
curl -i \
    -H "Accept: application/json" \
    -H "Content-Type: application/json" \
    -X POST \
    --data "$PAYLOAD" \
    "$DISCORD_WEBHOOK_URL"

# Log the result of the notification
echo "$(date) - Boot notification sent." >> /var/log/linux-notifications.log
