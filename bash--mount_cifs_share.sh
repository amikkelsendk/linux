#!/bin/bash

#https://linuxize.com/post/how-to-mount-cifs-windows-share-on-linux/
#https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/storage_administration_guide/mounting_an_smb_share

cifsUser="<username>"
ciftsUserDomain="<domainname>"
cifsUserPwd="<password>"
cifsShare="//<server fqdn or ip>/<share>"

# Create mount point
mkdir -p /mnt/cifshare01

# Mount cifs share
mount -t cifs -o sec=ntlmssp,username=$cifsUser,domain=$cifsUserDomain,password=$ciftsUserPwd $cifsShare mnt/cifshare01

# Unmount share
unmount /mnt/cifshare01