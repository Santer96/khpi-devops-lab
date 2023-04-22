#!/usr/bin/env bash

if [ "$( docker container inspect -f '{{.State.Exited}}' slave-mysql )" == "true"]; then
	echo "Slave mysql container is stopped" >> slave_log.txt
elif [ "$( docker container inspect -f '{{.State.Exited}}' master-mysql )" == "true"]; then
	echo "Master mysql container is stopped" >> master_log.txt
