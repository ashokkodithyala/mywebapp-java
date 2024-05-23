FROM openjdk:21-jdk-slim

WORKDIR /app

COPY /home/runner/work/mywebapp-java/mywebapp-java/target/*.jar MyWebApp.jar

RUN pwd && ls -ls

RUN chmod +x MyWebApp.jar

EXPOSE 8080

# Run the jar file
CMD ["java", "-jar", "MyWebApp.jar"]