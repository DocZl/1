#!/bin/bash
exec 2>> ./log.sh.log
date >>./log.sh.log; echo "start sh Системные">>./log.sh.log
DIALOG=${DIALOG=dialog}
                tempfile=`mktemp 2>/dev/null` || tempfile=/tmp/test$$
                trap "rm -f $tempfile" 0 1 2 5 15

                $DIALOG --backtitle "Скрипт установки нужных программ" \
                --title "Системные" --clear \
                --checklist "Программы:" 15 50 4 \
                a mc off \
                c tilix off \
                d wget off  \
                e wine off  \
                f winetricks off \
                h virtualbox off  \
                j dkms off \
                k python off  \
                m htop off \
                n lm-sensors off  \
                o gnome-disk-utility off \
                r gdebi off \
                s curl off \
                u eatherwake off \
                v XRDP off \
                x tweaks off \
                y Utility-update-kernel off \
                z Install-custom-kernel-liqurix off  \
                % timeshift off \
                6 cubik off \
                8 ssh off  \
                ! qemu-system off   2> $tempfile

                retval=$?
                choice=`cat $tempfile`

                if [[ $choice =  *"a"* ]];
                then date>>./log.sh.log; echo "install mc">>./log.sh.log; sudo apt-get install mc -y
                fi

                if [[ $choice =  *"c"* ]];
                then date>>./log.sh.log; echo "install tilix">>./log.sh.log; sudo apt-get install tilix -y
                fi

                if [[ $choice =  *"d"* ]];
                then date>>./log.sh.log; echo "install wget">>./log.sh.log; sudo apt-get install wget -y
                fi

                if [[ $choice = *"e"* ]];
                then date>>./log.sh.log; echo "install wine">>./log.sh.log; sudo apt-get install wine -y
                fi

                if [[ $choice =  *"f"* ]];
                then date>>./log.sh.log; echo "install winetricks">>./log.sh.log; sudo apt-get install winetricks -y
                fi

                if [[ $choice =  *"h"* ]];
                then  date>>./log.sh.log; echo "install virtualbox">>./log.sh.log; sudo apt-get install virtualbox-dkms -y ; sudo apt-get install --reinstall linux-headers-$(uname -r) virtualbox-dkms dkms -y; sudo apt-get install virtualbox-qt -y;
                fi

                if [[ $choice =  *"j"* ]];
                then date>>./log.sh.log; echo "install dkms">>./log.sh.log; sudo apt-get install dkms -y
                fi

                if [[ $choice = *"k"* ]];
                then date>>./log.sh.log; echo "install python">>./log.sh.log; sudo apt-get install python -y
                fi

                if [[ $choice = *"m"* ]];
                then date>>./log.sh.log; echo "install htop">>./log.sh.log; sudo apt-get install htop -y
                fi

                if [[ $choice =  *"n"* ]];
                then date>>./log.sh.log; echo "install lm-sensors">>./log.sh.log; sudo apt-get install lm-sensors -y
                fi

                if [[ $choice = *"o"* ]];
                then date>>./log.sh.log; echo "install gnome-disk-utility">>./log.sh.log; sudo apt-get install gnome-disk-utility -y
                fi

                if [[ $choice =  *"r"* ]];
                then date>>./log.sh.log; echo "install gdebi">>./log.sh.log; sudo apt-get install gdebi -y
                fi

                if [[ $choice =  *"s"* ]];
                then date>>./log.sh.log; echo "install curl">>./log.sh.log; sudo apt-get install curl -y
                fi

                if [[ $choice =  *"u"* ]];
                then date>>./log.sh.log; echo "install etherwake">>./log.sh.log; sudo apt-get install etherwake -y
                fi

                if [[ $choice =  *"v"* ]];
                then date>>./log.sh.log; echo "install xrdp">>./log.sh.log; sudo apt-get install xrdp -y; sudo systemctl enable xrdp; sudo systemctl start xrdp
                fi

                if [[ $choice =  *"x"* ]];
                then date>>./log.sh.log; echo "install tweaks">>./log.sh.log; sudo apt-get install synaptic gnome-tweaks  -y
                fi

                if [[ $choice =  *"y"* ]];
                then date>>./log.sh.log; echo "install utulity_update_kernel">>./log.sh.log; sudo apt-add-repository -y ppa:cappelikan/ppa; sudo apt update; sudo apt-get install mainline -y
                fi

                if [[ $choice = *"z"* ]];
                then  date>>./log.sh.log; echo "install liquorix">>./log.sh.log; sudo add-apt-repository ppa:damentz/liquorix -y && sudo apt update && sudo apt-get install linux-image-liquorix-amd64 linux-headers-liquorix-amd64 -y
                fi

                if [[ $choice = *"%"* ]];
                then  date>>./log.sh.log; echo "install timeshift">>./log.sh.log; sudo apt install timeshift -y
                fi

                if [[ $choice = *"6"* ]];
                then date>>./log.sh.log; echo "install cubic">>./log.sh.log; sudo apt-add-repository ppa:cubic-wizard/release; sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6494C6D6997C215E; sudo apt-get install cubic -y
                fi

                if [[ $choice =  *"!"* ]];
                then date>>./log.sh.log; echo "install qemu-system">>./log.sh.log; sudo apt-get install qemu-system -y; sudo apt-get install aqemu -y;
                fi

                if [[ $choice =  *"8"* ]];
                then date>>./log.sh.log; echo "install ssh">>./log.sh.log; sudo apt-get install ssh -y; echo "Port 2222" | sudo tee -a  /etc/ssh/ssh_config; sudo systemctl enable ssh; sudo systemctl start ssh; echo "Port 2222" | sudo tee -a  /etc/ssh/sshd_config; sudo systemctl enable sshd; sudo systemctl start sshd;
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
