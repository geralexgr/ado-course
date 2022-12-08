# escape=`

FROM mcr.microsoft.com/dotnet/framework/sdk:4.8-windowsservercore-ltsc2022


SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]


RUN Invoke-WebRequest -UseBasicParsing https://dot.net/v1/dotnet-install.ps1 -OutFile dotnet-install.ps1; `
    .\dotnet-install.ps1 -Channel 6.0 -Version 6.0.402 -InstallDir "${Env:ProgramFiles}\dotnet"; `
    Remove-Item -Force dotnet-install.ps1

RUN Invoke-WebRequest -UseBasicParsing https://dot.net/v1/dotnet-install.ps1 -OutFile dotnet-install.ps1; `
    .\dotnet-install.ps1 -Channel 7.0 -Version 7.0.100 -InstallDir "${Env:ProgramFiles}\dotnet"; `
    Remove-Item -Force dotnet-install.ps1

RUN Invoke-WebRequest -UseBasicParsing https://nodejs.org/dist/v18.12.1/node-v18.12.1-x64.msi -OutFile node.msi; `
    Start-Process msiexec -Wait -ArgumentList /quiet, /qn, /i, node.msi; `
    Remove-Item -Force node.msi

RUN Invoke-WebRequest -Uri https://aka.ms/installazurecliwindows -OutFile az.msi; `
    Start-Process msiexec -Wait -ArgumentList /quiet, /qn, /i, az.msi; `
    Remove-Item -Force az.msi

RUN Invoke-WebRequest -UseBasicParsing https://download.docker.com/win/static/stable/x86_64/docker-20.10.18.zip  -OutFile docker.zip; `
    Expand-Archive -Force docker.zip -DestinationPath $Env:ProgramFiles; `
    Remove-Item -Force docker.zip

WORKDIR C:\agent

COPY ./run-agent.ps1 .


CMD .\run-agent.ps1

ENV DOTNET_CLI_TELEMETRY_OPTOUT=true `
    # Agent name, defaults to machine name
    VSTS_AGENT_INPUT_AGENT= `
    VSTS_AGENT_INPUT_TOKEN= `
    VSTS_AGENT_INPUT_AUTH=PAT `
    VSTS_AGENT_INPUT_POOL=Default `
    VSTS_AGENT_INPUT_URL=https://dev.azure.com/geralexgr

RUN setx /m PATH ('{0};{1}\docker' -f $Env:PATH, $Env:ProgramFiles)