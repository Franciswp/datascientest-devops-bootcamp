exit
tmux
exit
pwd
mariadb --version
sudo apt update -y
sudo apt install mariadb-server mariadb-client -y
sudo apt install -y software-properties-common
sudo apt-key adv --fetch-keys 'https://mariadb.org/mariadb_release_signing_key.asc'
sudo add-apt-repository 'deb [arch=amd64,arm64,ppc64el] https://mariadb.mirror.liquidtelecom.com/repo/10.6/ubuntu focal main'
sudo apt update && sudo apt install -y mariadb-server mariadb-client
mariadb --version
sudo systemctl status mariadb
sudo systemctl start mariadb
sudo systemctl enable mariadb
sudo mysql_secure_installation
sudo mariadb -u root -p
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y docker-ce=5:25.0.0~3-0~ubuntu
docker --version
sudo systemctl start docker
sudo systemctl enable docker
sudo chmod +x docker.sh
./docker.sh
#!/bin/bash
sudo apt-get update
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y docker-ce=5:25.0.0~3-0~ubuntu
docker --version
sudo systemctl start docker
sudo systemctl enable docker
sudo chmod +x docker.sh
./docker.sh
pwd
mkdir docker.sh
sudo chmod +x docker.sh
./docker.sh
sudo chmod +x docker.sh
./docker.sh
sudo chmod +x docker.sh
./docker.sh
sudo chmod +x docker.sh
touch docker.sh
sudo chmod +x docker.sh
./docker.sh
vagrant version
sudo apt update 
sudo apt upgrade
vagrant plugin install docker
vagrant plugin list
mkdir datascientest_vagrant 
cd datascientest_vagrant
vagrant init hashicorp/bionic64
cat Vagrantfile
vagrant validate
vagrant up
vagrant ssh-config
vagrant ssh
cd 
pwd
vagrant ssh
cd datascientest_vagrant/
vagrant ssh
touch Dockerfile
docker build -t datascientest:vagrant .
vagrant up
ssh vagrant@172.17.0.2 -p 22 -i /home/ubuntu/.vagrant.d/insecure_private_key 
cd
ssh vagrant@172.17.0.2 -p 22 -i /home/ubuntu/.vagrant.d/insecure_private_key 
pwd
ssh vagrant@172.31.16.174 -p 22 -i /home/ubuntu/.vagrant.d/insecure_private_key 
ssh vagrant@172.31.16.174 -p 22 -i /home/ubuntu/.vagrant.d/data_enginering_machine.pem
ssh vagrant@172.17.0.2 -p 22 -i /home/ubuntu/.vagrant.d/insecure_private_key 
cd datascientest_vagrant/
vagrant destroy
vagrant up
vagrant destroy
vagrant ssh
vagrant up
vagrant ssh
docker build -t datascientest:vagrant .
vagrant up
ssh vagrant@172.17.0.2 -p 22 -i /home/ubuntu/.vagrant.d/insecure_private_key 
cd
ssh vagrant@172.17.0.2 -p 22 -i /home/ubuntu/.vagrant.d/insecure_private_key 
vagrant ssh
cd datascientest_vagrant/
vagrant ssh
vagrant up
vagrant destroy
docker build -t datascientest:vagrant .
vagrant up
ssh vagrant@172.17.0.2 -p 22 -i /home/ubuntu/.vagrant.d/insecure_private_key 
vagrant ssh
vagrant destroy
vagrant ssh-config
vagrant up
vagrant ssh-config
vagrant ssh
docker build -t datascientest:vagrant .
vagrant up
ssh vagrant@172.17.0.2 -p 22 -i /home/ubuntu/.vagrant.d/insecure_private_key 
vagrant ssh
vagrant destroy
docker build -t datascientest:vagrant .
vagrant up
vagrant ssh
ssh vagrant@172.17.0.2 -p 22 -i /home/ubuntu/.vagrant.d/insecure_private_key 
vagrant ssh-config
ssh vagrant@127.0.0.1 -p 2222 -i /home/ubuntu/.vagrant.d/insecure_private_key 
docker build -t datascientest:vagrant .

vagrant ssh
vagrant destroy
docker build -t datascientest:vagrant .
vagrant up
vagrant destroy
vagrant ssh
ssh vagrant@127.0.0.1 -p 2222 -i /home/ubuntu/.vagrant.d/insecure_private_key 
vagrant ssh-config
docker build -t datascientest:vagrant .
vagrant ssh-config
vagrant up
vagrant ssh
vagrant up
vagrant ssh-config
vagrant up
vagrant provision
vagrant --provision
vagrant -- provision
vagrant list-commands
vagrant ssh
vagrant validate
clear
cd datascientest_vagrant/
vagrant validate
docker build -t datascientest:vagrant .
vagrant up
vagrant ssh-config
vagrant ssh
vagrant up
vagrant ssh
ssh vagrant@127.0.0.1 -p 2222 -i /home/ubuntu/.vagrant.d/insecure_private_key 
vagrant up
vagrant provision
exit
cd datascientest_vagrant/
ssh vagrant@127.0.0.1 -p 2222 -i /home/ubuntu/.vagrant.d/insecure_private_key 
vagrant up
vagrant ssh 
ls /vagrant/
vagrant status
vagrant halt
vagrant status
vagrant global-status
vagrant global-status --prune
vagrant resume
vagrant reload
vagrant up
vagrant ssh 
vagrant reload
ssh vagrant@127.0.0.1 -p 2222 -i /home/ubuntu/.vagrant.d/insecure_private_key 
vagrant reload
vagrant up
vagrant destroy
vagrant ssh 
sudo apt-get install nginx -y 
docker build -t datascientest:vagrant .
vagrant up
ssh vagrant@127.0.0.1 -p 2222 -i /home/ubuntu/.vagrant.d/insecure_private_key 
vagrant ssh-config
vagrant global-status --prune
sudo apt-get install nginx -y 
vagrant validate
vagrant up
vagrant reload
vagrant validate
vagrant up
vagrant ssh-config
ssh vagrant@127.0.0.1 -p 2222 -i /home/ubuntu/.vagrant.d/insecure_private_key 
vagrant ssh 
sudo apt-get install nginx -y 
sudo systemctl enable --now nginx
vagrant ssh 
vagrant destroy -f
sudo apt update && sudo apt upgrade -y # we update the packages and the operating system
sudo apt install nginx -y # we install nginx and automatically validate with the -y flag
sudo systemctl enable nginx # start the service on every system reboot
sudo systemctl start nginx # start the service now
sudo systemctl status nginx # check the status of the nginx service
cd /etc/nginx #move to the nginx directory
ls -larth #display file and directory list with all information
cat nginx.conf
sudo mv nginx.conf nginx.conf.backup # rename the nginx.conf file to nginx.conf.backup
sudo touch nginx.conf # creates a new empty file
sudo nano /etc/nginx/nginx.conf
sudo nginx -t
sudo systemctl restart nginx
sudo nginx -s reload
curl -i http://frankapp.ip-ddns.com
curl -i http://cours1.frankapp.ip-ddns.com
curl -i http://frankapp.ip-ddns.com
nginx version
nginx --version
nginx -- version
nginx -- help
nginx help
ls
ls -a
cd datascientest_vagrant/
ls -a
cd 
pwd
sudo apt update && sudo apt upgrade -y # we update the packages and the operating system
sudo apt install nginx -y # we install nginx and automatically validate with the -y flag
sudo systemctl enable nginx # start the service on every system reboot
sudo systemctl start nginx # start the service now
sudo systemctl status nginx # check the status of the nginx service
sudo systemctl enable nginx
sudo systemctl start nginx
sudo systemctl status nginx
sudo apt remove nginx -y
sudo dnf remove nginx -y
nginx -v
sudo apt update && sudo apt upgrade -y # we update the packages and the operating system
sudo apt install nginx -y # we install nginx and automatically validate with the -y flag
nginx # start the service on every system reboot
sudo systemctl start nginx # start the service now
sudo systemctl status nginx # check the status of the nginx service
nginx -V
sudo apt remove nginx -y
sudo yum remove nginx -y
sudo dnf remove nginx -y
cd datascientest_vagrant/
nginx -vnginx -v
nginx -v
nginx # start the service on every system reboot
sudo systemctl start nginx # start the service now
sudo systemctl status nginx # check the status of the nginx service
sudo apt remove nginx -y
sudo apt purge nginx -y  # Removes configuration files as well
sudo apt autoremove -y   # Cleans up unused dependencies
nginx -v
sudo apt update && sudo apt upgrade -y # we update the packages and the operating system
sudo apt install nginx -y # we install nginx and automatically validate with the -y flag
nginx # start the service on every system reboot
sudo systemctl start nginx # start the service now
sudo systemctl status nginx # check the status of the nginx service
cd /etc/nginx #move to the nginx directory
ls -larth #display file and directory list with all information
cat nginx.conf
cd
cd datascientest_vagrant/
cat nginx.conf
cd /etc/nginx
cat nginx.conf
sudo mv nginx.conf nginx.conf.backup # rename the nginx.conf file to nginx.conf.backup
sudo touch nginx.conf # creates a new empty file
sudo nano /etc/nginx/nginx.conf
sudo nginx -t
sudo systemctl restart nginx
sudo nginx -s reload
sudo nano /etc/nginx/nginx.conf
sudo nginx -t
sudo nano /etc/nginx/nginx.conf
sudo nginx -t
sudo nano /etc/nginx/nginx.conf
sudo nginx -t
sudo nano /etc/nginx/nginx.conf
sudo nginx -t
sudo systemctl restart nginx
sudo nginx -s reload
curl -i http://cours1.cours-datascientest.cloudns.ph
sudo nano /etc/nginx/nginx.conf
sudo nginx -t
sudo systemctl restart nginx
sudo nginx -s reload
curl -i http://frankapp.ip-ddns.com
sudo nano /etc/nginx/nginx.conf
sudo nginx -t
sudo systemctl restart nginx
sudo nginx -s reload
curl -i http://frankapp.ip-ddns.com
sudo nano /etc/nginx/nginx.conf
sudo nginx -t
sudo nano /etc/nginx/nginx.conf
cd datascientest_vagrant/
nginx -v
cd /etc/nginx #move to the nginx directory
ls -larth #display file and directory list with all information
cat nginx.conf
sudo nano /etc/nginx/nginx.conf
sudo nginx -t
sudo nano /etc/nginx/nginx.conf
sudo nginx -t
sudo nano /etc/nginx/nginx.conf
clear
sudo nginx -t
sudo nano /etc/nginx/nginx.conf
sudo nginx -t
sudo mv nginx.conf nginx.conf.backup # rename the nginx.conf file to nginx.conf.backup
sudo touch nginx.conf # creates a new empty file
sudo nano /etc/nginx/nginx.conf
sudo nginx -t
sudo nano /etc/nginx/nginx.conf
sudo nginx -t
sudo nano /etc/nginx/nginx.conf
sudo nginx -t
ls
rm nginx.conf12
sudo nano /etc/nginx/nginx.conf
sudo nginx -t
sudo nano /etc/nginx/nginx.conf
sudo systemctl restart nginx
sudo nginx -s reload
sudo nginx -t
sudo nano /etc/nginx/nginx.conf
sudo nginx -t
sudo systemctl restart nginx
sudo nginx -s reload
curl -i http://cours1.dev-datascientest.cloudns.net
sudo nano /etc/nginx/nginx.conf
sudo nginx -t
sudo systemctl restart nginx
sudo nano /etc/nginx/nginx.conf
sudo nginx -t
sudo nano /etc/nginx/nginx.conf
sudo nginx -t
sudo nano /etc/nginx/nginx.conf
sudo nginx -t
sudo nano /etc/nginx/nginx.conf
sudo nginx -t
sudo systemctl restart nginx
sudo nano /etc/nginx/nginx.conf
sudo nginx -t
sudo systemctl restart nginx
sudo nginx -s reload
curl -i http://cours1.dev-datascientest.cloudns.net
curl -i http://serveurnginx.dev-datascientest.cloudns.net
curl -i http://laboratory.dev-datascientest.cloudns.net
cd ..
cd hosts
cd nginx
sudo nano /etc/hosts
sudo nginx -s reload
sudo nano /etc/hosts
sudo nginx -s reload
curl -i http://lab.dev-datascientest.cloudns.net
curl -i http://serveurnginx.dev-datascientest.cloudns.net
curl -i http://lab.dev-datascientest.cloudns.net
ls
pwd
cd
pwd
ls
cd datascientest_vagrant/
ls
cd 
ls -larth /
cd /var
cd 
cd /var/www/
sudo mkdir datascientest_website
cd datascientest_website
sudo touch index.html # create the file index.html in which we add the content "welcome to the nginx course"
ls
sudo nano /etc/hosts
sudo nano /etc/nginx/nginx.conf
sudo nginx -s reload
curl serveurnginx.csudo nginx -s reload
cd
cd datascientest_vagrant/
sudo nginx -s reload
curl serveurnginx.dev-datascientest.cloudns.net
sudo nano /etc/nginx/nginx.conf
sudo nginx -s reload
curl serveurnginx.dev-datascientest.cloudns.net
sudo systemctl restart nginx
sudo nginx -s reload
curl serveurnginx.dev-datascientest.cloudns.net
sudo nano /etc/nginx/nginx.conf
sudo nginx -s reload
curl -i http://lab.dev-datascientest.cloudns.net
ls -larth /etc/nginx
cat /etc/nginx/mime.types
cd datascientest_vagrant/
sudo nano /etc/nginx/nginx.conf
sudo nginx -s reload
curl -i http://lab.dev-datascientest.cloudns.net
curl serveurnginx.dev-datascientest.cloudns.net
sudo nano /etc/nginx/nginx.conf
sudo nginx -s reload
curl serveurnginx.dev-datascientest.cloudns.net/cours
sudo nano /etc/nginx/nginx.conf
sudo nginx -s reload
curl serveurnginx.dev-datascientest.cloudns.net
curl -i http://lab.dev-datascientest.cloudns.net/cours
sudo nano /etc/nginx/nginx.conf
sudo nginx -s reload
curl -i http://lab.dev-datascientest.cloudns.net/cours
cd datascientest_website
sudo nano /etc/hosts
cd datascientest_website
cd
cd datascientest_website
cd /var/www/datascientest_website/
ls
touch apropos.html
cd /var/www/datascientest_website/touch apropos.html
ls
touch apropos.html
ls -ld datascientest_website
sudo touch datascientest_website/apropos.html
chmod u+w datascientest_website
sudo touch apropos.html
ls
sudo nano /etc/nginx/nginx.conf
sudo nginx -s reload
curl -i http://lab.dev-datascientest.cloudns.net/apropos
sudo systemctl restart nginx
sudo nginx -s reload
curl -i http://lab.dev-datascientest.cloudns.net/apropos
sudo nano /etc/nginx/nginx.conf
sudo nginx -s reload
curl -i http://lab.dev-datascientest.cloudns.net/apropos
sudo nano /etc/hosts
sudo systemctl restart nginx
sudo nginx -s reload
curl -i http://laboratory.dev-datascientest.cloudns.net/apropos
curl -i http://laboratory.dev-datascientest.cloudns.net/home
cd
pwd
cd datascientest_vagrant/
cd
mariadb --version
sudo mariadb -u -p
cd datascientest_vagrant/
mariadb --version
sudo mariadb -u -p
cd
sudo mariadb -u root -p
git status
git init
git status
git remote -v
git add .
git commit -m"progress commits"
git remote add origin https://github.com/Franciswp/Aug-2025-DevOPs-DataScienceTest.git
git remote -v
git push
git push --set-upstream origin https://github.com/Franciswp/Aug-2025-DevOPs-DataScienceTest.git
git push --set-upstream origin https://github.com/Franciswp/Aug-2025-DevO
git push --set-upstream origin master https://github.com/Franciswp/Aug-2025-DevOPs-DataScienceTest.git
git push --set-upstream origin master
git fetch
git status
git add .
git commit -m"progress commits"
git restore
git reset HEAD
git status
git push
git push --set-upstream origin master
git remote remove origin
git remote -v
git remote add origin https://github.com/Franciswp/datascientest_devops_camp2025.git
git branch -M main
git push -u origin main
git status
clear
git fetch
git remote prune origin
git status
git remote remove origin
git remote add origin https://github.com/Franciswp/datascientest_devops_camp2025.git
git branch -M main
git push -u origin main
git init                              # Initialize a new Git repository (if not already done)
git add .                             # Stage all changes
git commit -m "Initial commit"        # Commit the changes
git remote add origin https://github.com/Franciswp/datascientest_devops_camp2025.git
git branch -M main
git push -u origin main
git remote -v
git push
git push --set-upstrem origin main
git push
git push --set-upstrem origin main git remote add origin https://github.com/Franciswp/datascientest_devops_camp2025.git
git branch -M main
git push -u origin main
git remote add origin https://github.com/Franciswp/datascientest_devops_camp2025.git
git branch -M main
git push -u origin main
git remote remove origin
git remote add origin https://github.com/Franciswp/datascientest_devops_camp2025.git
git pull --rebase origin main
git push -u origin maingit pull --rebase origin main
git push -u origin main
git push -u origin main --force
gh auth login
# or
git remote set-url origin git@github.com:Franciswp/datascientest_devops_camp2025.git
# ensure your SSH key is added to GitHub
git push
git push --set-upstrem origin main
clear
git init
git status
git restore .
git status
clear
git status
git init
git remote add origin https://github.com/Franciswp/datascientest_devops_camp2025.git
git branch -M main
git push -u origin main
echo "# datascientest_devops_camp2025" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/Franciswp/datascientest_devops_camp2025.git
git push -u origin main
git remote origin
git remote -v
git remote remove origin
git remote -v
git remote add origin https://github.com/Franciswp/datascientest_devops_camp2025.git
git branch -M main
git push -u origin main
git push -u origin main --force
git remote -v
git remote remove origin
git remote -v
git prune
git remote add origin https://github.com/Franciswp/2025-devops-datascientest.git
git branch -M main
git push -u origin main
git remote -v
git remote remove origin
git remote -v
git init
git remote add origin https://github.com/IUCampus/devops_bootcamp_2025.git
git branch -M main
git push -u origin main
git remote set-url origin https://github.com/Franciswp/datascientest_devops_camp2025.git
git branch -M main
git push -u origin main
# set origin to your fork and add upstream
git remote remove origin
git remote add origin https://github.com/Franciswp/devops_bootcamp_2025.git
git remote add upstream https://github.com/IUCampus/devops_bootcamp_2025.git
git push -u origin main
# create PR (optional, requires gh)
gh pr create --fill --base main --head Franciswp:main# set origin to your fork and add upstream
git remote remove origin
git remote add origin https://github.com/Franciswp/devops_bootcamp_2025.git
git remote add upstream https://github.com/IUCampus/devops_bootcamp_2025.git
git push -u origin main
# create PR (optional, requires gh)
gh pr create --fill --base main --head Franciswp:main
# verify current remotes and local user
git remote -v
git config user.name
git config user.email
# authenticate with GitHub CLI (recommended)
gh auth login
gh auth status
git remote -v
git push --set-upstrem origin main
git push --set-upstream origin main
git remote -v
git remote remove origin https://github.com/Franciswp/devops_bootcamp_2025.git 
git remote -v
git remote remove origin devops_bootcamp_2025.git 
exit
git status
git add .
git status
git commit -m"New VS Code updates"
git remote -v
git remote origin .
git remote origin
git remote origin https://github.com/Franciswp/devops_bootcamp_2025.git 
git remote origin Franciswp/devops_bootcamp_2025.git 
git remote origin devops_bootcamp_2025.git 
git remote  /Franciswp/devops_bootcamp_2025.git 
git remote remove origin https://github.com/Franciswp/devops_bootcamp_2025.git 
git remote remove  https://github.com/Franciswp/devops_bootcamp_2025.git 
git remote remove Franciswp/devops_bootcamp_2025.git 
git remote remove origin --all
git remote remove origin .
git remote remove https://github.com/IUCampus/devops_bootcamp_2025.git 
git remote remove IUCampus/devops_bootcamp_2025.git 
git remote -v
git remote remove origin
git remote -v
git remote set-url origin https://github.com/IUCampus/devops_bootcamp_2025.git
git push --set-upstream  origin https://github.com/IUCampus/devops_bootcamp_2025.git
git push --set-upstream  origin main
git push -u upstream main --force
git clear
clear
git remote add origin https://github.com/IUCampus/devops_bootcamp_2025.git
git branch -M main
git push -u origin main
git remote -v
git remote remove origin
git remote remove upstream
git remote -v
clear
git remote -v
git remote add origin https://github.com/Franciswp/datascientest-devops-bootcamp.git
git branch -M main
git push -u origin main
git status
git add .
git status
git restore .
git status
git restore 
git restore .
git status
git restore HEAD
it reset HEAD
git reset HEAD
clear
git status
clear
git status
git add .gitignore
git commit -m"added git ignore"
git restore
git restore .gitignore
git status
git add .gitignore
git status
git prune
git restore --staged path/to/file
# or (older Git)
git restore --staged .
# or
git reset HEAD .
clear
git status
git config --global core.compression 9
git remote -v
git add .
git commit -m"modfication vscode"
git commit -m"modfication vscode"git config --global user.name
git commit -m "modfication vscode"
git push
git push --set-upstream origin main
clear
ls
ls -a
rm -r ./.git
rm -r .git
gitconfig
git config
clear
git remote -v
git init
git remote -v
git remote add origin https://github.com/Franciswp/datascientest-devops-bootcamp.git
git branch -M main
git push -u origin main
git prune
git push -u origin main
git branch
git branch -m  main
git branch -m master main
git add .
git commit -m "Initial commit"
git push -u origin main
git remote set-url origin https://github.com/Franciswp/datascientest-devops-bootcamp.git
# Check your current branch and rename if necessary
git branch -m master main
# Stage and commit your changes
git add .
git commit -m "Initial commit"
# Push to the remote repository
git push -u origin main
exit
sudo nano /etc/php/7.4/fpm/php.ini
sudo apt-get install nginx mariadb-server php php-fpm php-curl php-mysql php-gd php-mbstring php-xml php-imagick php-zip php-xmlrpc -y
php -v
sudo nano /etc/php/7.4/fpm/php.ini
sudo apt uninstall nginx mariadb-server php php-fpm php-curl php-mysql php-gd php-mbstring php-xml php-imagick php-zip php-xmlrpc -y
sudo cp /etc/php/7.4/fpm/php.ini /etc/php/7.4/fpm/php.ini.bak
dpkg -S /etc/php/7.4/fpm/php.ini
# note the package name printed (e.g. php7.4-fpm or php7.4-common)
pkg=$(dpkg -S /etc/php/7.4/fpm/php.ini | cut -d: -f1)
sudo apt-get update
# restore missing conffiles from package
sudo apt-get -o Dpkg::Options::="--force-confmiss" --reinstall install "$pkg"
sudo systemctl restart php7.4-fpm
sudo nano /etc/php/7.4/fpm/php.ini
sudo mariadb -u root -p
clear
cd /var/www/html
sudo wget https://wordpress.org/latest.tar.gz
sudo tar -zxvf latest.tar.gz
sudo mv /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php
sudo nano /var/www/html/wordpress/wp-config.php
sudo chown -R www-data:www-data /var/www/html/wordpress
sudo chmod -R 755 /var/www/html/wordpress
sudo apt-get install nginx mariadb-server php php-fpm php-curl php-mysql php-gd php-mbstring php-xml php-imagick php-zip php-xmlrpc -y
php -v
maridb --version
mariadb --version
sudo nano /etc/php/7.4/fpm/php.ini
