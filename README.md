# Jenkins in Docker Compose

## Build Jenkins DinD Slave Image

```
docker build -t jenkins-dind-slave .
docker tag jenkins-dind-slave hachikoapp/jenkins-dind-slave:latest
docker tag jenkins-dind-slave hachikoapp/jenkins-dind-slave:0.0.1
```

## Push Jenkins DinD Slave Image

```
docker login -u hachikoapp
docker push hachikoapp/jenkins-dind-slave:0.0.1
docker push hachikoapp/jenkins-dind-slave:latest
```

## Operating the environment

### Start Jenkins

```
docker-compose up -d
```

### Stop Jenkins

```
docker-compose stop
```

### Destroy Jenkins

```
docker-compose down
```

## Obtain the certificates

```
# Client Key

docker exec jenkins-docker cat /certs/client/key.pem

# Client Certificate

docker exec jenkins-docker cat /certs/client/cert.pem

# Server CA Certificate

docker exec jenkins-docker cat /certs/server/ca.pem
```

## Resources

- [Run Jenkins in a Docker container -- part 1 -- Docker-in-Docker](https://davelms.medium.com/run-jenkins-in-a-docker-container-part-1-docker-in-docker-7ca75262619d)
- [Building Docker images using Jenkins running as a Docker container](https://www.youtube.com/watch?v=h15Mh9FDMLo)
