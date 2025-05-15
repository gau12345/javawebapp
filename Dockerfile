# Use a base image that includes a JRE and Tomcat.
# This example uses an Eclipse Temurin image with Tomcat.
# You can choose other base images like 'tomcat:latest', 'openjdk:11-jre-slim', etc.
# Using a specific version like 'temurin:11-jre-jammy' is recommended for stability.
FROM eclipse-temurin:11-jre-jammy as builder

# Set the working directory inside the container
WORKDIR /app

# Copy the Maven WAR file from your local target directory into the container.
# The 'target/*.war' assumes your mvn package step produced a WAR file there.
# Adjust 'your-project-name.war' to the actual name of your WAR file.
# You can find the WAR file name in your pom.xml's <build><finalName> or defaults to artifactId-version.war
COPY target/JavaWebApp-0.0.1-SNAPSHOT.war /app/JavaWebApp-0.0.1-SNAPSHOT.war

# --- Now, build the final image ---
# Use a base image that has Tomcat installed.
# We'll use the official Tomcat image, which is based on OpenJDK
# Using a specific version is highly recommended
FROM tomcat:9.0-jre11-temurin-jammy

# Remove the default webapps that come with Tomcat (optional, but keeps image smaller)
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the WAR file from the builder stage into Tomcat's webapps directory.
# Tomcat automatically deploys WAR files placed in the webapps directory.
COPY --from=builder /app/JavaWebApp-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/JavaWebApp-0.0.1-SNAPSHOT.war

# Expose the default Tomcat port (8080)
# EXPOSE 9191

# Command to run when the container starts.
# The default command for the tomcat image starts the server.
CMD ["catalina.sh", "run"] # This is often the default, no need to explicitly state it unless changing

# You can add labels to your image (optional but good practice)
LABEL maintainer="Gaurav <your.email@example.com>"
LABEL version="1.0"
LABEL description="Docker image for Your Java Web Application"
