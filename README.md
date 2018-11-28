# Running Apromore on Docker

## Prerequisites
Docker is installed, you can check by running:  
`docker version`  
`docker-compose version`  

*Please note: Docker for Windows requires Windows 10 Pro*  
*Recommend increasing Docker resources to: cpu 4, memory 4096MB memory, swap 2048MB*

## Preparation
Clone this repo and `cd apromore-docker`

## Start Apromore Docker
`docker-compose up -d`  
This will take a few mintues...

Apromote Web UI: [http://localhost:9100](http://localhost:9100) (admin / password)  
Virgo Web Admin Console: [http://localhost:9100/admin](http://localhost:9100/admin) (admin / springsource)  

## Stop Apromore Docker
`docker-compose down`  

## Install Sample Data
Git clone https://github.com/apromore/ApromoreCode and `cd ApromoreCode`  
Edit `build.xml`, for target `install-sample-data` and `install-comparison-data`, change port `9000` to `9100` in value `http://localhost:9000/manager/services/manager`  
Run `ant install-sample-data` and `ant install-comparison-data`  

## Remove Apromore Docker (images and volumes)
`docker-compose down -v --rmi all`  
