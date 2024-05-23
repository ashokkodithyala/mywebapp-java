# Stage 1: Build the application
FROM openjdk:21-jdk-slim

WORKDIR /app                   

# Copy jar file from current directory to /app
COPY target/*.jar MyWebApp.jar   

EXPOSE 8080

# Run the jar file
CMD ["java", "-jar", "MyWebApp.jar"]

