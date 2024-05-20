FROM openjdk:21
WORKDIR /app

# Copy the JAR file (/app)
#COPY *.jar ./MyWebApp.jar
COPY . .

# Expose the port the app runs on
EXPOSE 8080

# Run the jar file
CMD ["java", "-jar", "MyWebApp.jar"]