#!/bin/bash


###############################################################################################################################
#                                                                                                                             #
#                                                                                                                             #
#                                                                                                                             #
#                                                                                                                             #
#                                                                                                                             #
#                                                                                                                             #
#                                                                                                                             #
#                                                                                                                             #
#                                                                                                                             #
#                                                                                                                             #
#                                                                                                                             #
#                                                                                                                             #
#                                                                                                                             #
#                                                                                                                             #
#                                                                                                                             #
#                                                                                                                             #
#                                                                                                                             #
#                                                                                                                             #
#                                                                                                                             #
#                                                                                                                             #
#                                                                                                                             #
#                                                                                                                             #
#                                                                                                                             #
#                                                                                                                             #
###############################################################################################################################



#???????????? ???? ???????? ?? ??????????, ???????????? ???????? ???????????? ??????????????????????
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


echo -n -e "



\033[31m

    ### ###  #   #  ### ###     ###  #  ### ###  #  ###
    # # # # ##  ##  # # # #     # # ##  # # # # ##  # #
    # # # #  #   #  # # # #     # #  #  # # # #  #  # #
    # # # #  #   #  # # # #     # #  #  # # # #  #  # #
    ### ### ### ### ### ###     ### ### ### ### ### ### \033[0m

\033[35m
    ###  #   #   #   #  ###      #  ### ### ### ###  #
    # # ##  ##  ##  ##  # #     ##  # # # # # # # # ##
    # #  #   #   #   #  # #      #  # # # # # # # #  #
    # #  #   #   #   #  # #      #  # # # # # # # #  #
    ### ### ### ### ### ###     ### ### ### ### ### ###\033[0m

\033[30m
     #  ###  #   #  ###  #       #   #  ### ###  #   #
    ##  # # ##  ##  # # ##      ##  ##  # # # # ##  ##
     #  # #  #   #  # #  #       #   #  # # # #  #   #
     #  # #  #   #  # #  #       #   #  # # # #  #   #
    ### ### ### ### ### ###     ### ### ### ### ### ### \033[0m




?????????? ????????????????????! ?????????????? ???????????? ???????????????? ????????????."
sleep 5
rm ./log.sh.log
exec 2>> ./log.sh.log
date >>./log.sh.log; echo "start sh">>./log.sh.log
#????????
sudo apt update
sudo apt-get install dialog -y
DIALOG=${DIALOG=dialog}
tempfile=`mktemp 2>/dev/null` || tempfile=/tmp/test$$
trap "rm -f $tempfile" 0 1 2 5 15
$DIALOG --clear --title "????????" \
        --menu "????????????:" 20 51 4 \
        "1"  "???????????????????? ???????????? ?? ????????????????" \
        "2" "???????????????? ?????????????????? ????????????????" \
        "3" "???????????????????????????????????? ????????????????" \
        "4" "???????????????????????????? nextcloud" 2> $tempfile

        retval=$?

choice=`cat $tempfile`

#1 ????????
if [[ $choice = *"1"* ]];
                then SOURCE="${BASH_SOURCE[0]}"
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
                                date >>./log.sh.log; echo "??????????????????.sh script start">>./log.sh.log;
                                sudo chmod -X ./??????????????????.sh
                                bash ./??????????????????.sh
fi





#2 ?????????? ????????
if [[ $choice = *"2"* ]];
                then date >>./log.sh.log; echo "apt remove">>./log.sh.log;
                ls /usr/share/applications
                echo -n "?????????????? ???????????????? ??????????????????: "
                read a
                sudo apt-get --purge remove $a; sudo snap remove $a;
fi


#3 ?????????? ????????
if [[ $choice = *"3"* ]];
                then DIALOG=${DIALOG=dialog}
                tempfile=`mktemp 2>/dev/null` || tempfile=/tmp/test$$
                trap "rm -f $tempfile" 0 1 2 5 15
                $DIALOG --clear --title "????????" \
                --menu "????????????:" 20 51 4 \
                "1"  "???????????????????? ???????????????????????? ?? sudo" \
                "2" "?????????? ????????????????????????" \
                "3" "backup home dir" \
                "4" "restore home dir" 2> $tempfile
                retval=$?
                choice=`cat $tempfile`
                                if [[ $choice =  *"1"* ]];
                                then DIALOG=${DIALOG=dialog}
                                tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
                                trap "rm -f $tempfile" 0 1 2 5 15
                                $DIALOG --title "???????? ????????????" --clear \
                                        --inputbox "????????????! ???????? ????????????\n?????????????? ??????:" 16 51 2> $tempfile
                                               retval=$?
                                choice=`cat $tempfile`
                                date >>./log.sh.log; echo "add user in sudo">>./log.sh.log;
                                sudo usermod -aG sudo $choice;
                                fi

                                if [[ $choice =  *"2"* ]];
                                then DIALOG=${DIALOG=dialog}
                                tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
                                trap "rm -f $tempfile" 0 1 2 5 15
                                $DIALOG --title "???????? ????????????" --clear \
                                        --inputbox "???????????????? ???????????? ????????????????????????\n?????????????? ??????:" 16 51 2> $tempfile
                                               retval=$?
                                choice=`cat $tempfile`
                                date >>./log.sh.log; echo "user creating">>./log.sh.log;  sudo useradd -G adm,sudo,sambashare -p password -s /bin/sh $choice;
                                fi

                                if [[ $choice =  *"3"* ]];
                                then DIALOG=${DIALOG=dialog}
                                tempfile=`tempfile 2>/dev/null` || tempfile=/tmp/test$$
                                trap "rm -f $tempfile" 0 1 2 5 15
                                $DIALOG --title "???????? ????????????" --clear \
                                        --inputbox "???????????????? ???????????? ???????????? ???????????????? ????????????????????\n?????????????? ???????? ?? ???????????????????? ???????????????? '':" 16 51 2> $tempfile
                                               retval=$?
                                choice=`cat $tempfile`
                                date >>./log.sh.log; echo "creating backup">>./log.sh.log;
                                cd /home/$USER
                                sudo tar -zcvpf  $choice'back.tgz'  --exclude=back.tgz --exclude=Nextcloud --exclude=???????? --exclude=.wine --exclude=???????????????? --exclude=.steam  --exclude=.cache/winetricks --exclude=.cache/vivaldi --exclude='.VirtualBox VMs' ./
                                fi

                                if [[ $choice =  *"4"* ]];
                                then  #???????????? ?????? ???????????????? ?? ??????????, ?????? ???????? ???????????? ??????????. ???????????? ???????? ?????? ????????????????
                                SOURCE="${BASH_SOURCE[0]}"
                                while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
                                TARGET="$(readlink "$SOURCE")"

                                if [[ $TARGET == /* ]]; then
                                echo "SOURCE '$SOURCE' is an absolute symlink to '$TARGET'"
                                SOURCE="$TARGET"
                                else
                                DIR="$( dirname "$SOURCE" )"
                                echo "SOURCE '$SOURCE' is a relative symlink to '$TARGET' (relative to '$DIR')"
                                SOURCE="$DIR/$TARGET" #if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
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
                                date >>./log.sh.log; echo "restore backup">>./log.sh.log;
                                sudo tar -xpvf ./back.tgz -C /home/$USER; sudo chown -R alex:alex /home/$USER
                                fi

fi





#4 ?????????? ?????? ???????????? ??????????????
if [[ $choice = *"4"* ]];
                                then SOURCE="${BASH_SOURCE[0]}"
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
                                date >>./log.sh.log; echo "nextcloud script start">>./log.sh.log;
                                sudo chmod -X ./nextcloud.sh
                                bash ./nextcloud.sh
fi
