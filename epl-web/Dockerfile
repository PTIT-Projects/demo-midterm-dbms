FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app
COPY ./target/epl-web.jar app.jar
COPY ./opentelemetry-javaagent.jar opentelemetry-javaagent.jar
EXPOSE 8080
ENTRYPOINT ["java", "-javaagent:/app/opentelemetry-javaagent.jar", "-jar", "app.jar"]