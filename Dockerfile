# Use an official Tomcat image as the base.
# This image includes a JRE and the Tomcat server pre-installed.
# Using a specific version (like 9.0-jre11-temurin-jammy) is highly recommended
# over 'latest' for reproducibility and stability.
FROM tomcat:9.0-jre11-temurin-jammy

# Maintainer information (optional but good practice)
LABEL maintainer="Your Name <your.email@example.com>"
LABEL description="Simple Docker image to run a Tomcat server"

# To deploy a web application, you would typically add a step here
# to copy your .war file into the webapps directory:
COPY target/JavaWebApp-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# The Tomcat image typically exposes port 8080 by default,
# but explicitly stating it here is good documentation.
EXPOSE 8080

# The default command for the official Tomcat image starts the server.
# You usually don't need to specify CMD unless you want to override
# the default startup behavior (e.g., run a specific script before starting Tomcat).
CMD ["catalina.sh", "run"]


# If you want to remove the default webapps (examples, docs), uncomment the line below:
# RUN rm -rf /usr/local/tomcat/webapps/*
