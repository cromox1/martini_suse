#!/bin/sh

echo
echo "WHAT YOU WANT TO DO :"
echo "1) MOUNT DEV"
echo "2) MOUNT GA"
echo "3) UNMOUNT"
echo "4) nothing"
echo
echo -n "YOUR CHOICE [ 1 - 4 ] : "
read -e pilihan

if [ $pilihan = 1 ]
then
masa=`date +%H_%M_%S`
tmphbnas=/tmp/hbnas_"$masa"

mkdir "$tmphbnas"
mount -t cifs //hb-nas.corp.emc.com/builds "$tmphbnas" -o user=istech,pass=H0meBase
ln -s "$tmphbnas" /HBNAS
echo
echo "SUCCESSFULLY MOUNT HBNAS MAIN - /HBNAS"
echo

elif [ $pilihan = 2 ]
then
masa=`date +%H_%M_%S`
tmphbnas=/tmp/hbnas_"$masa"

mkdir "$tmphbnas"
mount -t cifs //hb-nas.corp.emc.com/builds/Releases "$tmphbnas" -o user=istech,pass=H0meBase
ln -s "$tmphbnas" /HBNAS_GA
echo
echo "SUCCESSFULLY MOUNT HBNAS GA - /HBNAS_GA"
echo


elif [ $pilihan = 3 ]
then

for tmphbnas in `df | grep -i /tmp/hbnas | awk '{print $NF}'`
do
umount "$tmphbnas" && rmdir "$tmphbnas"
linkni=`ls -al /HBNAS* | grep -i "$tmphbnas" | awk '{print $(NF-2)}'`
rm "$linkni"
done
echo
echo "SUCCESSFULLY UNMOUNT $linkni"
echo

else
echo
echo "NOTHING TO DO"
echo

fi

