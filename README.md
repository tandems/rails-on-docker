# Rails on Docker

## Install Docker for mac

usage of docker env for development

please install docker for mac at here.

    https://docs.docker.com/docker-for-mac/

## Create Project

```
$ git clone git@github.com:tandems/rails-on-docker.git
$ mv rails-on-docker demo
$ cd demo
$ rm -rf .git
$ docker-compose run app rails new . --force --skip-git --skip-test-unit --skip-puma --database mysql
$ docker-compose build
$ docker-compose up -d
$ sed -i '' -e 's/host: localhost/host: db/g' config/database.yml

## Create Database
$ docker-compose run app rails db:create

## Start server
$ open http://localhost:3000
```

enjoy your development :)

## Update Docker image

```
$ docker-compose build
```

## Login server

```
$ docker-compose run app /bin/bash
```

## Using pry-rails

Add pry gems.

```
# Gemfile

gem 'pry-byebug'
gem 'pry-rails'
gem 'pry-stack_explorer'
```

Use ``` docker ps ``` to get a list of the running container name.

```
$ docker ps
```

You can use the container name to attach to the docker instance.

```
$ docker attach [CONTAINER_NAME]
```
