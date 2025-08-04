# Configure a Linux server to host a simple SFTP service

## Add new SFTP data disk (400GB+)


## Configure disk (/data)
```
mkdir -p /data
mkfs.ext4 /dev/sdb
echo "/dev/sdb /data ext4 defaults 1 1" >> /etc/fstab
mount -a
```


## Set SFTP directory permissions
```
chmod 701 /data
```


## Create SFTP group and user
```
groupadd sftp_users

useradd -g sftp_users -d /upload -s /sbin/nologin <USERNAME>
passwd <USERNAME>
```
**_NOTE:_** Special user that doesn’t have regular login privileges, but can access the SFTP service

(Optional) Set <USERNAME> password expire days
```
chage -l <USERNAME>
chage -m 0 -M 9999 -<USERNAME>
chage -l <USERNAME>
```
**_NOTE:_** 9999 = 9999 days between required password change


## SFTP directory structure
```
mkdir -p /data/<USERNAME>/upload
chown -R root:sftp_users /data/<USERNAME>
chown -R <USERNAME>:sftp_users /data/<USERNAME>/upload
```

## Configure sshd
```
vi /etc/ssh/sshd_config
```

At the bottom of that file, add the following:
```
Match Group sftp_users
ChrootDirectory /data/%u
ForceCommand internal-sftp
```

Restart sshd
```
systemctl restart sshd
```



## Credits
https://www.techrepublic.com/article/how-to-set-up-an-sftp-server-on-linux/

