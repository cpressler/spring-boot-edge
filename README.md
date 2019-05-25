# spring-boot-edge


## Docker

Interactive mode
```bash
docker run -i -t -p 8765:8765 --name zuul softvisionlvcp/spring-boot-edge-server:latest
```

Dettached  mode
```bash
docker run -d -p 8765:8765 --name zuul softvisionlvcp/spring-boot-edge-server:latest
```

find all containers
```bash
 docker container ps -a

```

delete a container by name
```bash
 docker container rm zuul

```


### resetting git repo
  rm -rf .git
  git init
  git remote add origin https://github.com/cpressler/spring-boot-edge.git
  git commit -am 'initial commit'
  git push -f origin master
