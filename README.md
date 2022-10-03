Description
---------------
This is a simple Docker Compose config to run a pair of containers for testing the Backdrop CMS 1.20.0. This setup was tested with docker compose on Ubuntu 22.04.1 LTS (Jammy Jellyfish) .

To use, simply download the repo, adjust the .env file with your DB password and other details and then run build-backdrop.sh. This script will pull down the current Backdrop:Apache container (1.17, PHP 7.4), Dockerfile, and configurator script plus the latest MariaDB container. It then places them on a custom network and performs a couple of minor fixes so that Backdrop can finish installation. If you want to change the mounts or other details just adjust docker-compose.yml. 

* Backdrop CMS (https://backdropcms.org/)
* Backdrop CMS Docker Git repo (https://github.com/backdrop-ops/backdrop-docker)
* Docker Compose (https://docs.docker.com/compose/)

License
-------
GNU General Public License v3.0

Author Information
------------------
Moldovan Darius (T3jv1l)
