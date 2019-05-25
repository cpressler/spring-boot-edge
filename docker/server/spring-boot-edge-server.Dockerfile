FROM centos:7

ARG buildversion
ARG ARTIFACT_ID=spring-boot-edge-server

RUN echo "Oh dang look at that $buildversion"

ARG sourceJar=./target/${ARTIFACT_ID}-${buildversion}-boot.jar
#RUN echo $sourceJar

EXPOSE 8761


RUN yum update -y -q && \
yum install -y -q java-1.8.0-openjdk && \
rm -rf /var/cache/yum && \
mkdir /opt/services && \
mkdir /opt/services/${ARTIFACT_ID}


COPY ./${ARTIFACT_ID}.service /usr/lib/systemd/system/${ARTIFACT_ID}.service
COPY ./${ARTIFACT_ID}.sysconfig /etc/sysconfig/${ARTIFACT_ID}
COPY $sourceJar /opt/services/${ARTIFACT_ID}/${ARTIFACT_ID}-boot.jar
RUN chmod 666 /usr/lib/systemd/system/${ARTIFACT_ID}.service && \
ln -s /usr/lib/systemd/system/${ARTIFACT_ID}.service /etc/systemd/system/multi-user.target.wants/${ARTIFACT_ID}.service

ADD ./docker/server/docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

