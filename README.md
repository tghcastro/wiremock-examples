# Wiremock Examples

The idea of this repository is to allow the creation of Wiremock image/container via docker. 

During the image build, it will copy all mappings available in the `mappings` folder. These mappings will be available after starting the container.

## Running via `docker run`

```shell
docker build -t tghcastro/wiremock .

docker run -p 8080:8080 -t tghcastro/wiremock
```

## Running via `docker-compose`

docker-compose file
```yml
version: "3.8"
services:
  wiremock:
    build:
      context: https://github.com/tghcastro/wiremock-examples.git
    ports:
      - "8080:8080"
```

```shell
docker-compose up
```

## Accessing Wiremock

```shell
wget http://localhost:8080/__admin
```

### Postman collection
There is a Postman collection for Wiremock API in this repository. If you want to use it you should configure a variable `wiremock-base` on your Postman.
