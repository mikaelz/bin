#!/bin/sh

# ~/bin/backup.sh
# 
# http://www.sakana.fr/blog/2008/05/07/securing-automated-rsync-over-ssh/
# https://wiki.archlinux.org/index.php/Rsync#Automated_backup_with_SSH
# https://wiki.archlinux.org/index.php/Full_System_Backup_with_rsync
# https://www.linux.com/news/enterprise/storage/8200-back-up-like-an-expert-with-rsync

# man rsync
# -v be verbose
# -h human readable bytes
# -a, --archive archive mode; same as -rlptgoD (no -H) -H hard-links
# -z compress data during transfer
# --progress show file transfer progress
# -e remote shell to use

time rsync -vhaz --progress -e "ssh -i .ssh/id_rsa" \
    --exclude ".DS_Store" \
    --exclude "._.DS_Store" \
    --exclude "Thumbs.db" \
    --exclude "thumbs.db" \
    --exclude "desktop.ini" \
    --exclude ".svn" \
    --exclude ".git" \
    /Volumes/data/Dropbox/ \
    nevillegroup@shell.websupport.sk:/home/nevillegroup/optimalizaciaseosk/backup/Dropbox/
    # >> backup.log # log output
    # &> /dev/null


# needs FTP password
# time rsync -vhaz --progress -e ssh \
#     --exclude ".DS_Store" \
#     --exclude "._.DS_Store" \
#     --exclude "Thumbs.db" \
#     --exclude "thumbs.db" \
#     --exclude "desktop.ini" \
#     --exclude ".svn" \
#     --exclude ".git" \
#     /Volumes/data/Dropbox/ \
#     optimalizaciaseo.sk@optimalizaciaseo.sk:/backup/Dropbox/
#     # >> backup.log # log output
#     # &> /dev/null
