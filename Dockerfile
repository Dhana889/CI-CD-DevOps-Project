FROM adoptopenjdk/openjdk-17-jdk-alpine:latest
    
ENV APP_HOME /usr/src/app

WORKDIR $APP_HOME

COPY target/*.jar $APP_HOME/app.jar

EXPOSE 8080

CMD ["java", "-jar", "app.jar"]
