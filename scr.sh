mkdir /opt/admin/tomcat_9 && tar xf apache-tomcat-9.0.30.tar.gz -C /opt/admin/tomcat_9 --strip-components 1
sed -i 's/Connector port="8080"/Connector port="8088"/g' /opt/admin/tomcat_9/conf/server.xml
mkdir /opt/admin/tomcat_geoserver && tar xf apache-tomcat-9.0.30.tar.gz -C /opt/admin/tomcat_geoserver --strip-components 1
unzip –o /opt/geoserver-2.16.2-war.zip -d /opt/admin/tomcat_geoserver/webapps
unzip –o /opt/geoserver-2.16.2-css-plugin.zip -d /opt/admin/tomcat_geoserver/webapps/geoserver/WEB-INF/lib/
sed -i 's/Server port="8005"/Server port="8006"/g' /opt/admin/tomcat_geoserver/conf/server.xml
sed -i 's/Connector port="8080"/Connector port="8098"/g' /opt/admin/tomcat_geoserver/conf/server.xml
sed -i 's/Connector port="8009"/Connector port="8008"/g' /opt/admin/tomcat_geoserver/conf/server.xml
rm -R /opt/admin/tomcat_geoserver/webapps/geoserver/data
unzip -o /opt/geoserver_data.zip -d /opt/admin/tomcat_geoserver/webapps/geoserver/
cp /opt/water-api.war /opt/admin/tomcat_9/webapps/
ln -s /opt/admin/tomcat_9/bin/startup.sh /usr/bin/tomcatUp
ln -s /opt/admin/tomcat_9/bin/shutdown.sh /usr/bin/tomcatDown
ln -s /opt/admin/tomcat_geoserver/bin/startup.sh /usr/bin/geoserverUp
ln -s /opt/admin/tomcat_geoserver/bin/shutdown.sh /usr/bin/geoserverDown
tomcatUp
geoserverUp