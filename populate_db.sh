kubectl port-forward service/postgresql-service 5433:5432 &

PF_PID=$!

export PGPASSWORD="mypassword"

while ! nc -z localhost 5433; do   
  echo "Waiting for port-forwarding to be established..."
  sleep 1
done


psql --host 127.0.0.1 -U myuser -d mydatabase -p 5433 < db/1_create_tables.sql
psql --host 127.0.0.1 -U myuser -d mydatabase -p 5433 < db/2_seed_users.sql
psql --host 127.0.0.1 -U myuser -d mydatabase -p 5433 < db/3_seed_tokens.sql

kill $PF_PID
