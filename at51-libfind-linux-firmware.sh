#!/bin/sh
# Requires https://gist.github.com/nstarke/771f76801e92e5c46508a9a61888920d/raw/a5a584baa9fa940faa5b7549eb9409edbbb2ff99/linux-firmare-cpu_rec.txt
# Requires "Linux-firmware" - https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
# Requires the Keil 8051 Toolcahin "LIB" directory
# Requires "at51" - https://github.com/8051Enthusiast/at51
KEIL_LIB="$HOME/keil-lib"
LINUX_FIRMWARE=$(cat linux-firmware-cpu_rec.txt | grep "8051" | awk -F " " '{print $1}')
for LINE in $LINUX_FIRMWARE
do
    mkdir -p "at51-libfind-results/$(dirname $LINE)"
    at51 libfind "linux-firmware/$LINE" "$KEIL_LIB" > "at51-libfind-results/$LINE.results.txt"
done