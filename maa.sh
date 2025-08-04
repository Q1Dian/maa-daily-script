#!/bin/bash

# Set resolution for better compatibility
adb shell wm size 1080x1920

# Keep screen on
adb shell svc power stayon true

PASSWORD="$1"

# Optional: Wake up and unlock the device
adb shell input keyevent KEYCODE_WAKEUP
sleep 1

if [ $# -ge 1 ]; then
  PASSWORD="$1"
  # Optional: simulate swipe to show password screen
  adb shell input swipe 500 1500 500 500 300
  sleep 1
  # Enter password
  adb shell input text "$PASSWORD"
  adb shell input keyevent 66  # Press Enter
else
  echo "No password provided. Skipping unlock."
fi


# Device brightness Down
adb shell settings put system screen_brightness 1

# Optional: Wait a moment for device to stabilize
sleep 2

# Update MAA
maa update

# Run daily routine
if [ $# -eq 0 ]; then
	maa run daily -v
else
	maa run dbily -v
fi

# Optional: Add more MAA routines if needed
# maa run explore
# maa run recruit
# maa run infrastructure

# Restore screen stay settings
adb shell svc power stayon false

# Screenshot to verify everything is done
adb exec-out screencap -p > /tmp/screenshot.png && open /tmp/screenshot.png

# Close Arknights
adb shell am force-stop com.YoStarEN.Arknights

# Reset screen size
adb shell wm size reset

# Reset brightness
adb shell settings put system screen_brightness 20

# Optional: Turn screen off again
adb shell input keyevent KEYCODE_SLEEP

