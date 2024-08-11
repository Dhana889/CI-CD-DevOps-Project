FROM maven:3.9.0-eclipse-temurin-17 as build

WORKDIR /app

COPY src /app

COPY pom.xml /app

RUN mvn -f /app/pom.xml clean package

FROM eclipse-temurin:17-jdk-alpine

COPY --from=build /app/target/*.jar /app/app.jar

EXPOSE 8080

CMD ["java", "-jar", "app.jar"]
