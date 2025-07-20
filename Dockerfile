# ---- Build Stage ----
FROM maven:3.8.7-openjdk-17 AS build

WORKDIR /app
COPY . .

# Build the project and skip tests
RUN mvn clean package -DskipTests

# ---- Run Stage ----
FROM openjdk:17-jdk-slim

WORKDIR /app

# Copy jar from build stage
COPY --from=build /app/target/*.jar app.jar

# Set port Render will use
ENV PORT=8080
EXPOSE 8080

# Run the jar
CMD ["java", "-jar", "app.jar"]
