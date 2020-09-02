![apromore](http://apromore.org/wp-content/uploads/2019/11/Apromore-banner_narrow.png "apromore")

# Apromore Docker Community Edition

# Overview

This is a distribution of Apromore Core that runs in Docker container and includes the following components and plugins:

* Apromore Core Components:
  * Manager
  * Portal
  * Fileshare
  * Editor
  * CSV Importer
* Plugins:
  * Log Animation
  * Process Discoverer
  * Stage-based mining and performance
  * Similarity Search
  * Model Merging
  * Log Filter

# Run Apromore Docker

### Download Apromore Docker
* Check out the source code using git: `git clone https://github.com/apromore/ApromoreDocker.git`
* Check out `git checkout release/v7.15.0`

### Install Docker

First, please install **Docker** on your machine based on the OS you are using:

####  - Ubuntu Users
For Ubuntu, install
* [Docker Engine](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
* [Docker Compose](https://docs.docker.com/compose/install/)

####  - Windows Users
Docker Desktop for Windows is Docker designed to run on Windows 10.
You can download Windows version [here](https://docs.docker.com/docker-for-windows/install/).

####  - Mac Users
Docker Desktop - Mac works on OS X Sierra 10.12 and newer macOS releases. You can download Mac OS version [here](https://docs.docker.com/docker-for-mac/install/).

 
## Start Apromore Docker
Run following script to start the Apromore Docker containers, it may take few minutes the first time your run this.  

* For Linux / Mac, execute `sudo ./start` command.
* For Windows, execute `start.bat` command in the command prompt or double click the `start.bat` file. **Note:** Make sure the local directory of the docker folder is added in the Docker Desktop app so that it can mounted into Docker containers. This can be done by navigating to `Settings>Resources>File Sharing` in the Docker Deskop App. 
  

Once Apromore Docker is started the logs will print the following messages:  
>`Started plan 'org.apromore.community' version '1.1.0'`  

The logs will indicate that your application is running.  

Open Apromore Web UI: [http://localhost:80](http://localhost:80).  
Use credentials `admin/password` to login.

## Stop Apromore Docker

Run following script to stop the Apromore Docker containers.  Your saved works on Apromore Docker will still be there next time you start it.  

* For Linux / Mac, execute `sudo ./stop` command.
* For Windows execute `stop.bat` in command prompt.  


## Change Port number:
### If you desire to change the default port number from 80, follow these steps:
1. Stop Apromore (different commands for Windows/Linux).
2. Change port number by modifying line 12 in `docker-compose.yml` from 80:9000 to NewPortNumber:9000
3. Start Apromore (different commands for Windows/Linux).

## Uninstall Apromore Docker

Run following script to remove the Apromore Docker container images from your system.  Afterwards you can delete the ApromoreDocker folder.

***Please backup your work before uninstall Apromore Docker. See [instructions](https://github.com/apromore/ApromoreDocker/tree/master#caveats) below on how to backup and restore user data.***

* For Linux / Mac, execute `sudo ./remove` command. 
* For Windows execute `remove.bat` in command prompt.  
 

# Caveats

## Where to find data

Apromore Docker creates a data directory on the host system (outside the docker container) and mounts this to a directory visible from inside the container. This places the database files in a known location on the host system, and makes it easy for tools and applications on the host system to access the files.  

>MySQL database: `/wherever/you/keep/ApromoreDocker/mysql-data` 

## How to backup and restore data

We suggest user to backup MySQL database data folder (`/wherever/you/keep/ApromoreDocker/mysql-data`) and Event-Logs-Repository folder (`/wherever/you/keep/ApromoreDocker/Event-Logs-Repository`) before uninstalling Apromore Docker.

Replace MySQL database data folder (`/wherever/you/keep/ApromoreDocker/mysql-data`) with the backup folder after Apromore Docker installation if you want to restore data.

Replace Events Log Repository data folder (`/wherever/you/keep/ApromoreDocker/Event-Logs-Repository`) with the backup folder after Apromore Docker installation.

## Change Heap Size (optional) 
User can change Apromore heap size by modifying line 7 `JAVA_OPTS: "-server -Xmx8g -Xmn1g"` in `site.properties` file present in the `/ApromoreDocker` directory.

## Use own Event-Logs-Repository (optional)
In order to use your own Event-Logs-Repository, modify line 12 in `docker-compose.yml` file to `./[PATH_TO_LOG_REPO]:/opt/Event-Logs-Repository`
## Share file to all users (optional)

* By default Apromore does not allow you to share a file with all users (i.e. the "public" group is not supported by default). You can change this by editing the site.properties file present in the `/ApromoreDocker` directory. Specifically, to enable the option to share files and folders with the “public” group, you should set `security.publish.enable = true` in the site.properties file.


## Virgo Admin Console (Security)
* For security purpose, it is advisable to deactivate the virgo admin console.
* Open new terminal window and execute:  `sudo docker exec -it apromore /bin/bash`.
* Navigate to the `/opt/apromore/virgo-tomcat-server-3.6.4.RELEASE/pickup/` and delete `org.eclipse.virgo.management.console_3.6.4.RELEASE.jar`.


# Issues

## How to report an issue

If you encountered a problem running this container, you can file an [issue](https://github.com/apromore/ApromoreDocker/issues). Or visit our [forum](https://forum.apromore.org/). For us to provide better support, be sure to include the following information in your issue:

* Host OS and version
* Docker version (docker version)
* Output of docker info
* Version of Apromore Docker
* The step and command you used to run Apromore Docker, and any relevant output you saw (masking any sensitive information)
