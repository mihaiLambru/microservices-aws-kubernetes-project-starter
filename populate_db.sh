kubectl port-forward service/postgresql-service 5433:5432 &

kubectl port-forward service/postgresql-service 5433:5432 &

# Capture the PID of the port-forward process
PF_PID=$!

# Set the database password
export PGPASSWORD="mypassword"

# Wait for the port-forward to be established by checking the port availability
while ! nc -z localhost 5433; do   
  echo "Waiting for port-forwarding to be established..."
  sleep 1
done


psql --host 127.0.0.1 -U myuser -d mydatabase -p 5433 < db/1_create_tables.sql
psql --host 127.0.0.1 -U myuser -d mydatabase -p 5433 < db/2_seed_users.sql
psql --host 127.0.0.1 -U myuser -d mydatabase -p 5433 < db/3_seed_tokens.sql

kill $PF_PID
