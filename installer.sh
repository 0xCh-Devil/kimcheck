#!/bin/bash

#Colors
cyan='\e[0;36m'
green='\e[0;32m'
lightgreen='\e[1;32m'
white='\e[1;37m'
red='\e[1;31m'
yellow='\e[1;33m'
blue='\e[1;34m'
#Check root exist
[[ `id -u` -eq 0 ]] > /dev/null 2>&1 || { echo  $red "You must be root to run the script"; exit 1; }
echo "   ";

echo "                      Setup Script for kimcheck v0.7 "       
echo -e $green "[ ! ] Moving kimcheck folder "
mkdir /usr/share/kimcheck
cp kimcheck.py /usr/share/kimcheck
echo -e $blue "[ ✔ ]Done"
echo "installing requirements...."
pip install -r requirements.txt
echo -e $yellow "[ ! ]  Creating shortcut command kimcheck"
echo "#!/bin/sh" >> /usr/bin/kimcheck
echo "cd /usr/share/Dzjecter" >> /usr/bin/kimcheck
echo "exec python kimcheck.py \"\$@\"" >> /usr/bin/kimcheck
chmod +x /usr/bin/kimcheck
echo -e $green ""
echo "------------------------------------" 
echo "| [ ✔ ]installation completed[ ✔ ] |" 
echo "------------------------------------" 
echo
echo -e $green "#####################################"
echo -e $blue "|Now Just Type In Terminal (kimcheck)|"
echo -e $green "#####################################"
exit
