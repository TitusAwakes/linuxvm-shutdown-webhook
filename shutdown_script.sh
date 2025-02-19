#!/bin/bash

# Set the Discord Webhook URL
DISCORD_WEBHOOK_URL=""

# Message to send with the shutdown notification
MESSAGE="Linux system is **shutting down** on **$(hostname).**"

# Payload for the webhook request
PAYLOAD="{\"content\": \"$MESSAGE\"}"

# Log the initiation of the shutdown notification
echo "$(date) - Preparing to send shutdown notification..." >> /var/log/linux-notifications.log

# Add a grace period of 5 seconds before sending the notification
sleep 5

# Send the webhook request to Discord using the verified curl format
curl -i \
    -H "Accept: application/json" \
    -H "Content-Type: application/json" \
    -X POST \
    --data "$PAYLOAD" \
    "$DISCORD_WEBHOOK_URL"

# Log the result of the notification
echo "$(date) - Shutdown notification sent." >> /var/log/linux-notifications.log
