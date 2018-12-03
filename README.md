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

# Running Apromore on Docker

## Prerequisites
Install Docker Desktop on your machine, get it from [https://www.docker.com/products/docker-desktop](https://www.docker.com/products/docker-desktop).  

Verify Docker Desktop is installed by running the following in cmd or terminal:  
`docker version` docker version info should be returned.  
`docker-compose version` docker-compose version info should be returned.  

*Note: Docker Desktop for Windows requires Windows 10 Pro*  
*Recommend increasing Docker resources to: cpu 4, memory 4096MB memory, swap 2048MB*

## Preparation
Download the lastest [Apromore Docker release](https://github.com/apromore/ApromoreDocker/releases/latest).  
Unzip the downloaded file, open a cmd or terminal window and change into the ApromoreDocker-*version* folder.  

## Start Apromore Docker
Run this command to start the Apromore Docker containers, it may take a few mintues the first time your run this.  
`docker-compose up -d`  

Apromote Web UI: [http://localhost:9100](http://localhost:9100) (admin / password)  
Virgo Web Admin Console: [http://localhost:9100/admin](http://localhost:9100/admin) (admin / springsource)  

## Stop Apromore Docker
Run this command to stop the Apromore Docker containers.  Your saved works on Apromore Docker will still be there next time you start it.  
`docker-compose down`  

## Completely remove Apromore Docker
Run this command to remove the Apromore Docker container images and database volume.  Any works you did on Apromore Docker will be gone.  
`docker-compose down -v --rmi all`  

## Install Sample Data
Install Ant on your machine [https://ant.apache.org/bindownload.cgi](https://ant.apache.org/bindownload.cgi)  

Git clone https://github.com/apromore/ApromoreCode and `cd ApromoreCode`  
Edit `build.xml`, find strings `http://localhost:9000/manager/services/manager` and change port `9000` to `9100`.  

Run `ant install-sample-data` and `ant install-comparison-data`  
