# Running Apromore on Docker

## Prerequisites
Docker is installed, you can check by running:  
`docker version`  
`docker-compose version`

## Preparation
Clone this repo and `cd apromore-docker`

## Start Apromore Docker
`docker-compose up -d`  
This will take a few mintues...

Apromote Web UI: [http://localhost:9100](http://localhost:9100)  
Virgo Web Admin Console: [http://localhost:9100/admin](http://localhost:9100/admin)

## Stop Apromore Docker
`docker-compose down`

## Remove Apromore Docker (containers and volumes)
`docker-compose down -v --rmi all`