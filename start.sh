#!/bin/bash

if [[ -n $RCLONE_CONFIG_BASE64 ]]; then
	echo "Rclone config detected"
	echo "$(echo $RCLONE_CONFIG_BASE64|base64 -d)" >> rclone.conf
    mkdir -p /app/.config/rclone
	echo "[DRIVE]" > /app/.config/rclone/rclone.conf
fi

if [[ -n $BOT_TOKEN && -n $OWNER_ID ]]; then
	echo "Bot token and owner ID detected"
	python3 config.py
fi

echo "SETUP COMPLETED"

npm start
