#!/bin/bash

/sbin/chkconfig smb on
/bin/cp /etc/samba/smb.conf /etc/samba/smb.conf.org1
/bin/cat /etc/samba/smb.conf.org1 | /bin/grep -v "#" | /bin/grep -v ";" | grep -i [a-z] > /etc/samba/smb.conf
/bin/mkdir /smb_export
/bin/echo "[samba-share_t]" >> /etc/samba/smb.conf
/bin/echo "        comment = samba-share_t" >> /etc/samba/smb.conf
/bin/echo "        path = /smb_export" >> /etc/samba/smb.conf
/bin/echo "        force user = root" >> /etc/samba/smb.conf
/bin/echo "        force group = root" >> /etc/samba/smb.conf
/bin/echo "        public = yes" >> /etc/samba/smb.conf
/bin/echo "        writable = yes" >> /etc/samba/smb.conf
/bin/echo "        printable = no" >> /etc/samba/smb.conf
/bin/echo "        browseable = yes" >> /etc/samba/smb.conf
/bin/echo "        guest ok = yes" >> /etc/samba/smb.conf
/bin/sed -e 's/security = [a-z].*/security = share /' -i /etc/samba/smb.conf
