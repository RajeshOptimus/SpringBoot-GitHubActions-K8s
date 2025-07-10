# Use Eclipse Temurin JDK 11 (Alpine is small and production-friendly)
FROM eclipse-temurin:11-jdk-alpine

# Set working directory inside container
WORKDIR /app

# Copy the jar file to the container (update the path if needed)
COPY target/*.jar app.jar

# Expose the port your Spring Boot app runs on (default is 8080)
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
