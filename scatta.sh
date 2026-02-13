#!/bin/bash
DIRECTORY=foto/$(date +"%Y%m%d%H%M%S")
#echo USB on
#picocom -b 115200 -X --lower-rts --noreset /dev/ttyUSB0 > /dev/null
#echo trigger OFF
#picocom -b 115200 -X --raise-dtr --noreset /dev/ttyUSB0 > /dev/null
#sleep 5

APERTURA=$(pktriggercord-cli --auto_focus --model=K-7 -m=GREEN --exposure_compensation=0 --green | fgrep "current aperture" | awk 'NF>1{print $NF}')
echo ${APERTURA}

echo unmounting camera
sudo umount camera
for EXPOSURE in  0 +0.33 -0.33 +0.66 -0.66 +1 -1 +1.33 -1.33 +1.66 -1.66 +2 -2
do
        echo ${EXPOSURE}
        pktriggercord-cli --model=K-7 --exposure_mode=AV --iso=100 --aperture=${APERTURA} --exposure_compensation=${EXPOSURE} --timeout=5
        echo diabilito USB
        picocom -b 115200 -X --raise-rts --noreset /dev/ttyUSB0 > /dev/null
        sleep .2
        echo premo otturatore
        picocom -b 115200 -X --lower-dtr --noreset /dev/ttyUSB0 > /dev/null
        sleep .2
        echo rilascio otturatore
        picocom -b 115200 -X --raise-dtr --noreset /dev/ttyUSB0 > /dev/null
        sleep 2
        echo riabilito USB
        picocom -b 115200 -X --lower-rts --noreset /dev/ttyUSB0 > /dev/null
        sleep 5
done
sleep 5
sleep 5
echo Mounting camera disk
sudo mount -o gid=1000,umask=0002 /dev/disk/by-id/usb-PENTAX_DSC_K-7_3413106-0\:0-part1 camera
echo Moving images to ${DIRECTORY}
mv camera/DCIM ${DIRECTORY}
