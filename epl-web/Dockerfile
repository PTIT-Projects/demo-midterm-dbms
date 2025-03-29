FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app

# Copy the jar from the target directory (relative to Dockerfile location)
COPY ./target/epl-web.jar app.jar

# Add OpenTelemetry Java Agent (from parent directory)
COPY ./opentelemetry-javaagent.jar opentelemetry-javaagent.jar

EXPOSE 8080

ENTRYPOINT ["java", "-javaagent:/app/opentelemetry-javaagent.jar", "-jar", "app.jar"]