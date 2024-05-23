FROM openjdk:21-jdk-slim

WORKDIR /target/jar/target

COPY *.jar app/MyWebApp.jar

RUN pwd && ls -ls

RUN chmod +x MyWebApp.jar

EXPOSE 8080

# Run the jar file
CMD ["java", "-jar", "app/MyWebApp.jar"]