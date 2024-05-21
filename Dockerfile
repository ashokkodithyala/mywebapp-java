FROM openjdk:17-jdk-slim

WORKDIR /app

ADD target/MyWebApp-0.0.1-SNAPSHOT.jar /app/MyWebApp.jar
RUN chmod +x MyWebApp.jar

EXPOSE 8080

# Run the jar file
CMD ["java", "-jar", "MyWebApp.jar"]