FROM registry.access.redhat.com/ubi9/ubi:latest

WORKDIR /source

RUN pwd

RUN dnf install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm &&
    dnf install -y epel-release wget java-latest-openjdk

RUN wget https://piston-data.mojang.com/v1/objects/5b868151bd02b41319f54c8d4061b8cae84e665c/server.jar

RUN java -Xmx1024M -Xms1024M -jar server.jar nogui

RUN echo "eula=true" > eula.txt

CMD ["java", "-Xmx1024M", "-Xms1024M", "-jar", "server.jar", "nogui"]
