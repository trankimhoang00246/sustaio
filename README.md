# sustaio
[Team Kìn chá nà - GDSC 2024] Sustaio App 

## Project Description

## Run the project 
1. Clone the project
2. Create database gdsc2024 by postgresql 
3. Open project by Intellij IDEA
4. Edit file /resources/application-dev.yml flow environment postgresql in your computer
```yaml
server:
  port: 8082 #post app

spring:
  datasource:
    url: jdbc:postgresql://localhost:5432/gdsc2024 #/url database
    username: postgres #username database
    password: 123 #password database
```
5. Run the project
6. Open browser and access to http://localhost:8082/swagger-ui/index.html
Account login:
```json
{
  "username": "admin",
  "password": "admin"
}

//or

{
  "username": "farmer",
  "password": "farmer"
}
```
