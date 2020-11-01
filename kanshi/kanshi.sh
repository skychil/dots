#!/usr/bin/env sh

# Terminate already running instances
killall -q kanshi

# Wait until the processes have been shut down
while pgrep -x kanshi >/dev/null; do sleep 1; done

# Launch new instance
kanshi &
