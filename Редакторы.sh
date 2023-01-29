#!/bin/bash
exec 2>> ./log.sh.log
date >>./log.sh.log; echo "start sh Редакторы">>./log.sh.log
DIALOG=${DIALOG=dialog}
                tempfile=`mktemp 2>/dev/null` || tempfile=/tmp/test$$
                trap "rm -f $tempfile" 0 1 2 5 15

                $DIALOG --backtitle "Скрипт установки нужных программ" \
                --title "Редакторы" --clear \
                --checklist "Программы:" 15 50 4 \
                l geany off \
                p nemo off \
                q gedit off  \
                @ pdfarranger off \
                5 kate off 2> $tempfile

                retval=$?
                choice=`cat $tempfile`

                if [[ $choice =  *"l"* ]];
                then date>>./log.sh.log; echo "install geany">>./log.sh.log; sudo apt-get install geany -y
                fi

                if [[ $choice =  *"p"* ]];
                then date>>./log.sh.log; echo "install nemo">>./log.sh.log; sudo apt-get install nemo -y
                fi

                if [[ $choice = *"q"* ]];
                then date>>./log.sh.log; echo "install gedit">>./log.sh.log; sudo apt-get install gedit -y
                fi

                if [[ $choice =  *"r"* ]];
                then date>>./log.sh.log; echo "install gdebi">>./log.sh.log; sudo apt-get install gdebi -y
                fi

                if [[ $choice = *"@"* ]];
                then  date>>./log.sh.log; echo "install pdfarranger">>./log.sh.log; sudo apt install pdfarranger -y
                fi

                if [[ $choice = *"5"* ]];
                then  date>>./log.sh.log; echo "install kate">>./log.sh.log; sudo apt install kate -y
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
