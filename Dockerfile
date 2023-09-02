FROM maven:3.8.3-openjdk-11-slim AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

FROM maven:3.8.3-openjdk-11-slim
COPY --from=build /app/target/Template.jar /Template.jar
EXPOSE 8080
CMD ["java", "-jar", "/Template.jar"]
