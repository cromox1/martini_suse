#!/bin/bash

masa=`date +%H_%M_%S`
tmphbnas=/tmp/hbnas_"$masa"

mkdir "$tmphbnas"
mount -t cifs //hb-nas.corp.emc.com/builds/Development/Martini "$tmphbnas" -o user=istech,pass=H0meBase
echo
echo "SUCCESSFULLY MOUNT MARTINI"
echo
latest_martini=`ls -lrt "$tmphbnas"/*/* | grep -i linux | tail -1 | awk '{print $NF}'`
echo
echo "LATEST = $latest_martini"
tar xvfz "$latest_martini" --directory /martini
umount "$tmphbnas" && rmdir "$tmphbnas"
