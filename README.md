![apromore](http://apromore.org/wp-content/uploads/2018/11/flow.jpg "apromore")

# Apromore Docker v7.0.1

# Overview

This is a distribution of [Apromore Core v7.0.1](http://apromore.org/) that runs in Docker container and includes the following components and plugins:

* Apromore Core Components:
  * Manager 1.1
  * Portal 1.1
  * Fileshare 1.1
  * Editor 1.1
  * BPMNEditor 1.1
* Apromore Core Plugins:
  * BIMP Simulator 1.0.0
  * Compare Tool 1.1.0
  * Log Animation 1.0.0
  * Log Visualizer 1.1.0
  * Predictive Monitor 1.0.0
  * Predictive Training 1.0.0
  * ProDrift 1.1.0
  * Process Discoverer 1.0.0
  * Stage Mining 1.1.0
  * Performance Mining 1.0.0
  * Similarity Search 1.1.0
  * Merge 1.1.0
  * Metrics 1.1.0

# Run Apromore Docker

## Preparation

### Install Docker Desktop

First, please install **Docker Desktop** on your machine based on the OS you are using.

####  - Windows User
Docker Desktop for Windows is Docker designed to run on Windows 10.
You can download Windows version [here](https://download.docker.com/win/stable/Docker%20for%20Windows%20Installer.exe).

####  - Mac User
Docker Desktop - Mac works on OS X Sierra 10.12 and newer macOS releases. You can download Mac OS version [here](https://download.docker.com/mac/stable/Docker.dmg).

####  - Linux User
For Linux versions, please follow [this link](https://download.docker.com/linux/).

>*Please make sure [docker-compose command line tool](https://docs.docker.com/compose/install/) has also been installed. Some Docker distributions may require you to install this separately.*

Start Docker Desktop after installation.

### Configure Docker Desktop
Right-click the Docker icon in the task bar, select Settings/Preferences > Advanced.  
Set CPUs: 4, memory: 4096MB memory, swap: 2048MB

CPUs: By default, Docker Desktop is set to use half the number of processors available on the host machine. In order increase processing power, set this to 4.

Memory: By default, Docker Desktop is set to use 2 GB runtime memory, allocated from the total available memory on your Machine. In order increase RAM, set this to 4096MB.

Swap: Set to 2048MB.

## Download Apromore Docker
Download the lastest [Apromore Docker release](https://github.com/apromore/ApromoreDocker/releases/latest).  
Unzip the downloaded file and open the ApromoreDocker-*version* folder.  

## Start Apromore Docker
Run following script to start the Apromore Docker containers, it may take up to 10 minutes the first time your run this.  

>Windows - run `start.bat`  
>Mac / Linux - run `start`  

Once Apromore Docker started the logs will print the following messages:  
>`<DE0005I> Started plan 'org.apromore.root' version '1.1.0'`  

The logs will indicate that your application is running.  

Open Apromore Web UI: [http://localhost:9000](http://localhost:9000).  
Use credentials `testuser/testuser` to login.

## Stop Apromore Docker

Run following script to stop the Apromore Docker containers.  Your saved works on Apromore Docker will still be there next time you start it.  

>Windows - run `stop.bat`  
>Mac / Linux - run `stop`  

## Uninstall Apromore Docker

Run following script to remove the Apromore Docker container images from your system.  Afterwards you can delete the ApromoreDocker-*version* folder.

***Please backup your work before uninstall Apromore Docker. See [instruction](# Caveats) below on how to backup and restore user data.***

>Windows - run `remove.bat`  
>Mac / Linux - run `remove`  

# Caveats

## Where to find data

Apromore Docker create a data directory on the host system (outside the docker container) and mount this to a directory visible from inside the container. This places the database files and event log files in a known location on the host system, and makes it easy for tools and applications on the host system to access the files.  

>MySQL database: `/wherever/you/keep/ApromoreDocker/apromore/mysql-data`  
>Event Log files: `/wherever/you/keep/ApromoreDocker/apromore/Event-logs_repository`

The downside is that the user needs to make sure that the directory exists, and that e.g. directory permissions and other security mechanisms on the host system are set up correctly.

## How to backup and restore data

We suggest user to backup MySQL database data folder (`/wherever/you/keep/ApromoreDocker/apromore/mysql-data`) and event log files folder (`/wherever/you/keep/ApromoreDocker/apromore/Event-logs_repository`) before uninstall Apromore Docker.

Overwrite MySQL database data folder (`/wherever/you/keep/ApromoreDocker/apromore/mysql-data`) with backup after Apromore Docker installation if you want to restore data.

# Issues

## How to report a issue

If you encountered a problem running this container, you can file an [issue](https://github.com/apromore/ApromoreDocker/issues). For us to provide better support, be sure to include the following information in your issue:

* Host OS and version
* Docker version (docker version)
* Output of docker info
* Version of Apromore Docker
* The step and command you used to run Apromore Docker, and any relevant output you saw (masking any sensitive information)

## Known issues

This section describes issues that users of Apromore Docker may encounter, as well as possible workarounds for these issues.

### Detect Process Drift function doesn't work on Apromore Docker

Due to a known issue that causes `Analize > Detect Process Drift` function doesn't work properly on Linux environment and throw HeadlessException error message.