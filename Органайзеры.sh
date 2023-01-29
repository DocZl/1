#!/bin/bash
exec 2>> ./log.sh.log
date >>./log.sh.log; echo "start sh Органайзеры">>./log.sh.log DIALOG=${DIALOG=dialog}
                tempfile=`mktemp 2>/dev/null` || tempfile=/tmp/test$$
                trap "rm -f $tempfile" 0 1 2 5 15

                $DIALOG --backtitle "Скрипт установки нужных программ" \
                --title "Органайзеры" --clear \
                --checklist "Программы:" 15 50 4 \
                a Кeepasxc off  \
                b Notion off 2> $tempfile

                retval=$?
                choice=`cat $tempfile`

                if [[ $choice = *"a"* ]];
                then date>>./log.sh.log; echo "sudo snap install keepassxc">>./log.sh.log; sudo snap install keepassxc
                fi

                if [[ $choice =  *"b"* ]];
                then date>>./log.sh.log; echo "sudo snap install notion-snap">>./log.sh.log; sudo snap install notion
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
