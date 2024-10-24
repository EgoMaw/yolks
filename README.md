# Yolks

A curated collection of core images that can be used with Pterodactyl's Egg system. Each image is rebuilt
periodically to ensure dependencies are always up-to-date.

Images are hosted on `ghcr.io` and exist under the `games`, `installers`, `java` and `yolks` spaces. The following logic
is used when determining which space an image will live under:

* `games` — anything within the `games` folder in the repository. These are images built for running a specific game
or type of game.
* `installers` — anything living within the `installers` directory. These images are used by install scripts for different
Eggs within Pterodactyl, not for actually running a game server. These images are only designed to reduce installation time
and network usage by pre-installing common installation dependencies such as `curl` and `wget`.
* `java` — anything living within the `java` directory. These images are used specifically for java programs and hold various
java distributions such as `temurin`, `corretto` and more.
* `yolks` — these are more generic images that allow different types of games or scripts to run. They're generally just
a specific version of software and allow different Eggs within Pterodactyl to switch out the underlying implementation. An
example of this would be something like Python which are used for running bots, etc.

All of these images are available for `linux/amd64` and `linux/arm64` versions, unless otherwise specified, to use
these images on an arm system, no modification to them or the tag is needed, they should just work.

## Available Images

### [OSes](/oses)

* [`Alpine`](/oses/alpine)
  * `ghcr.io/egomaw/yolks:alpine`
* [`Debian`](/oses/debian)
  * `ghcr.io/egomaw/yolks:debian`
* [`Ubuntu`](/oses/ubuntu)
  * `ghcr.io/egomaw/yolks:ubuntu`

### [dotNet](/dotnet)

* [`DotNet 2.1`](/dotnet/2.1)
  * `ghcr.io/egomaw/yolks:dotnet_2.1`
* [`DotNet 3.1`](/dotnet/3.1)
  * `ghcr.io/egomaw/yolks:dotnet_3.1`
* [`DotNet 5.0`](/dotnet/5)
  * `ghcr.io/egomaw/yolks:dotnet_5`
* [`DotNet 6.0`](/dotnet/6)
  * `ghcr.io/egomaw/yolks:dotnet_6`
* [`DotNet 7.0`](/dotnet/7)
  * `ghcr.io/egomaw/yolks:dotnet_7`
* [`DotNet 8.0`](/dotnet/8)
  * `ghcr.io/egomaw/yolks:dotnet_8`
* [`DotNet 9.0`](/dotnet/9)
  * `ghcr.io/egomaw/yolks:dotnet_9`

### [Games](/games)

* [`source`](/games/source)
  * `ghcr.io/egomaw/games:source`
* [`valheim`](/games/valheim)
  * `ghcr.io/egomaw/games:valheim`

### [Golang](/go)

* [`Go 1.14`](/go/1.14)
  * `ghcr.io/egomaw/yolks:go_1.14`
* [`Go 1.15`](/go/1.15)
  * `ghcr.io/egomaw/yolks:go_1.15`
* [`Go 1.16`](/go/1.16)
  * `ghcr.io/egomaw/yolks:go_1.16`
* [`go1.17`](/go/1.17)
  * `ghcr.io/egomaw/yolks:go_1.17`
* [`Go 1.18`](/go/1.18)
  * `ghcr.io/egomaw/yolks:go_1.18`
* [`Go 1.19`](/go/1.19)
  * `ghcr.io/egomaw/yolks:go_1.19`
* [`Go 1.20`](/go/1.20)
  * `ghcr.io/egomaw/yolks:go_1.20`
* [`Go 1.21`](/go/1.21)
  * `ghcr.io/egomaw/yolks:go_1.21`
* [`Go 1.21`](/go/1.22)
  * `ghcr.io/egomaw/yolks:go_1.22`

### [Java](/java)

There are 3 different Java distributions used,`temurin`, `zulu`, `openjdk` and `amazoncorretto`.  
Replace {{distribution}} with the one you want from above.  
**Be Wary though** Not all distributions support all versions, check the folders inside the java folder to be sure.

* [`Java 8`](/java/8)
  * `ghcr.io/egomaw/java:{{distribution}}_8`
* [`Java 8 Forge`](/java/8-forge)
  * `ghcr.io/egomaw/java:{{distribution}}_8-forge`
* [`Java 11`](/java/11)
  * `ghcr.io/egomaw/java:{{distribution}}_11`
* [`Java 11 Forge`](/java/11-forge)
  * `ghcr.io/egomaw/java:{{distribution}}_11-forge`
* [`Java 16`](/java/16)
  * `ghcr.io/egomaw/java:{{distribution}}_16`
* [`Java 17`](/java/17)
  * `ghcr.io/egomaw/java:{{distribution}}_17`
* [`Java 21`](/java/21)
  * `ghcr.io/egomaw/java:{{distribution}}_21`
* [`Java 22`](/java/22)
  * `ghcr.io/egomaw/java:{{distribution}}_22`
* [`Java 23`](/java/23)
  * `ghcr.io/egomaw/java:{{distribution}}_23`

### [MariaDB](/mariadb)

* [`MariaDB 10.3`](/mariadb/10.3)
  * `ghcr.io/egomaw/yolks:mariadb_10.3`
* [`MariaDB 10.7`](/mariadb/10.7)
  * `ghcr.io/egomaw/yolks:mariadb_10.7`
* [`MariaDB 10.11`](/mariadb/10.11)
  * `ghcr.io/egomaw/yolks:mariadb_10.11`
* [`MariaDB 11.2`](/mariadb/11.2)
  * `ghcr.io/egomaw/yolks:mariadb_11.2`

### [MongoDB](/mongodb)

* [`MongoDB 5`](/mongodb/5)
  * `ghcr.io/egomaw/yolks:mongodb_5`
* [`MongoDB 6`](/mongodb/6)
  * `ghcr.io/egomaw/yolks:mongodb_6`
* [`MongoDB 7`](/mongodb/7)
  * `ghcr.io/egomaw/yolks:mongodb_7`

### [Nodejs](/nodejs)

* [`Node 14`](/nodejs/14)
  * `ghcr.io/egomaw/yolks:nodejs_14`
* [`Node 18`](/nodejs/18)
  * `ghcr.io/egomaw/yolks:nodejs_18`
* [`Node 19`](/nodejs/19)
  * `ghcr.io/egomaw/yolks:nodejs_19`
* [`Node 20`](/nodejs/20)
  * `ghcr.io/egomaw/yolks:nodejs_20`
* [`Node 21`](/nodejs/21)
  * `ghcr.io/egomaw/yolks:nodejs_21`

### [Bun](/bunjs)

* [`Bun Stable`](/bunjs/stable)
  * `ghcr.io/egomaw/yolks:bunjs_stable`
* [`Bun Canary`](/bunjs/canary)
  * `ghcr.io/egomaw/yolks:bunjs_canary`

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
* [`Python 3.10`](/python/3.10)
  * `ghcr.io/egomaw/yolks:python_3.10`
* [`Python 3.11`](/python/3.11)
  * `ghcr.io/egomaw/yolks:python_3.11`
* [`Python 3.12`](/python/3.12)
  * `ghcr.io/egomaw/yolks:python_3.12`

### [SteamCMD](/steamcmd)

* [`SteamCMD Debian lastest`](/steamcmd/debian)
  * `ghcr.io/egomaw/steamcmd:debian`
* [`SteamCMD Debian Dotnet`](/steamcmd/dotnet)
  * `ghcr.io/egomaw/steamcmd:dotnet`
* [`SteamCMD Proton`](/steamcmd/proton)
  * `ghcr.io/egomaw/steamcmd:proton`
* [`SteamCMD Ubuntu latest LTS`](/steamcmd/ubuntu)
  * `ghcr.io/egomaw/steamcmd:ubuntu`

### [Wine](/wine)

* [`Wine Stable`](/wine/stable)
  * `ghcr.io/egomaw/yolks:wine_stable`
* [`Wine Staging`](/wine/staging)
  * `ghcr.io/egomaw/yolks:wine_staging`
* [`Wine 7`](/wine/7)
  * `ghcr.io/egomaw/yolks:wine_7`
* [`Wine 6`](/wine/6)
  * `ghcr.io/egomaw/yolks:wine_6`
* [`Wine 5`](/wine/5)
  * `ghcr.io/egomaw/yolks:wine_5`
* [`Wine 4`](/wine/4)
  * `ghcr.io/egomaw/yolks:wine_4`

### [Installation Images](/installers)

* [`Alpine Installer`](/installers/alpine)
  * `ghcr.io/egomaw/installers:alpine`
* [`Debian Installer`](/installers/debian)
  * `ghcr.io/egomaw/installers:debian`
* [`Debian w Java Installer`](/installers/debian-java)
  * `ghcr.io/egomaw/installers:debian-java`
* [`Ubuntu Installer`](/installers/ubuntu)
  * `ghcr.io/egomaw/installers:ubuntu`
