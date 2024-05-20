FROM eclipse-temurin:17-jdk-focal
 
WORKDIR /app
 
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
RUN ./mvnw dependency:go-offline
 
COPY src ./src
COPY /build/target/MyWebApp-*.jar mywebapp.jar
ENTRYPOINT ["java", "-jar", "mywebapp.jar"]