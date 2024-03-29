# kateswithoutimage

## This Repo is to show how to use Kubernetes without having a Container Registry

## Background and Setup 

Update `/kubernetes/app-deployment.yaml` with the values below

``` 
      - name: builder
        image: builder
        env:
        - name: DOCKER_HOST
          value: tcp://dind:2375
        - name: repository
          value: "URL to your Git Repo"
        - name: tag
          value: test          
        - name: dockerfilepath
          value: "path to the dockerfile in your git repo"  
        - name: dockerpath
          value: "path you want to pass to the dockerfile your building"
```    

your cluster will need the builder image provided in 

`docker/`

this Dockerfile will build an image that is able to run both docker and git. 

the script in `docker/scripts/` is just a startup script that is setup to clone your repo and build the image. 

## Kubernetes Portion
You will need a docker in docker deployment and service running in your cluster for the builder to be able to build your image within the cluster. 

that is where `kubernetes/dind.yaml` comes in

Once that is running you will be able to deploy out `app-deployment.yaml` which will clone your git repo, and build your docker image on your cluster and then start the image as a deployment on the cluster.