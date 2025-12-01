
## Installation of Hello Shiny

````
chmod +x docker.sh
./install-docker.sh
````


Pull images:

````
docker pull ghcr.io/edgar-treischl/spectredash:latest

docker login gitlab.lrz.de:5005
docker pull gitlab.lrz.de:5005/edgar-treischl/sp3ctrapp

````


````
docker compose up -d
````



````
sudo apt install apache2-utils
htpasswd -nbB shinyuser shinyuser
htpasswd -nbB edgar edgar
```



```
docker network create web
```

