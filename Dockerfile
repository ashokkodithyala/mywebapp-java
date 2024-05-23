FROM openjdk:21-jdk-slim

WORKDIR /home/runner/work/mywebapp-java/mywebapp-java/target/

COPY *.jar app/MyWebApp.jar

RUN pwd && ls -ls

RUN chmod +x app/MyWebApp.jar

EXPOSE 8080

# Run the jar file
CMD ["java", "-jar", "app/MyWebApp.jar"]