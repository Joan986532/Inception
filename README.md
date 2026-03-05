This project has been created as part of the 42 curriculum by jnauroy


## Description

Inception is a system administration project using containers. The objective is to run a web server,
where each service is host in his own container and communicate with each others.

Wikipedia: Each container is basically a fully functional and portable cloud or non-cloud computing environment surrounding
the application and keeping it independent of other environments running in parallel Individually, each container
simulates a different software application and runs isolated processes by bundling related configuration files,
libraries and dependencies. But, collectively, multiple containers share a common operating system kernel.

In this project, there is 3 mandatory containers:
 - Nginx
 - Mariadb
 - Wordpress

and 2 volumes:
 - Mariadb
 - Wordpress

I built the 5 bonus containers:
 - redis
 - FTP
 - portfolio
 - adminer
 - portainer

 and one more volume:
 - portainer

## Instructions

1: First of all, you'll need Docker Engine, otherwise you won't be able to use the docker commands. Follow this tutorial to install it: https://docs.docker.com/engine/install

2: Now in the terminal, go in the Inception folder and use the 'make' command. All the docker commands we need are linked in the Makefile. This will build all the containers and the volumes and link them.

3: Go to your browser and type: https://jnauroy.42.fr. If everything goes right, You'll see a beautiful wordpress homepage.

4 (optional): You can use the command ```docker ps``` to check if all the containers are running. If you see 8 services, everything is ok. If not,
use the command ```docker logs <container_name>```. This command show what happen in the container during the compilation.


## Resources

Docker Docs: \
    https://docs.docker.com/
    
nginx: \
    https://nginx.org/en/docs/beginners_guide.html
    
wordpress: \
    https://wp-cli.org/fr/

mariadb: \
    https://mariadb.com/docs/server/mariadb-quickstart-guides/installing-mariadb-server-guide \
    https://mariadb.com/docs/server/mariadb-quickstart-guides/basics-guide \
    https://docs.bitnami.com/aws/infrastructure/lamp/configuration/create-database-mariadb/

adminer: \
    https://serverpilot.io/docs/guides/apps/adminer/
    
ftp: \
    https://doc.ubuntu-fr.org/vsftpd
    https://wiki.debian.org/fr/vsftpd

portainer: \
    https://docs.portainer.io/
    https://docs.portainer.io/start/install-ce/server/docker/linux
    
redis: \
    https://redis.io/docs/latest/operate/oss_and_stack/install/archive/install-redis/install-redis-on-linux/
    
    
### How AI was used ?

I used AI to complete lack of information in the official doc. 
After I applied all the tutorials in Resources, I asked to Claude / ChatGPT to improve my scripts / Dockerfiles.
I also asked it to repair my compilation errors because the messages were hard to understand.


### Difference Container / VM

Containers virtualize and partition the OS. You have several virtual-partitioned environments running on the same underlying OS.
Security is used to ensure contents of one Partition cannot interact with other Partitions.

VM's virtualize the underlying hardware. The partitioned environments run their own OS, but share the same underlying bare metal hardware.

### Secrets / Environment variables

An environment variable is a user-definable value. For security reasons, it's not a good idea using theme to store password so Docker
came with a solution, Docker Secrets. Secrets are encrypted during transit and at rest in a Docker swarm. A given secret is only
accessible to those services which have been granted explicit access to it and only while those service tasks are running.

### Docker Network / Host Network

Docker Network is an isolated network from the rest of the machine (Host network). It's very useful for portability and security
because it will works no matter the machine.

### Docker Volumes / Bind Mounts

When you use a bind mount, a file or directory on the host machine is mounted from the host into a container. By contrast, when you use
a volume, a new directory is created within Docker's storage directory on the host machine, and Docker manages that directory's contents.
