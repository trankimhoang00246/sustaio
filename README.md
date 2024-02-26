# sustaio
[Team Kìn chá nà - GDSC 2024] Sustaio App

## Project Description

## Run the project
1. Clone the project
2. Create database gdsc2024 by postgresql
```sql 
CREATE DATABASE gdsc2024;
```
3. Open project by Intellij IDEA
4. Choose java version 17 in intellij
- file -> project structure -> project -> sdk -> 17
5. Edit file /resources/application-dev.yml flow environment postgresql in your computer
```yaml
server:
  port: 8082 #post app

spring:
  datasource:
    url: jdbc:postgresql://localhost:5432/gdsc2024 #/url database
    username: postgres #username database
    password: 123 #password database
```
6. Run the project
7. Open browser and access to http://localhost:8082/swagger-ui/index.html
- Account login:
- Currently, only this farmer account has the most complete data to test
- Now, test API
```json
{
  "username": "farmer",
  "password": "farmer"
}
```
```json
{
  "username": "admin",
  "password": "admin"
}
```