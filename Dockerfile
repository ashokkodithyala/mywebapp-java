FROM openjdk:21-jdk-slim


WORKDIR /app

ARG JAR_FILE=target/
COPY . .

RUN pwd && ls -ls

#ADD target/MyWebApp-0.0.1-SNAPSHOT.jar /app/MyWebApp.jar
#RUN chmod +x MyWebApp.jar
RUN chmod + target/MyWebApp-0.0.1-SNAPSHOT.jar

EXPOSE 8080

# Run the jar file
CMD ["java", "-jar", "target/MyWebApp-0.0.1-SNAPSHOT.jar"]