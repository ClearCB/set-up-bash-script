#!/bin/bash


# CREATE AND MOVE TO DIRECTORY

read -p "Now write the path in which you want to create the project: " pathDirectory
read -p "Please, write the name of the folder in which you want to start working: " directoryName

echo "You are going to create a directory in " $pathDirectory
echo "And the name of it is " $directoryName

while true;
do

	read -p "Are you agree? Y/N " election

	if  [[ $election == "y" || $election == "Y" ]];	then
		break;

	elif [[ $election == "n" || $election == "N" ]]; then
		read -p "Now write the path in which you want to create the project: " pathDirectory
		read -p "Please, write the name of the folder in which you want to start working: " directoryName


		echo "You are going to create a directory in " $pathDirectory
		echo "And the name of it is " $directoryName
	else
		echo "Please, write N or Y."
	fi
done


if [ -d $pathDirectory/$directoryName ];
then
	echo "The directory is already created. Moving to it."
	cd $pathDirectory/$directoryName
else
	mkdir $pathDirectory/$directoryName
	cd $pathDirectory/$directoryName
	echo "Directory created. Moving to it."
 
fi

clear

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

if hash code 2>/dev/null;
then
	echo "Code already installed"
else
	echo "Code is not installed. Installing..."
	sleep 2
	sudo snap install --classic code
fi

echo "Updating package list!"
sudo apt-get update

clear
# Configuration for maven project

echo "Preparing maven project"
sleep 2

# To someone that is not at our class, it should change the groupid.
mvn archetype:generate -DgroupId=edu.carptocraft.$directoryName -DartifactId=$directoryName -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.4 -DinteractiveMode=false

# Configuration for git"

echo "Configuration for git..."

sleep 2
git config --global user.name "ClearCB"
git config --global user.email "acasasgarcia1@cifpfbmoll.eu"

# git push and first commit 
# must be set manualy, after creating a repository on github.
