Function Configure {

    Write-Host "Configuring agent..."
    .\config.cmd --unattended --replace --acceptTeeEula --work work


# install powershell 7
dotnet tool install --global PowerShell

# Install sonar scanner global tool
dotnet tool install --global dotnet-sonarscanner --version 5.6.0
}

Function DownloadLatest {
Param (
    [Parameter(Mandatory=$true)]
    [string]$url,
    [Parameter(Mandatory=$true)]
    [string]$token
)

$auth = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$token"))
$package = Invoke-RestMethod "$url/_apis/distributedtask/packages/agent?platform=win-x64&$`top=1" `
    -Headers @{Authorization = "Basic $auth"}

$fileName = $package.value[0].fileName;
$downloadUrl = $package.value[0].downloadUrl;

if ((Test-Path .filename) -and (Get-Content .filename) -eq $fileName) {
    return
}

Write-Host "Downloading $fileName..."

Invoke-WebRequest -UseBasicParsing $downloadUrl -OutFile agent.zip
Expand-Archive -Force agent.zip -DestinationPath .
Remove-Item -Force agent.zip

$fileName | Out-File -FilePath .filename
}


DownloadLatest -url $Env:VSTS_AGENT_INPUT_URL -token $Env:VSTS_AGENT_INPUT_TOKEN

if (!(Test-Path .agent)) {
Configure
}


.\run.cmd
