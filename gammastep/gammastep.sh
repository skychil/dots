#!/usr/bin/env sh

# Terminate already running instances
killall -q gammastep

# Wait until the processes have been shut down
while pgrep -x gammastep >/dev/null; do sleep 1; done

# Launch new instance
gammastep &
