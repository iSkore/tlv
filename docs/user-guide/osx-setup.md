# OSX Setup

This document is direction for setting up TLV on macOS

### OS Version
macOS Mojave - 10.14.2 (18C54)

### Setup

1. Install [brew](https://brew.sh/)
- `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

2. Install required Java version
- `brew cask uninstall java`
- `brew tap caskroom/versions`
- `brew cask install java8`

Should read:
```
$ java -version

java version "1.8.0_192"
Java(TM) SE Runtime Environment (build 1.8.0_192-b12)
Java HotSpot(TM) 64-Bit Server VM (build 25.192-b12, mixed mode)
```

3. Install [SDK](https://sdkman.io/install)
- `curl -s "https://get.sdkman.io" | bash`
- `source "$HOME/.sdkman/bin/sdkman-init.sh"`
- `sdk version`

4. Install `gradle`
- `sdk install gradle 4.10.1`

Should read:
```
$ gradle -v

------------------------------------------------------------
Gradle 4.10.1
------------------------------------------------------------

Build time:   2018-09-12 11:33:27 UTC
Revision:     76c9179ea9bddc32810f9125ad97c3315c544919

Kotlin DSL:   1.0-rc-6
Kotlin:       1.2.61
Groovy:       2.4.15
Ant:          Apache Ant(TM) version 1.9.11 compiled on March 23 2018
JVM:          1.8.0_192 (Oracle Corporation 25.192-b12)
OS:           Mac OS X 10.14.2 x86_64
```

5. Install [`docker`](https://docs.docker.com/docker-for-mac/install/)
- Includes `docker` and `docker-compose`

Should read:
```
$ docker -v

Docker version 18.09.0, build 4d60db4

$ docker-compose -v

docker-compose version 1.23.2, build 1110ad01
```
