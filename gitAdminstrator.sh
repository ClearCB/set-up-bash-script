#!/bin/bash

# At this script, we will interact with the application git
# so it will be posible to clone, create, update...remotes or local
# repositories.

# asking if you want to create a new directory / path of work.
# selecting a directory.


# git init

# git config
# git config --list
# git config --global user.name "Your name'
# git config --global user.email "your email'


# git clone
# you need a user from git and the repository. It has to be valid.

# git add

# git commit
# git commit -m "message'


# git push
# git push -u

# git status


# git pull

# git branch

# git checkout

# git restore

# git diff

# rm ? 

# git cache (git ignore)


# CREATE AND MOVE TO DIRECTORY
if [ -d $1 ];
then
	echo "The directory is already created. Moving to it."
	cd $1
else
	mkdir $1
	cd $1
	echo "Directory created. Moving to it."
	# TOREMOVE
	sleep 2
	echo "Removing the directory to keep working."
	cd ..
	rmdir ./$1
	# ENDTOREMOVE
fi

# INSTALL GIT, JAVA AND MAVEN

# First check if it is in the system. Installing it if it is not already.

# hash is finding if the command is working, so we can install or not the program.
if  hash java 2>/dev/null ;
then
	echo "Java already installed"
	sleep 2
else
	echo "Java is not installed. Installing..."
	sleep 2
	sudo apt install default-jdk

fi

if hash git 2>/dev/null ;
then
        echo "Git already installed"
else
        echo "Git is not installed. Preparing to install it..."
	sleep 2
	sudo apt install git
fi

if  hash mvn 2>/dev/null ;
then
        echo "Maven already installed"
else
        echo "Maven is not installed. Installing..."
	sleep 2
	sudo apt install maven
fi

# Update all the dependecies.

echo "Updating package list!"
sudo apt-get update


# Configure Enviromentals variables

echo "Adding the path of the jdk to the Venv"
sleep 1


