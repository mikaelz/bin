#!/bin/sh

# ~/bin/backup.sh
# 
# https://wiki.archlinux.org/index.php/Rsync#Automated_backup_with_SSH
# https://wiki.archlinux.org/index.php/Full_System_Backup_with_rsync
# http://www.sakana.fr/blog/2008/05/07/securing-automated-rsync-over-ssh/
# https://www.linux.com/news/enterprise/storage/8200-back-up-like-an-expert-with-rsync

time rsync -vhaz --stats --progress -e ssh \
    --exclude ".DS_Store" \
    --exclude "._.DS_Store" \
    --exclude "Thumbs.db" \
    --exclude "thumbs.db" \
    --exclude "desktop.ini" \
    --exclude ".svn" \
    /Volumes/data/Dropbox \
    example.com@example.com:/backup/Dropbox
    # >> backup.log # log output
    # &> /dev/null # no output at all

# TODO
# if sshfs mounted
# time rsync -vhaz --stats --progress -e "ssh -i .ssh/id_rsa USER@example.com" \
#     --exclude ".DS_Store" \
#     --exclude "._.DS_Store" \
#     --exclude "Thumbs.db" \
#     --exclude "thumbs.db" \
#     --exclude "desktop.ini" \
#     --exclude ".svn" \
#     /Volumes/data/Dropbox \
#     /home/USER/backup/Dropbox
#     # &> /dev/null
