FROM ubuntu:latest

# Add microshit library
RUN apt -y update
RUN apt -y install wget
RUN wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN rm packages-microsoft-prod.deb

# install deps
RUN apt -y update
RUN apt -y upgrade
RUN apt -y install git unzip aspnetcore-runtime-6.0
RUN wget https://cdn.centcomm.spacestation14.com/builds/wizards/builds/fafd5413497482239bb042d7ebef8befee0de788/SS14.Server_linux-x64.zip

# extract the server
RUN unzip SS14.Server_linux-x64.zip
RUN rm SS14.Server_linux-x64.zip

# Run the server
RUN chmod +x Robust.Server
