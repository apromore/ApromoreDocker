![apromore](https://apromore.org/wp-content/uploads/2021/08/Apromore-banner_red.png "apromore")

# Apromore Open Source Docker
This is an open source distribution of Apromore that runs as a Docker container. * <b>Note:</b> These instructions are tested with Linux Ubuntu 20.04. 

## Pre-requisites
For Ubuntu, install:
1. [Docker Engine](https://docs.docker.com/engine/install/ubuntu/)
2. [Docker Compose](https://docs.docker.com/compose/install/)

## Run Apromore Docker
* Check out the source code using git: `git clone https://github.com/apromore/ApromoreDocker.git`
* Check out `git checkout release/v7.21`

## Start Apromore Docker
Run following script to start the Apromore Docker containers, it may take few minutes the first time your run this.  
 `sudo docker-compose up -d`

Open Apromore Web UI: [http://localhost:80](http://localhost:80)
Use credentials `admin/password` to login.

## Stop Apromore Docker

Run following script to stop the Apromore Docker containers.  Your saved works on Apromore Docker will still be there next time you start it.  
`sudo docker-compose down`

## Change Port number:
### If you desire to change the default port number from 80, follow these steps:
1. Stop Apromore `sudo docker-compose down`.
2. Change port number in docker-compose.yml from 80:8181 to NewPortNumber:8181
3. Start Apromore `sudo docker-compose up -d`.


## Backup DB Data and Event Logs
Apromore stores its data objects in two places:
1. Database: all data, except the event logs
2. Event logs which are by default located in the top-level “Event-Logs-Repository” directory.

The MySQL database and Event-Logs -Repository are mounted to the volume. If you do not want to delete the volumes, then the data will be available even after a fresh install of Apromore open source version. However, it is still recommended to take backup before doing any upgrade/installation.
Before doing a fresh installation or upgrading to a new version of Apromore – backup the DB and Event logs

### To backup DB data:
* Enter the mysql docker container `sudo docker exec -it apromore-sql bash`
* Run the following command. When prompted for password, enter ‘MAcri’ - `mysqldump --databases apromore -u root -p > backupdb.sql`
* Exit the mysql container
* Copy the backup.sql file from the container to your desired location - `sudo docker cp apromore-sql:/backupdb.sql /home/ubuntu/`

### To backup Event Logs:
* Go to the following directory - `cd /var/lib/docker/volumes/opensourcedocker_event-log-data/_data`
* Zip the event logs and move it to a folder - `sudo zip -r /home/ubuntu/backuplogs.zip .`

## Restore DB data and Event Logs
After doing a fresh installation or upgrading to a new version of Apromore – restore the DB and Event logs. First, stop the Apromore container - `sudo docker stop apromore-core`

### To restore DB data:
* Copy the `backupdb.sql` to the mysql container - `sudo docker cp backupdb.sql apromore-sql:/backupdb.sql`
* Enter the mysql docker container - `sudo docker exec -it apromore-sql bash`
* Run the following command. When prompted for password, enter ‘MAcri’ - `mysql -u root -p`
* Drop the apromore database - `drop database apromore`
* Exit the mysql prompt
* Run the following command to restore the backupdb.sql. When prompted for password, enter ‘MAcri’ - `mysql -u root -p < backupdb.sql`

### To restore event logs: 
* Unzip the backuplogs.zip and store it in the volume created. - `sudo unzip backuplogs.zip -d /var/lib/docker/volumes/opensourcedocker_event-log-data/_data`

After restoring all the data, restart the Apromore container - `sudo docker start apromore-core`
