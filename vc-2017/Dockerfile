
FROM mcr.microsoft.com/windows/servercore:ltsc2019 as base

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN New-Item C:/temp -ItemType Directory; \
  New-Item C:/data -ItemType Directory;
WORKDIR C:/temp

ENV PYTHON_VERSION 3.7.9
ENV PYTHON_RELEASE 3.7.9

RUN $url = ('https://www.python.org/ftp/python/{0}/python-{1}-amd64.exe' -f $env:PYTHON_RELEASE, $env:PYTHON_VERSION); \
    Write-Host ('Downloading {0} ...' -f $url); \
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; \
    Invoke-WebRequest -Uri $url -OutFile 'python.exe'; \
    \
    Write-Host 'Installing ...'; \
# https://docs.python.org/3.7/using/windows.html#installing-without-ui
    Start-Process python.exe -Wait \
        -ArgumentList @( \
            '/quiet', \
            'InstallAllUsers=1', \
            'TargetDir=C:\Python37', \
            'PrependPath=1', \
            'Shortcuts=0', \
            'Include_doc=0', \
            'Include_pip=0', \
            'Include_test=0' \
        ); \
    \
#the installer updated PATH, so we should refresh our local value
    $env:PATH = [Environment]::GetEnvironmentVariable('PATH', [EnvironmentVariableTarget]::Machine); \
    \
    Write-Host 'Verifying install ...'; \
    Write-Host '  python --version'; python --version; \
    \
    Write-Host 'Removing ...'; \
    Remove-Item python.exe -Force; \
    \
    Write-Host 'Complete.'

SHELL ["cmd", "/S", "/C"]


WORKDIR /build

RUN python -c "print('hello world', file=open('foo.txt', 'w'))"
