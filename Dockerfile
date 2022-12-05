# Build application
FROM adoptopenjdk/maven-openjdk12 AS build
COPY src /myportfolio/src
COPY pom.xml /myportfolio
RUN mvn -f /myportfolio/pom.xml clean package spring-boot:repackage

# Run application
FROM openjdk:12
COPY --from=build /myportfolio/target/myportfolio.jar /usr/local/lib/myportfolio.jar
ENTRYPOINT ["java","-jar","/usr/local/lib/myportfolio.jar"]