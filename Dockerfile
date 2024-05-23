FROM openjdk:21-jdk-slim

WORKDIR /home/runner/work/mywebapp-java/mywebapp-java/target

RUN pwd && ls -ls

COPY *.jar app/MyWebApp.jar

#RUN chmod +x MyWebApp.jar
RUN chmod +x MyWebApp-0.0.1-SNAPSHOT.jar

EXPOSE 8080

# Run the jar file
CMD ["java", "-jar", "MyWebApp.jar"]