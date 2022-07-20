printf  "Entering the Script file...\n"
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt autoremove -y
printf "\nSuccessfully Updated...!\n"
printf "Installing nodejs v14\n"
sudo apt install -y curl
sudo curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
printf "Installing required resources...\n"
sudo apt install -y nodejs mariadb-server redis-server python3-pip nginx python3-testresources
printf "Installed...!"
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

printf "Mysql conf file edited...\n"
sudo systemctl restart mysql
printf "Mysql service Restarted....\n"
sudo mysql -uroot -p << EOF
alter user root@localhost identified by 'Amrita@123';
EOF
printf "Mysql password Amrita@123\n"
sudo npm install -g yarn
printf "Installing Frappe-Bench"
sudo pip3 install frappe-bench
sudo sytemctl restart mariadb
sudo pip3 install frappe-bench
printf "Installed Frappe-bench"
sudo -H pip3 install frappe-bench
sudo apt install git -y
sudo apt install python3.8-venv -y
sudo apt install xdotool -y
cd ~
bench init --frappe-branch version-13 frappe-bench
cd frappe-bench
bench get-app --branch version-13 erpnext
bench new-site demo.in
bench use demo.in
me=$(whoami)
sudo bench setup production $me  --yes
sudo supervisorctl stop all
sudo service nginx stop
printf "Project Starting...\n"
bench --site demo.in serve
#xdotool key ctrl+shift+n
#cd ~
#cd frappe-bench
#sudo bench setup production ranjit --yes
