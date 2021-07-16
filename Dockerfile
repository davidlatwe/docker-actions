
FROM mcr.microsoft.com/windows/servercore:ltsc2019 as base

SHELL ["cmd", "/S", "/C"]

# Install Chocolatey
RUN powershell iex(iwr -useb https://chocolatey.org/install.ps1)

# Install python
RUN choco install python3.7 -y -o -ia "'/qn /norestart ALLUSERS=1 TARGETDIR=c:\Python37'"


RUN setx `
    PATH "%PATH%;C:/Python37/Scripts"


WORKDIR /build

RUN python -c "print('hello world', file=open('foo.txt', 'w'))"
