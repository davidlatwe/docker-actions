
FROM mcr.microsoft.com/windows/servercore:ltsc2019 as base

SHELL ["cmd", "/S", "/C"]

WORKDIR /build

RUN python -c "print('hello world', file=open('foo.txt', 'w'))"
