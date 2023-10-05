# Use the official Apache Tomcat image as the base image
FROM tomcat:9.0

# Maintainer label
LABEL maintainer="vedant.shripad.arole@oracle.com"

# Copy your (web application) into the Tomcat webapps directory
COPY /scratch/app/product/varole/config_files/dist/Folio/* /usr/local/tomcat/webapps/

# Applying permissions to files and directory
RUN chmod 777 /usr/local/tomcat/bin/*
RUN chmod 777 /usr/local/tomcat/webapps/*
RUN chmod 777 /usr/local/tomcat/webapps

# Expose the default Tomcat port
EXPOSE 8080

# Start Tomcat when the container starts
CMD ["/usr/local/tomcat/bin/startup.sh"]
