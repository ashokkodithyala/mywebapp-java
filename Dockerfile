FROM openjdk:21-jdk-slim

WORKDIR /app

ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} MyWebApp.jar

#ADD target/MyWebApp-0.0.1-SNAPSHOT.jar /app/MyWebApp.jar
RUN chmod +x MyWebApp.jar

EXPOSE 8080

# Run the jar file
CMD ["java", "-jar", "MyWebApp.jar"]