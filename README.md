# hardware/adminer

![adminer](https://i.imgur.com/HRNxSRK.png "adminer")

### What is this ?

Adminer (formerly phpMinAdmin) is a full-featured database management tool written in PHP. Conversely to phpMyAdmin, it consist of a single file ready to deploy to the target server. Adminer is available for MySQL, PostgreSQL, SQLite, MS SQL, Oracle, Firebird, SimpleDB, Elasticsearch and MongoDB.

### Features

- Lightweight & secure image (no root process)
- Based on Alpine Linux
- Latest adminer version (4.7.0)
- MySQL/MariaDB/PostgreSQL/SQLite drivers

### Built-time variables

- **VERSION** : version of adminer (default: **4.7.0**)
- **SHA256_HASH** : SHA256 hash of adminer php file
- **THEME** : alternative design (default: **pepa-linha**), [view full list](https://github.com/vrana/adminer/tree/master/designs).

### Ports

- **8888**

### Docker-compose.yml

```yml
version: "3"

services:
  adminer:
    image: hardware/adminer
    container_name: adminer
    depends_on:
      - mariadb

  mariadb:
    image: mariadb:10.2
    container_name: mariadb
    volumes:
      - /mnt/docker/mysql/db:/var/lib/mysql
    environment:
      - MYSQL_ROOT_PASSWORD=xxxx
```

### Screenshots

![screenshot1](http://i.imgur.com/a9MEEFq.png "screenshot1")
![screenshot2](http://i.imgur.com/SASabMB.png "screenshot2")
