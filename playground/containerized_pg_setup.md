# Containerized PostgreSQL database setup
Pull image:
```
docker pull postgres
```
Run pg container exposing it on port 5435 on host machine:
```
docker run --name playground -p 5435:5432 -e POSTGRES_PASSWORD=password postgres
```
