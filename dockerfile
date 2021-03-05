version: "3.7"

 

services:
  api:
    build: ./Update_code
    depends_on:
      - db
    links:
      - db
    networks:
      - network-backend
      - network-frontend
    ports:
      - "0.0.0.0:8000:8000"
  webapp:
    build: ./ey-frontend/DigiCube-Frontend/
    depends_on:
      - api
    ports:
      - "0.0.0.0:4500:80"
    networks:
      - network-frontend

 

  db:
    build: ./sqlserver/
    env_file:
      - .env
      #volumes:
      #- "sqldata:/var/opt/mssql"
    networks:
      - network-backend
    ports:
      - "0.0.0.0:1415:1433"

 

networks:
  network-backend:
  network-frontend:

 

volumes:
  sqldata:
