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

# This allows us to check if a directory exist or not. (True/False)
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


# INSTALL GIT, JAVA, MAVEN AND VSCODE
echo "Getting ready Java, Git, Maven and Vscode"
sleep 2

# First check if it is in the system. Installing it if it is not already. Hash allows us to store (shows with -t argument) the directory and error if not.
# Java
if  hash java 2>/dev/null ;
then
	echo "Java already installed"
	sleep 2
else
	echo "Java is not installed. Installing..."
	sleep 4
	sudo apt install default-jdk
	echo "Java installed"
	sleep 2
	clear

fi

# Git
if hash git 2>/dev/null ;
then
        echo "Git already installed"
	sleep 2
else
        echo "Git is not installed. Preparing to install it..."
	sleep 4
	sudo apt install git
	echo "Git installed"
	sleep 2
	clear
fi

# Maven
if  hash mvn 2>/dev/null ;
then
        echo "Maven already installed"
	sleep 2
else
        echo "Maven is not installed. Installing..."
	sleep 4
	sudo apt install maven
	echo "Maven installed"
	sleep 2
	clear
fi

# VS-Code
if hash code 2>/dev/null;
then
	echo "Code already installed"
	sleep 2
else
	echo "Code is not installed. Installing..."
	sleep 4
	sudo snap install --classic code
	echo "Vscode installed"
	sleep 2
	clear
fi

clear
echo "Updating package list!"
sudo apt-get update
clear

# Configuriation for git
echo "Configuration to git..."
sleep 1
echo "Setting the email and username"
sleep 1

# This should be change to your own information
git config --global user.name "Abel Casas"
git config --global user.email acasasgarcia1@cifpfbmoll.eu

clear

# Configuration for maven project
echo "Preparing maven project"
sleep 2

# Since this script is created for me, someone just should change the information is stored here.
mvn archetype:generate -DgroupId=edu.carptocraft.$directoryName -DartifactId=$directoryName -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.4 -DinteractiveMode=false

sleep 2
clear

# Creating git repository
while true;
do
	sleep 2
        read -p "Do you want to start a git repository now? " election
	
        if  [[ $election == "y" || $election == "Y" ]]; then
		echo "Starting a git repository in the actual directory"
		echo $directoryNAme >> README.md
		git init;
		git add .
		git commit -m "first commit"
		echo "Made the first commit"
		sleep 2
		git branch -M main

		while true;
		do

			read -p "Please, copy the URL of the repository that will be link with this local repository: " urlGitRepository

			echo "You are going to push the actual git repository to the following link: " $urlGitRepository

			read -p "Are you agree? Y/N  " electionGit

			if  [[ $electionGit == "y" || $electionGit == "Y" ]];then

				git remote add origin $urlGitRepository
				git push -u origin main
				echo "Git linked correctly."
				sleep 2
				break;

        		elif [[ $electionGit == "n" || $electionGit == "N" ]]; then


				echo "Ok, get the url and try again."
				sleep 2
        		else
                		echo "Please, write N or Y."
        		fi

		done
		echo "Repository created"


		sleep 2
		break;

        elif [[ $election == "n" || $election == "N" ]]; then
                echo "Okay, remember that your proyect is not connected to git yet."
		break;
else
		echo "Please, write Y/N"
        fi
done

# Add new dependecies? yes or no, then finall execution.
while true;
do

        read -p "Do you want to install more dependencies?: Y/N  " election

        if  [[ $election == "n" || $election == "N" ]]; then
		clear
		sleep 1
		echo "Ok, it was a pleasure to serve you. See you!"
		sleep 2
		break;

        elif [[ $election == "y" || $election == "Y" ]]; then
                read -p "Write the following the dependencie you want to install: " dependency

                echo "Trying to install with apt-get: " $dependency
		sudo apt-get $dependency 2>/dev/null
		sleep 2

		if  hash $dependency 2>/dev/null ;then

	        	echo $dependency" already installed"
        		sleep 2
		else
        		echo $dependency" is not installed. Something went wrong...try to install it manually later."
        		sleep 2

		fi

        else
                echo "Please, write N or Y."
        fi
done
