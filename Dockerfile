# Use a lightweight Java image
FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /app

# Copy everything to container
COPY . .

# Build the project
RUN mvn clean package -DskipTests

# Expose port (Render uses PORT env)
EXPOSE 8080

# Run the JAR (replace with your actual JAR name from target/)
CMD ["java", "-jar", "target/TodoAIWebApp.jar"]
