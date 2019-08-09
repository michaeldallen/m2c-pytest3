FROM ubuntu:xenial


# thanks to:
#     https://hub.docker.com/r/wouterds/rpi-jenkins/dockerfile
#     https://github.com/jenkinsci

RUN apt-get update && apt-get -y dist-upgrade

# Install Python

