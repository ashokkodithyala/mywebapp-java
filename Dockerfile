FROM openjdk:21-alpine AS MAVEN_ENV
WORKDIR /build/
COPY pom.xml /build
COPY src /build/src
RUN mvn clean package -DskipTests=true

FROM openjdk:21-alpine
COPY  --from=MAVEN_ENV /build/target/MyWebApp-*.jar mywebapp.jar
ENTRYPOINT ["java", "-jar", "mywebapp.jar"]