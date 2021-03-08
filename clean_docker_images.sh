#!/bin/bash

# You shoud add script in /etc/crontab at @hourly

echo 'Docker Volume prune:'
docker volume prune -f
echo 'Docker Image prune:'
docker image prune -f

dev_repositories=(\
"nginx" \
"buster" \
)

if [[ -z $1 ]];then
    months=2
else
    months=$1
fi

# RM dev images
for repo in ${dev_repositories[*]}
do
    echo "Watching images in $repo aged $months months"

    string=`exec docker images | grep $repo | grep "$months months" | awk '{print $1":"$2}'`
    echo $string
    if [[ -z $string ]]; then
        echo "    Repository haven't images aged $months months"
    else
        docker image rm $string
    fi

done

