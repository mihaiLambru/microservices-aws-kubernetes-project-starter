# Project structure

## Analytics folder `/analytics`

The folder containing the source code for our application. It also contains the Dockerfile for the application. Because of the [buildspec.yaml](./buildspec.yaml) file, every time changes apply to the origin repository, the docker image for the app is build and pushed to `aws ecr`.

## DB folder `/db`

This folder contains the deployment .yaml files for the database and the initialization of the database files.

# Running the app
Make sure you have `kubectl` configured

1. Deploy the database

```bash
kubectl apply -f db/pvc.yaml

kubectl apply -f db/pv.yaml

kubectl apply -f db/postgresql-deployment.yaml

kubectl apply -f db/postgresql-service.yaml

chmod +x ./populate_db.sh && ./populate_db.sh
```

2. Deploy the application

```bash
kubectl apply -f configmap.yaml

kubectl apply -f secrets.yaml

kubectl apply -f deployment.yaml
```
