<br>

This repository focuses on in-container machine learning lifecycle servers, whereby the servers depend on Cloud Platform assets, e.g., cloud hosted databases.

<br>

## *Mlflow* & Remote Development

### Image

For the Mlflow Server, the remote development environment requires

* [Dockerfile](/.devcontainer/Dockerfile)
* [requirements.txt](/.devcontainer/requirements.txt)

Build the image via `docker-compose`; next.

<br>

### Docker Compose

The server depends on an Amazon Web Services hosted postgre database.  To launch the server within a docker container, foremost a docker compose script **compose.yaml** that includes database communication details:

```yaml
services:
  app:
    build:
      dockerfile: Dockerfile
    image: flow
    ports:
      - 0.0.0.0:5000:5000
    working_dir: /app
    volumes:
      - ~/.aws:{a container path for .aws data}:readonly
    environment:
      - AWS_CONFIG_FILE={a container path for .aws data}/config
      - AWS_SSO_SESSION={an amazon web services single sign on session name}
    command: mlflow server --host 0.0.0.0:5000 --backend-store-uri "$KEY@$ENDPOINT:$PORT/$DB" --default-artifact-root "$ARTEFACT_ROOT"
```

Whereby **artefacts.env** is a private environment variables `.env`:

```env
ARTEFACT_ROOT=s3://.../..
KEY=postgresql://{username}:{password}
ENDPOINT={endpoint}
PORT={port.number}
DB={database.name}
```

Subsequently

```shell
cd .devcontainer
docker-compose --env-file=artefacts.env up
```

<br>
<br>

## References

Remote Tracking, Machine Learning Operations, etc.

* [Target Operating Model](https://mlflow.org/docs/latest/ml/tracking/#other-tracking-setup)
* [Tracking Server](https://mlflow.org/docs/latest/ml/getting-started/logging-first-model/step1-tracking-server)
* MLOps
  * [01: Building a Scalable MLOps Platform with Terraform and AWS EKS](https://medium.com/@amirrezakha/building-a-scalable-mlops-platform-with-terraform-and-aws-eks-9e1fd953d005)
  * [02: MLflow and KServe on Kubernetes — Full-Scale MLOps Deployment](https://medium.com/@amirrezakha/mlflow-and-kserve-on-kubernetes-full-scale-mlops-deployment-de80b259e412)
  * [03: Building Modular and Scalable Data Science Pipelines in MLOps](https://medium.com/@amirrezakha/building-modular-and-scalable-data-science-pipelines-in-mlops-46e89451bd40)
* [MLflow with Remote Tracking Server, Backend & Artefact Stores](https://medium.com/yelassad/mlflow-with-remote-tracking-server-backend-and-artifact-stores-39912680a464)
* [PostGRE: Connecting](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_ConnectToPostgreSQLInstance.html)
* [Dockerfile & USER](https://www.docker.com/blog/understanding-the-docker-user-instruction)

<br>
<br>

<br>
<br>

<br>
<br>

<br>
<br>

