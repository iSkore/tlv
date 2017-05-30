# Time Lapse Viewer

## Dockerfile
```
FROM omar-ossim-base
RUN yum -y install o2-tlv-app && yum clean all
EXPOSE 8080
CMD [ "java", "-server", "-Xms256m", "-Xmx1024m", "-Djava.awt.headless=true", "-XX:+CMSClassUnloadingEnabled", "-XX:+UseGCOverheadLimit", "-Djava.security.egd=file:/dev/./urandom", "-jar", "/usr/share/omar/tlv-app/tlv-app-1.0.0-SNAPSHOT.jar", "--spring.config.location=/usr/share/omar/tlv-app/tlv-app.yml" ]
```
Ref: [omar-ossim-base](../../../omar-ossim-base/docs/install-guide/omar-ossim-base/)

## JAR
`http://artifacts.radiantbluecloud.com/artifactory/webapp/#/artifacts/browse/tree/General/omar-local/io/ossim/omar/apps/tlv-app`