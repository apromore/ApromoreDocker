# Overview
This is a distribution of [Apromore](http://apromore.org/) that runs in Docker container and includes the following components:
* Apromore Core:
  * Manager 1.1
  * Portal 1.1
  * Fileshare 1.1
  * Editor 1.1
* Apromore Plugins:
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
Install Docker Desktop on your machine, get it from [https://www.docker.com/products/docker-desktop](https://www.docker.com/products/docker-desktop).  
*Note: Docker Desktop for Windows requires Windows 10 Pro*  

Start Docker Desktop after installation.

### Configure Docker Desktop
Right-click the Docker icon in the task bar, select Settings > Advanced.  
Set cpu: 4, memory: 4096MB memory, swap: 2048MB

## Download Apromore Docker
Download the lastest [Apromore Docker release](https://github.com/apromore/ApromoreDocker/releases/latest).  
Unzip the downloaded file and open the ApromoreDocker-*version* folder.  

## Start Apromore Docker
Run this to start the Apromore Docker containers, it may take a few mintues the first time your run this.  

Windows - run `start.bat`  
Mac / Linux - run `start.sh`  

Open Apromore Web UI: [http://localhost:9000](http://localhost:9000) (admin / password)  

## Stop Apromore Docker
Run this to stop the Apromore Docker containers.  Your saved works on Apromore Docker will still be there next time you start it. 

Windows - run `stop.bat`  
Mac / Linux - run `stop.sh`   

## Uninstall Apromore Docker
Run this to remove the Apromore Docker container images from your system.  Afterwards you can delete the ApromoreDocker-*version* folder.

Windows - run `remove.bat`  
Mac / Linux - run `remove.sh`  
