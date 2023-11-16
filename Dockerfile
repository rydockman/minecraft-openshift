FROM registry.access.redhat.com/ubi9/openjdk-17:latest

RUN yum install -y java-latest-openjdk && yum install -y screen

RUN wget https://piston-data.mojang.com/v1/objects/5b868151bd02b41319f54c8d4061b8cae84e665c/server.jar

RUN java -Xmx1024M -Xms1024M -jar server.jar nogui

RUN echo "eula=true" > eula.txt

RUN screen

RUN java -Xmx1024M -Xms1024M -jar server.jar nogui
