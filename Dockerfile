FROM maven:3.8.1-openjdk-11-slim AS MAVEN_ENV
WORKDIR /build/
COPY pom.xml /build
COPY src /build/src
RUN mvn clean package -DskipTests=true

FROM openjdk:11-jre-slim-buster
COPY  --from=MAVEN_ENV /build/target/MyWebApp-*.jar mywebapp.jar
ENTRYPOINT ["java", "-jar", "mywebapp.jar"]