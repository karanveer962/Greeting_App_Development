# Use a base image with Maven and Java installed
FROM maven:3.8.4-openjdk-17 

# Set the working directory inside the container
WORKDIR /app

# Copy the source code
COPY . .

# Build the Maven project to generate the JAR file
RUN mvn clean package

CMD ["java","- jar","/target/GreetingApp-0.0.1-SNAPSHOT.jar"]



