# bash & PowerShell scripts



## Description:  
Some scripts to make life easier when working with Linux, AWS Cloud, K8s and even Pshell.

##![alt text](https://raw.githubusercontent.com/odb/official-bash-logo/61eff022f2dad3c7468f5deb4f06652d15f2c143/assets/Logos/Icons/SVG/64x64.svg?sanitize=true) PowerShell

##### clean_docker_images.sh
Cleans your instance of old docker images for a specific repository / pattern. You need to set an example for how the cleaning will be performed.

```bash
dev_repositories=(\
"nginx" \
"buster" \
)
```

##### Stop all container and delete all docker images
```bash
docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q) && docker rmi -f $(docker images -q)
```
##### Find a directory with sizes in megabytes and delete them
```bash
du -sh /where/find/folders/* 2>/dev/null | grep "[[:digit:]]\.*M" | sort -nk1 | awk '{ print $2 }' | xargs -r rm -rf
```
##![alt text](https://raw.githubusercontent.com/PowerShell/PowerShell/master/assets/ps_black_64.svg?sanitize=true) PowerShell
##### copy.ps1
Copies the latest folders to the desired directory and archives them into a .zip archive. Works with PowerShell v2.0 and higher.
