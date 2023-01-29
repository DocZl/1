#!/bin/bash
exec 2>> ./log.sh.log
date >>./log.sh.log; echo "start sh Мультимедиа">>./log.sh.log
DIALOG=${DIALOG=dialog}
                tempfile=`mktemp 2>/dev/null` || tempfile=/tmp/test$$
                trap "rm -f $tempfile" 0 1 2 5 15

                $DIALOG --backtitle "Скрипт установки нужных программ" \
                --title "Мультимедиа" --clear \
                --checklist "Программы:" 15 50 4 \
                c steam off \
                t gimp off  \
                7 minidlna off 2> $tempfile

                retval=$?
                choice=`cat $tempfile`

                if [[ $choice = *"c"* ]];
                then date>>./log.sh.log; echo "install steam">>./log.sh.log; sudo apt-get install steam -y
                fi

                if [[ $choice = *"t"* ]];
                then date>>./log.sh.log; echo "install gimp">>./log.sh.log; sudo apt-get install gimp -y
                fi

                if [[ $choice = *"7"* ]];
                then  date>>./log.sh.log; echo "install minidlna">>./log.sh.log; sudo apt-get install minidlna -y; sudo sed -i 's\media_dir=/var/lib/minidlna\media_dir=PV,/home/nas/Загрузки\g' /etc/minidlna.conf && sudo sed -i 's\#db_dir=/var/cache/minidlna\db_dir=/var/cache/minidlna\g' /etc/minidlna.conf && sudo sed -i 's\#friendly_name=\friendly_name=NAS\g' /etc/minidlna.conf && sudo sed -i 's\#inotify=yes\inotify=yes\g' /etc/minidlna.conf && sudo sed -i 's\#notify_interval=895\notify_interval=895\g' /etc/minidlna.conf; sudo systemctl enable minidlna; sudo systemctl start minidlna
                fi
exitstatus=$?
if [ $exitstatus = 0 ]; then
SOURCE="${BASH_SOURCE[0]}"
                                while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
                                TARGET="$(readlink "$SOURCE")"

                                if [[ $TARGET == /* ]]; then
                                echo "SOURCE '$SOURCE' is an absolute symlink to '$TARGET'"
                                SOURCE="$TARGET"
                                else
                                DIR="$( dirname "$SOURCE" )"
                                echo "SOURCE '$SOURCE' is a relative symlink to '$TARGET' (relative to '$DIR')"
                                SOURCE="$DIR/$TARGET" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
                                fi

                                done
                                echo "SOURCE is '$SOURCE'"
                                RDIR="$( dirname "$SOURCE" )"
                                DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

                                if [ "$DIR" != "$RDIR" ]; then
                                echo "DIR '$RDIR' resolves to '$DIR'"
                                fi

                                echo "DIR is '$DIR'"
                                cd $DIR
                                bash ./Программы.sh
fi
