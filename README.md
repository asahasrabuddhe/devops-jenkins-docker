# Jenkins + Docker

Jenkins image with docker installed.

## Use

```
docker run -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock --name jenkins ajitemsahasrabuddhe/jenkins:1
```

## Note

After setting up this image as a container, it is recommended to restart the docker service on your host machine for the permissions to work properly.
