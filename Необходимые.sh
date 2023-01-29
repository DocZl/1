#!/bin/bash
exec 2>> ./log.sh.log
date >>./log.sh.log; echo "start sh Необходимые">>./log.sh.log
DIALOG=${DIALOG=dialog}
                tempfile=`mktemp 2>/dev/null` || tempfile=/tmp/test$$
                trap "rm -f $tempfile" 0 1 2 5 15

                $DIALOG --backtitle "Скрипт установки нужных программ" \
                --title "Необходимые" --clear \
                --checklist "Программы:" 15 50 4 \
                g qbittorrent off \
                i vivaldi off \
                w RAR off \
                x tweaks off 2> $tempfile

                retval=$?
                choice=`cat $tempfile`

                if [[ $choice = *"g"* ]];
                then date>>./log.sh.log; echo "install qbit">>./log.sh.log; sudo apt-get install qbittorrent -y
                fi

                if [[ $choice = *"i"* ]];
                then date>>./log.sh.log; echo "install vivaldi">>./log.sh.log;
                wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | gpg --dearmor > packages.vivaldi.gpg; sudo install -o root -g root -m 644 packages.vivaldi.gpg /etc/apt/trusted.gpg.d;
                sudo sh -c 'echo "deb [arch=amd64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.vivaldi.gpg] https://repo.vivaldi.com/archive/deb stable main" > /etc/apt/sources.list.d/vivaldi.list';
                rm -f packages.vivaldi.gpg;
                sudo apt update && sudo apt install vivaldi-stable -y
                fi

                if [[ $choice =  *"x"* ]];
                then date>>./log.sh.log; echo "install tweaks">>./log.sh.log; sudo apt-get install synaptic gnome-tweaks  -y
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
