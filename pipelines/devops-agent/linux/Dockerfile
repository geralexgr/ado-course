################## UBUNTU 22.10
#FROM ubuntu:22.10
################## UBUNTU 20.04
FROM ubuntu:20.04

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
&& DEBIAN_FRONTEND=noninteractive apt-get install -y -qq --no-install-recommends \
        ca-certificates \
        curl \
        jq \
        git \
        unzip \
        libssl-dev \
        openssl \
        iproute2 \
        wget \
        zip \
        apt-utils \
        apt-transport-https \
        nodejs \
        fuse-overlayfs \
        gnupg-agent \
        python3 \
        lsb-release \ 
        software-properties-common \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /etc/apt/sources.list.d/*

################## UBUNTU 20.04
RUN wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb &&  dpkg -i packages-microsoft-prod.deb && rm packages-microsoft-prod.deb

################## UBUNTU 22.10
#RUN apt-add-repository https://packages.microsoft.com/ubuntu/20.04/prod
#RUN curl -sSL https://packages.microsoft.com/keys/microsoft.asc | tee /etc/apt/trusted.gpg.d/microsoft.asc



RUN apt-get update \  
&& apt-get install -y dotnet-sdk-6.0 dotnet-sdk-5.0 dotnet-sdk-7.0

RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash
RUN wget https://github.com/PowerShell/PowerShell/releases/download/v7.3.0/powershell_7.3.0-1.deb_amd64.deb -O ./powershell-lts_7.3.0-1.deb_amd64.deb && dpkg -i ./powershell-lts_7.3.0-1.deb_amd64.deb


RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

RUN apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin  


ENV TARGETARCH=linux-x64


WORKDIR /azp
COPY ./start.sh .
RUN chmod +x start.sh

ENTRYPOINT [ "./start.sh" ]




