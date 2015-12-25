#!/usr/bin/env bash


bootstrap() {
  sudo apt-get update
  sudo apt-get upgrade

  echo "Installing dependencies..."
  echo ""
  sudo apt-get -y install python-virtualenv
  sudo apt-get -y install python-setuptools python-pip
  sudo pip install virtualenvwrapper

  sudo su - vagrant -c "export WORKON_HOME=~/envs && source /usr/local/bin/virtualenvwrapper.sh && mkvirtualenv django_demo"
  sudo su - vagrant -c "echo \"export WORKON_HOME=~/envs\" >> ~/.profile"
  sudo su - vagrant -c "echo \"source /usr/local/bin/virtualenvwrapper.sh\" >> ~/.profile"
  sudo su - vagrant -c "echo \"workon django_demo\" >> ~/.profile"
  sudo su - vagrant -c "echo \"cd /vagrant\" >> ~/.profile"
  sudo su - vagrant -c "echo \"alias runserver='python /vagrant/django_demo/manage.py runserver 0.0.0.0:8000'\" >> ~/.profile"

  echo "Installing pip packages..."
  sudo su - vagrant -c "pip install -r /vagrant/requirements.txt"

  echo "DONE! ENJOY, br0!"
  echo "To run Django project type 'runserver'"
  echo "You can reach your webapp on host machine @ 18000 port"

}

export DEBIAN_FRONTEND=noninteractive

bootstrap
