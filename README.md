# Docker Image - mariadb-with-mroonga

- Supported Arch: linux/amd64,linux/arm64
- Version: 10.5

I am trying to do full-text searching on my existing MariaDB 10.5 container.

If you need other versions, feel free to ask me or fork this project and change the version number.

## Build the Image

Setup buildx:

```bash
docker buildx create --name mybuilder
docker buildx use mybuilder
```

Start to build the image:

```bash
npm run build
```


## How to Use

After the container started, login to your MariaDB and execute the following sql in order to activate Mroonga:

```mariadb
mysql> INSTALL SONAME 'ha_mroonga';
```

Verify it:
```mariadb
mysql> SHOW ENGINES;
```

Example Result:

```
...
| Mroonga | YES | CJK-ready fulltext search, column store | NO | NO | NO |
...
```

### Side Notes

#### Update my Docker Swarm Service to this image

```bash
docker service update --image louislam/mariadb-with-mroonga:10.5 <SERVICE NAME HERE>
```
