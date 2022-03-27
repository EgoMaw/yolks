# Yolks

A curated collection of core images that can be used with Pterodactyl's Egg system. Each image is rebuilt
periodically to ensure dependencies are always up-to-date.

Images are hosted on `ghcr.io` and exist under the `games`, `installers`, and `yolks` spaces. The following logic
is used when determining which space an image will live under:

* `games` — anything within the `games` folder in the repository. These are images built for running a specific game
or type of game.
* `installers` — anything living within the `installers` directory. These images are used by install scripts for different
Eggs within Pterodactyl, not for actually running a game server. These images are only designed to reduce installation time
and network usage by pre-installing common installation dependencies such as `curl` and `wget`.
* `yolks` — these are more generic images that allow different types of games or scripts to run. They're generally just
a specific version of software and allow different Eggs within Pterodactyl to switch out the underlying implementation. An
example of this would be something like Java or Python which are used for running bots, Minecraft servers, etc.

All of these images are available for `linux/amd64` and `linux/arm64` versions, unless otherwise specified, to use
these images on an arm system, no modification to them or the tag is needed, they should just work.

## Contributing

When adding a new version to an existing image, such as `java v42`, you'd add it within a child folder of `java`, so
`java/42/Dockerfile` for example. Please also update the correct `.github/workflows` file to ensure that this new version
is tagged correctly.

## Available Images

### [Oses](/oses)

* [alpine](/oses/alpine)
  * `ghcr.io/egomaw/yolks:alpine`
* [debian](/oses/debian)
  * `ghcr.io/egomaw/yolks:debian`
* [ubuntu](/oses/ubuntu)
  * `ghcr.io/egomaw/yolks:ubuntu`

### [Bot](/bot)

* [`bastion`](/bot/bastion)
  * `ghcr.io/egomaw/yolks:bot_bastion`
* [`parkertron`](/bot/parkertron)
  * `ghcr.io/egomaw/yolks:bot_parkertron`
* [`redbot`](/bot/red)
  * `ghcr.io/egomaw/yolks:bot_red`
* [`sinusbot`](/bot/sinusbot)
  * `ghcr.io/egomaw/yolks:bot_sinusbot`

### [dotNet](/dotnet)

* [`dotnet2.1`](/dotnet/2.1)
  * `ghcr.io/egomaw/yolks:dotnet_2.1`
* [`dotnet3.1`](/dotnet/3.1)
  * `ghcr.io/egomaw/yolks:dotnet_3.1`
* [`dotnet5.0`](/dotnet/5)
  * `ghcr.io/egomaw/yolks:dotnet_5`
* [`dotnet6.0`](/dotnet/6)
  * `ghcr.io/egomaw/yolks:dotnet_6`

### [Games](/games)

* [`altv`](/games/altv)
  * `ghcr.io/egomaw/games:altv`
* [`arma3`](/games/arma3)
  * `ghcr.io/egomaw/games:arma3`
* [`source`](/games/source)
  * `ghcr.io/egomaw/games:source`

### [Golang](/go)

* [`go1.14`](/go/1.14)
  * `ghcr.io/egomaw/yolks:go_1.14`
* [`go1.15`](/go/1.15)
  * `ghcr.io/egomaw/yolks:go_1.15`
* [`go1.16`](/go/1.16)
  * `ghcr.io/egomaw/yolks:go_1.16`

### [Java](/java)

* [`java7`](/java/7)
  * `ghcr.io/egomaw/yolks:java_7`
* [`java8`](/java/8)
  * `ghcr.io/egomaw/yolks:java_8`
* [`java8`](/java/8-forge)
  * `ghcr.io/egomaw/yolks:java_8-forge`
* [`java9`](/java/9)
  * `ghcr.io/egomaw/yolks:java_9`
* [`java11`](/java/11)
  * `ghcr.io/egomaw/yolks:java_11`
* [`java11`](/java/11-forge)
  * `ghcr.io/egomaw/yolks:java_11-forge`
* [`java14`](/java/14)
  * `ghcr.io/egomaw/yolks:java_14`
* [`java16`](/java/16)
  * `ghcr.io/egomaw/yolks:java_16`
* [`java17`](/java/17)
  * `ghcr.io/egomaw/yolks:java_17`
* [`java17`](/java/18)
  * `ghcr.io/egomaw/yolks:java_18`
* [`java17`](/java/19)
  * `ghcr.io/egomaw/yolks:java_19`

### [MariaDB](/mariadb)

* [`MariaDB 10.3`](/mariadb/10.3)
  * `ghcr.io/egomaw/yolks:mariadb_10.3`
* [`MariaDB 10.4`](/mariadb/10.4)
  * `ghcr.io/egomaw/yolks:mariadb_10.4`
* [`MariaDB 10.5`](/mariadb/10.5)
  * `ghcr.io/egomaw/yolks:mariadb_10.5`
* [`MariaDB 10.6`](/mariadb/10.6)
  * `ghcr.io/egomaw/yolks:mariadb_10.6`
* [`MariaDB 10.7`](/mariadb/10.7)
  * `ghcr.io/egomaw/yolks:mariadb_10.7`

### [MongoDB](/mongodb)

* [`MongoDB 4`](/mongodb/4)
  * `ghcr.io/egomaw/yolks:mongodb_4`
* [`MongoDB 5`](/mongodb/5)
  * `ghcr.io/egomaw/yolks:mongodb_5`


### [Nodejs](/nodejs)

* [`node12`](/nodejs/12)
  * `ghcr.io/egomaw/yolks:nodejs_12`
* [`node14`](/nodejs/14)
  * `ghcr.io/egomaw/yolks:nodejs_14`
* [`node16`](/nodejs/16)
  * `ghcr.io/egomaw/yolks:nodejs_16`
* [`node17`](/nodejs/17)
  * `ghcr.io/egomaw/yolks:nodejs_17`

### [PostgreSQL](/postgres)

* [`Postgres 9`](/postgres/9)
  * `ghcr.io/egomaw/yolks:postgres_9`
* [`Postgres 10`](/postgres/10)
  * `ghcr.io/egomaw/yolks:postgres_10`
* [`Postgres 11`](/postgres/11)
  * `ghcr.io/egomaw/yolks:postgres_11`
* [`Postgres 12`](/postgres/12)
  * `ghcr.io/egomaw/yolks:postgres_12`
* [`Postgres 13`](/postgres/13)
  * `ghcr.io/egomaw/yolks:postgres_13`
* [`Postgres 14`](/postgres/14)
  * `ghcr.io/egomaw/yolks:postgres_14`

### [Python](/python)

* [`python3.7`](/python/3.7)
  * `ghcr.io/egomaw/yolks:python_3.7`
* [`python3.8`](/python/3.8)
  * `ghcr.io/egomaw/yolks:python_3.8`
* [`python3.9`](/python/3.9)
  * `ghcr.io/egomaw/yolks:python_3.9`
* [`python3.10`](/python/3.10)
  * `ghcr.io/egomaw/yolks:python_3.10`
* [`python3.11`](/python/3.11)
  * `ghcr.io/egomaw/yolks:python_3.11`

### [Wine](/wine)

* [`Wine-stable`](/wine/stable)
  * `ghcr.io/egomaw/yolks:wine_stable`
* [`Wine-staging`](/wine/staging)
  * `ghcr.io/egomaw/yolks:wine_staging`

### [Installation Images](/installers)

* [`alpine-install`](/installers/alpine)
  * `ghcr.io/egomaw/installers:alpine`
* [`debian-install`](/installers/debian)
  * `ghcr.io/egomaw/installers:debian`
