# Run a FastAPI app with a Hugging Face model on Paperspace

## Intro

This is a template for users looking to deploy their own FastAPI app with a Hugging Face model on Paperspace.

- The [FastAPI](https://fastapi.tiangolo.com/lo/) app code is located in `app/main.py`
- The Dockerfile is used to create an image which was pushed as a public image to [paperspace/fastapi-hf-template-app:2023-06-20](https://hub.docker.com/repository/docker/paperspace/fastapi-hf-template-app)
- The above image can be deployed to Paperspace using the [app config](https://docs-next.paperspace.com/deploying/app-config) located at `paperspace.yaml`

## Project Structure

```
├── Dockerfile
├── requirements.txt
├── paperspace.yaml
├── app
    ├── main.py
```

## Develop locally

- Clone the repo to your workspace: `git clone https://github.com/gradient-ai/FastAPI-Template-App.git`
- Make updates to your application (e.g. application files, Dockerfile, requirements.txt)
- Change the Hugging Face model used in the app
- Build a new image by running `docker build -t my-image:tag .`
- Push image to the container registry of your choice by running `docker push my-image:tag`
- Update the app config at `paperspace.yaml` with the location of your new image
- Update the app config with your choice of Hugging Face model. When using integrations, mounts will be located at /opt/integrations/<name>
- Deploy your application on Paperspace by running [`pspace up`](https://docs-next.paperspace.com/cli/up). Ensure you have the [Paperspace CLI](https://github.com/Paperspace/cli#installation) installed.

## How to deploy

- Download the [Paperspace CLI](https://github.com/Paperspace/cli#installation)
- Run [`pspace init -t https://github.com/gradient-ai/FastAPI-Template-App`](https://docs-next.paperspace.com/cli/init) to initialize you app. This will create an app locally, clone this GitHub repo as your app template, and remotely link your app to Paperspace so you can add [secrets](https://docs-next.paperspace.com/secrets) and collaborators.
- Run [`pspace up`](https://docs-next.paperspace.com/cli/up) to deploy your app on Paperspace. This will send the app config at [paperspace.yaml)(paperspace.yaml) to Paperspace, which will spin up your application.

## Simplify your deployment workflow with GitHub Actions

Use the [Paperspace Deploy Action](https://github.com/Paperspace/deploy-action) to integrate a build/push process into your CI/CD pipeline.

## Benefits of Hugging Face integrations

Hugging Face integrations are a simple way to integrate Hugging Face models into your application while improving start time performance for auto-scaling and production level applications.

A Hugging Face integration happens once at the beginning of each new application deployment (i.e. each app config update). A temporary volume is created, the Hugging Face repo is then cloned into that volume, and that volume is then mounted to your container on startup at `/opt/integrations/<integration-name>`. Any new replicas that are spun up due to auto-scaling will also have the volume mounted to the same path, without having to go through the repo cloning process again, which shortens startup times for each subsequent replica spin up. Learn more about integrations in the [Paperspace docs](https://docs-next.paperspace.com/).



## Documentation

Learn more about Paperspace apps at our [documentation site](https://docs-next.paperspace.com/apps).