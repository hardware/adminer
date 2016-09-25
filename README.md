# hardware/adminer

![adminer](https://i.imgur.com/HRNxSRK.png "adminer")

### What is this ?

Adminer (formerly phpMinAdmin) is a full-featured database management tool written in PHP. Conversely to phpMyAdmin, it consist of a single file ready to deploy to the target server. Adminer is available for MySQL, PostgreSQL, SQLite, MS SQL, Oracle, Firebird, SimpleDB, Elasticsearch and MongoDB.

### Features

- Lightweight & secure image (no root process)
- Based on Alpine Linux 3.4
- Latest adminer version (4.2.5)
- MySQL/MariaDB/PostgreSQL/SQLite drivers

### Built-time variables

- **VERSION** : version of adminer (default: **4.2.5**)
- **SHA256_HASH** : SHA256 hash of adminer php file

### Ports

- **8888**

### Reverse proxy

https://github.com/Wonderfall/dockerfiles/tree/master/nginx

### Docker-compose

#### Docker-compose.yml

```
adminer:
  image: hardware/adminer
  container_name: adminer
  links:
    - mariadb:mariadb

mariadb:
  image: mariadb:10.1
  container_name: mariadb
  volumes:
    - /mnt/docker/mysql/db:/var/lib/mysql
  environment:
    - MYSQL_ROOT_PASSWORD=xxxx
```

#### Run !

```
docker-compose up -d
```

### Screenshots

![screenshot1](http://i.imgur.com/a9MEEFq.png "screenshot1")
![screenshot2](http://i.imgur.com/SASabMB.png "screenshot2")
