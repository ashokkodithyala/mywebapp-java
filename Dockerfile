FROM maven:3.8.1-openjdk-11-slim AS MAVEN_ENV
WORKDIR /build/
COPY pom.xml /build
RUN mvn -e -B dependency:resolve
COPY src /build/src
RUN mvn clean -e -B package

FROM openjdk:11-jre-slim-buster
COPY  --from=MAVEN_ENV /build/target/MyWebApp-*.jar mywebapp.jar
ENTRYPOINT ["java", "-jar", "mywebapp.jar"]
