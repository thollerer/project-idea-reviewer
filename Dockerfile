FROM bellsoft/liberica-openjdk-alpine:11.0.3

WORKDIR /app

RUN apk add maven
RUN apk add --no-cache libstdc++

COPY src /home/app/src
COPY pom.xml /home/app

RUN mvn -B -Pproduction -Ph2 -DskipTests -f /home/app/pom.xml clean package

ENTRYPOINT ["java","-jar","/home/app/target/demo-spring-google-oauth-app-0.1.0.jar"]
