FROM eclipse-temurin:17-jdk-alpine
WORKDIR /app
COPY . .
RUN chmod +x gradlew && ./gradlew build -x test
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "build/libs/cicd-demo-0.0.1-SNAPSHOT.jar"]