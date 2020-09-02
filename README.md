![apromore](http://apromore.org/wp-content/uploads/2019/11/Apromore-banner_narrow.png "apromore")

# Apromore Docker Community Edition

# Overview

This is a distribution of Apromore Core that runs in Docker container and includes the following components and plugins:

* Apromore Core Components:
  * Manager
  * Portal
  * Fileshare
  * Editor (legacy)
  * BPMNEditor (bpmn.io-based)
  * CSV Importer
* Apromore Core Plugins:
  * Compare Tool
  * Log Animation
  * ProDrift
  * Process Discoverer
  * Stage based mining and performance
  * Similarity Search
  * Merge models
  * Log filter
  * Annotations

# Run Apromore Docker

### Download Apromore Docker
* Check out the source code using git: `git clone https://github.com/apromore/ApromoreDocker.git`
* Check out `git checkout release/v7.15.0`

### Install Docker Desktop

First, please install **Docker Desktop** on your machine based on the OS you are using:

####  - Ubuntu Users
For Ubuntu 18 users, run `docker_install` to install Docker and Docker-compose.

For other Ubuntu versions, please follow [this link](https://docs.docker.com/install/linux/docker-ce/ubuntu/).

####  - Windows Users
Docker Desktop for Windows is Docker designed to run on Windows 10.
You can download Windows version [here](https://docs.docker.com/docker-for-windows/install/).

####  - Mac Users
Docker Desktop - Mac works on OS X Sierra 10.12 and newer macOS releases. You can download Mac OS version [here](https://docs.docker.com/docker-for-mac/install/).


>*Please make sure [docker-compose command line tool](https://docs.docker.com/compose/install/) has also been installed. Some Docker distributions may require you to install this separately.*

Start Docker Desktop after installation.


 
## Start Apromore Docker
Run following script to start the Apromore Docker containers, it may take few minutes the first time your run this.  

>Linux / Mac  - run `start`
>Windows - run `start.bat`  
  

Once Apromore Docker started the logs will print the following messages:  
>`<DE0005I> Started plan 'org.apromore.root-nix' version '1.1.0'`  

The logs will indicate that your application is running.  

Open Apromore Web UI: [http://localhost:80](http://localhost:80).  
Use credentials `testuser/testuser` to login.

## Stop Apromore Docker

Run following script to stop the Apromore Docker containers.  Your saved works on Apromore Docker will still be there next time you start it.  

>Linux / Mac - run `stop`
>Windows - run `stop.bat`  


## Change Port number:
### If you desire to change the default port number from 80, follow these steps:
1. Stop Apromore.
2. Change port number in docker-compose.yml from 80:9000 to NewPortNumber:9000
3. Start Apromore.
4. Open new terminal window and execute:  `docker exec -it apromore /bin/bash`
5. update opt/apromore/virgo-tomcat-server-3.6.4.RELEASE/repository/usr/site.properties line #45 from site.externalport = 80 to your desired port number using vim
6. update opt/apromore/virgo-tomcat-server-3.6.4.RELEASE/configuration/tomcat-server.xml line #30 to your desired port number using vim


## Uninstall Apromore Docker

Run following script to remove the Apromore Docker container images from your system.  Afterwards you can delete the ApromoreDocker-*version* folder.

***Please backup your work before uninstall Apromore Docker. See [instruction](# Caveats) below on how to backup and restore user data.***

>Linux / Mac - run `remove` 
>Windows - run `remove.bat`  
 

# Caveats

## Where to find data

Apromore Docker creates a data directory on the host system (outside the docker container) and mounts this to a directory visible from inside the container. This places the database files in a known location on the host system, and makes it easy for tools and applications on the host system to access the files.  

>MySQL database: `/wherever/you/keep/ApromoreDocker/mysql-data` 


## How to backup and restore data

We suggest user to backup MySQL database data folder (`/wherever/you/keep/ApromoreDocker/mysql-data`) before uninstall Apromore Docker.

Overwrite MySQL database data folder (`/wherever/you/keep/ApromoreDocker/mysql-data`) with backup after Apromore Docker installation if you want to restore data.

# Issues

## How to report an issue

If you encountered a problem running this container, you can file an [issue](https://github.com/apromore/ApromoreDocker/issues). Or visit our [forum](https://forum.apromore.org/). For us to provide better support, be sure to include the following information in your issue:

* Host OS and version
* Docker version (docker version)
* Output of docker info
* Version of Apromore Docker
* The step and command you used to run Apromore Docker, and any relevant output you saw (masking any sensitive information)
