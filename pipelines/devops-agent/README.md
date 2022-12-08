# Azure DevOps agents
Create azure devops agents in docker containers

## Build Image

### Windows    
Place **Dockerfile** and **run-agent.ps1** inside a folder.

### Linux  
Place **Dockerfile** and **start.sh** inside a folder.

### Run command: 
`docker build . -t "YOUR_IMAGE_NAME"`


## Run agent

### Windows  
``` 
docker run -d --name CONTAINER_NAME --hostname HOSTNAME --restart unless-stopped -e VSTS_AGENT_INPUT_TOKEN=TOKEN  -e VSTS_AGENT_INPUT_POOL=YOUR_POOL image:latest
```

### Linux  
```
docker run -d --privileged --name CONTAINER_NAME --hostname HOSTNAME -e AZP_URL=https://dev.azure.com/YOUR_ORG_URL -e AGENT_ALLOW_RUNASROOT=1 -e AZP_POOL=YOUR_POOL -e AZP_AGENT_NAME=AGENT_NAME -e AZP_TOKEN=TOKEN  image:latest
```





