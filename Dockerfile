FROM openjdk:8
EXPOSE 8080
ADD target/sample-integration-1.0.jar sample-integration-1.0.jar
ENTRYPOINT ["java","-jar","/sample-integration-1.0.jar"]

