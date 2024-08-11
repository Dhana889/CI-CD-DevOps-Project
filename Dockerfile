FROM maven:3.9.0-eclipse-temurin-17 as build

ENV APP_HOME /usr/src/app

WORKDIR $APP_HOME

COPY src .

RUN mvn clean package

FROM eclipse-temurin:17-jdk-alpine

COPY --from=build target/*.jar $APP_HOME/app.jar

EXPOSE 8080

CMD ["java", "-jar", "app.jar"]
