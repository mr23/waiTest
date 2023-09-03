FROM adoptopenjdk:11-jdk-hotspot-bionic AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

FROM adoptopenjdk:11-jre-hotspot-bionic
COPY --from=build /app/target/Template.jar /Template.jar
EXPOSE 8080
CMD ["java", "-jar", "/Template.jar"]
