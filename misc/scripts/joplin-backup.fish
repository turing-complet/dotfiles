#!/usr/bin/fish

set BACKUP_DIR ~/code/joplin-backups

cd $BACKUP_DIR
set TS (date +'%Y-%m-%d_%H_%M')
mkdir $TS

joplin sync
joplin --log-level debug export --format raw $TS
tar -cf $TS.tar $TS
git add $TS.tar
git commit -m "Update"
git push origin HEAD
rm -rf $TS
