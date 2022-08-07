# README
### Desafio-Backend

## Overview

Desafio-Backend is a plataform to register expenditures of deputes and list yours ranks.

## Requirements

The requirements to run this project include:
* ruby-2.6.5
* rails 6.0.3
* postgresql

## Instalation
```
Install Docker and docker-compose

$ git clone https://github.com/johndiegodeoliveirasilva/desafio-backend.git

$ docker-compose up web

$ docker exec -it desafio-backend bash
$ rails db:create
$ rails db:migrate

To start sidekiq
$ bundle exec sidekiq

To run tests
$ bundle exec rspec spec
```
## Environment Variable
```
DATABASE_PASSWORD = XXXX
REDIS_URL = XXXX
```
