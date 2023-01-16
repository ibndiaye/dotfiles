#!/usr/bin/env bash

# gpu-screen-recorder -w screen -c mp4 -f 60 -a speaker/alsa_output.pci-0000_26_00.1.hdmi-stereo.monitor -a mic/alsa_input.pci-0000_28_00.4.analog-stereo -a headset/alsa_output.pci-0000_28_00.4.analog-stereo.monitor -q high -r 30 -o "$HOME/Videos/clips"
# if ! pgrep -x "gpu-screen-recorder" > /dev/null
# then
#     $RUN=false
# else
#     $RUN=true
# fi

while true
do
    if ! pgrep -x "gpu-screen-recorder" > /dev/null
    then
        gpu-screen-recorder -w screen -c mp4 -f 30 -a "$(pactl get-default-sink).monitor" -a "$(pactl get-default-source)" -a speaker/alsa_output.pci-0000_26_00.1.hdmi-stereo.monitor -q high -r 30 -o "$HOME/Videos/clips"
        dunstify 'Instant Replay RUNning!'
    fi
done