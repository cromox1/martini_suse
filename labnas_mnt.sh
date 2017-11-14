#!/bin/sh

echo
echo -n "[MOUNT](1) OR [UNMOUNT](else) : "
read -e pilihan

if [ $pilihan = 1 ]
then

masa=`date +%H_%M_%S`
tmphblabnas=/tmp/hblabnas_"$masa"

mkdir "$tmphblabnas"
mount -t cifs //hb-labnas.corp.emc.com/share/OS "$tmphblabnas" -o user=istech,pass=H0meBase
ln -s "$tmphblabnas" /HBLABNAS
echo "SUCCESSFULLY MOUNT HBLABNAS - /HBLABNAS"

else

for tmphblabnas in `df | grep -i /tmp/hblabnas | awk '{print $NF}'`
do
linkni=`ls -al /HBLABNAS | grep -i "$tmphblabnas" | awk '{print $(NF-2)}'`
umount "$tmphblabnas" && rmdir "$tmphblabnas"
rm -f "$linkni"
done

fi
