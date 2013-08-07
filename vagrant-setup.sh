#!/bin/bash

# The Ruby version you want to install and use for this Vagrant box
RUBY_VERSION=ruby-1.9.3-p448
PASSENGER_VERSION=4.0.10

sudo -i rvm install $RUBY_VERSION

# Install or update Bundler
rvmsudo gem install bundler

########## Passenger and Apache configuration

# Install Phusion Passenger
if [ ! -f /etc/apache2/mods-available/passenger.load ]; then
        rvmsudo gem install passenger -v $PASSENGER_VERSION
        sudo -i passenger-install-apache2-module
        sudo cp /vagrant/doc/vagrant/passenger.load /etc/apache2/mods-available/passenger.load
        sudo sed -i s/RUBY_VERSION/$RUBY_VERSION/g /etc/apache2/mods-available/passenger.load
        sudo sed -i s/PASSENGER_VERSION/$PASSENGER_VERSION/g /etc/apache2/mods-available/passenger.load
        sudo a2enmod passenger
        sudo service apache2 restart
fi

# Enable the leihs virtual host
if [ ! -f /etc/apache2/sites-available/leihs ]; then
        sudo cp /vagrant/doc/vagrant/leihs /etc/apache2/sites-available/leihs
        sudo a2ensite leihs
        sudo service apache2 reload
fi