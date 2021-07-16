
FROM winamd64/python:3.7.9-windowsservercore as base

SHELL ["cmd", "/S", "/C"]

# Install Chocolatey
#RUN powershell iex(iwr -useb https://chocolatey.org/install.ps1)


WORKDIR /build

RUN python -c "print('hello world', file=open('foo.txt', 'w'))"
