kubectl apply -f pvc.yaml

kubectl apply -f pv.yaml

kubectl apply -f postgresql-deployment.yaml

first_pod=$(kubectl get pods | awk 'NR==2{print $1}')

kubectl exec -it $first_pod -- bash

kubectl apply -f postgresql-service.yaml

PGPASSWORD="mypassword" psql --host 127.0.0.1 -U myuser -d mydatabase -p 5433 < db/1_create_tables.sql
PGPASSWORD="mypassword" psql --host 127.0.0.1 -U myuser -d mydatabase -p 5433 < db/2_seed_users.sql 
PGPASSWORD="mypassword" psql --host 127.0.0.1 -U myuser -d mydatabase -p 5433 < db/3_seed_tokens.sql 

export DB_USERNAME=myuser
export DB_PASSWORD=$POSTGRES_PASSWORD
export DB_HOST=127.0.0.1
export DB_PORT=5433
export DB_NAME=mydatabase 

./analytics/bin/python3 ./analytics/app.py