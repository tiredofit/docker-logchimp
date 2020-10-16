# hub.docker.com/r/tiredofit/logchimp

[![Build Status](https://img.shields.io/docker/build/tiredofit/logchimp.svg)](https://hub.docker.com/r/tiredofit/logchimp)
[![Docker Pulls](https://img.shields.io/docker/pulls/tiredofit/logchimp.svg)](https://hub.docker.com/r/tiredofit/logchimp)
[![Docker Stars](https://img.shields.io/docker/stars/tiredofit/logchimp.svg)](https://hub.docker.com/r/tiredofit/logchimp)
[![Docker Layers](https://images.microbadger.com/badges/image/tiredofit/logchimp.svg)](https://microbadger.com/images/tiredofit/logchimp)

## Introduction

This will build a container for [logchimp](https://logchimp.io/) - An open source product evaluation tool

* Initial Preview, Non functioning image

* This Container uses a [customized Alpine base](https://hub.docker.com/r/tiredofit/alpine) which includes [s6 overlay](https://github.com/just-containers/s6-overlay) enabled for PID 1 Init capabilities, [zabbix-agent](https://zabbix.org) for individual container monitoring, Cron also installed along with other tools (bash,curl, less, logrotate, nano, vim) for easier management. It also supports sending to external SMTP servers..

[Changelog](CHANGELOG.md)

## Authors

- [Dave Conroy](https://github.com/tiredofit)

## Table of Contents


- [Introduction](#introduction)
- [Authors](#authors)
- [Table of Contents](#table-of-contents)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
  - [Quick Start](#quick-start)
- [Configuration](#configuration)
  - [Data-Volumes](#data-volumes)
  - [Environment Variables](#environment-variables)
  - [Networking](#networking)
- [Maintenance](#maintenance)
  - [Shell Access](#shell-access)
- [References](#references)

## Prerequisites

This image assumes that you are using a reverse proxy such as
[jwilder/nginx-proxy](https://github.com/jwilder/nginx-proxy) and optionally the [Let's Encrypt Proxy
Companion @
https://github.com/JrCs/docker-letsencrypt-nginx-proxy-companion](https://github.com/JrCs/docker-letsencrypt-nginx-proxy-companion)
or [Traefik](https://github.com/tiredofit/docker-traefik) in order to serve your pages. However, it will run just fine on it's own if you map appropriate ports. See the examples folder for a docker-compose.yml that does not rely on a reverse proxy.

You will also need an external Postgresql container

## Installation

Automated builds of the image are available on [Docker Hub](https://hub.docker.com/r/tiredofit/logchimp) and is the recommended method of installation.

```bash
docker pull tiredofit/logchimp
```

### Quick Start

* The quickest way to get started is using [docker-compose](https://docs.docker.com/compose/). See the examples folder for a working [docker-compose.yml](examples/docker-compose.yml) that can be modified for development or production use.

* Set various [environment variables](#environment-variables) to understand the capabilities of this image.
* Map [persistent storage](#data-volumes) for access to configuration and data files for backup.
* Make [networking ports](#networking) available for public access if necessary

In reality all you wil need to do is populate the `APP_KEY` and `DB_*` environment variables to have a working solution.

## Configuration

### Data-Volumes

The following directories are used for configuration and can be mapped for persistent storage.

| Directory | Description |
| --------- | ----------- |

### Environment Variables

Along with the Environment Variables from the [Base image](https://hub.docker.com/r/tiredofit/alpine) and [Web Image](https://hub.docker.com/r/tiredofit/nginx) below is the complete list of available options that can be used to customize your installation.

| Parameter          | Description                                                          | Default     |
| ------------------ | -------------------------------------------------------------------- | ----------- |
| `APP_KEY`          | Used for encryption/decryption of passwords. Do not change once set! |             |
| `BACKEND_HOSTNAME` | Backend Hostname                                                     | `localhost` |
| `BACKEND_PORT`     | Backend Port                                                         | `3000`      |
| `BACKEND_PROTOCOL` | Backend protocol `http` or `https`                                   | `http`      |
| `DB_HOST`          | Host or container name of Postgresql Server e.g. `logchimp-db`       |             |
| `DB_NAME`          | Postgresql Database name e.g. `logchimp`                             |             |
| `DB_PASS`          | Postgresql Password for above Database e.g. `password`               |             |
| `DB_PORT`          | Postgresql Server Port - Default `5432`                              | `5432`      |
| `DB_USER`          | Postgresql Username for above Database e.g. `logchimp`               |             |
| `FRONTEND_PORT`    | Frontend Port                                                        | `8080`      |

### Networking

The following ports are exposed.

| Port | Description |
| ---- | ----------- |
| `80` | HTTP        |


## Maintenance

### Shell Access

For debugging and maintenance purposes you may want access the containers shell.

```bash
docker exec -it (whatever your container name is e.g. logchimp-app) bash
```

## References

* <https://logchimp.codecarrot.net/docs/>
