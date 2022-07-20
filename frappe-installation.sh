# Color variables
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'
white='\033[0;37m'
# Clear the color after that
clear='\033[0m'

#bold colors
bld_red='\033[1;31m'
bld_green='\033[1;32m'
bld_yellow='\033[2;33m'
bld_blue='\033[1;34m'
bld_magenta='\033[1;35m'
bld_cyan='\033[1;36m'
bld_white='\033[1;37m'

#background colors
bg_red='\033[0;41m'
bg_green='\033[0;42m'
bg_yellow='\033[0;43m'
bg_blue='\033[0;44m'
bg_magenta='\033[0;45m'
bg_cyan='\033[0;46m'



#text bold
bold=`tput bold`

offbold=`tput rmso`
printf  "${green}Entering the Script file...${clear}\n"

sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt autoremove -y
printf "\n${green}Successfully Updated...!${clear}\n"
printf "${yellow}Installing nodejs v14${clear}\n"
sudo apt install -y curl
sudo curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
printf "${yellow}Installing required resources...${clear}\n"
sudo apt install -y nodejs mariadb-server redis-server python3-pip nginx python3-testresources
printf "${bold}${green}Resources Installed...!${offblod}${clear}\n"
printf "
[client-server]\n
!includedir /etc/mysql/conf.d/\n
!includedir /etc/mysql/mariadb.conf.d/\n

[mysqld]\n
character-set-client-handshake = FALSE\n
character-set-server = utf8mb4\n
collation-server = utf8mb4_unicode_ci\n
[mysql]\n
default-character-set = utf8mb4" > /etc/mysql/my.cnf

printf "${green}Mysql conf file edited...${clear}\n"
sudo systemctl restart mysql
printf "${blue}Mysql service Restarted....${clear}\n"
sudo mysql -uroot -p << EOF
alter user root@localhost identified by 'Amrita@123';
EOF
printf "${bg_yellow}Mysql DB root password Amrita@123${clear}\n"
sudo npm install -g yarn
printf "${yellow}Installing Frappe-Bench${clear}"
sudo pip3 install frappe-bench
sudo sytemctl restart mariadb
sudo pip3 install frappe-bench
printf "${green}Installing bench components...!${clear}\n"
sudo -H pip3 install frappe-bench
sudo apt install git -y
sudo apt install python3.8-venv -y
sudo apt install xdotool -y
cd ~
bench init --frappe-branch version-13 frappe-bench
cd frappe-bench
bench get-app --branch version-13 erpnext
bench new-site first-site
bench use first-site
me=$(whoami)
printf "${yellow}Moving to production mode${clear}\n"
sudo bench setup production $me  --yes
sudo supervisorctl stop all
sudo service nginx stop
cd ~
cd frappe-bench
printf "${yellow}Project Starting...${clear}\n"
bench --site first-site install-app erpnext
bench --site first-site serve
