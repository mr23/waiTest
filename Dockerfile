FROM alpine:3.14 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

FROM alpine:3.14
COPY --from=build /app/target/Template.jar /Template.jar
EXPOSE 8080
CMD ["java", "-jar", "/Template.jar"]
