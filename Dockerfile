# TODO: export JAVA_HOME and MAVEN_HOME to env vars

FROM ubuntu:latest
ARG DEBIAN_FRONTEND=noninteractive
 
# Prepare installation of Java
ENV JAVA_VER 11

# Install packages
RUN apt update -y && apt install -y wget curl sudo nano gnupg2 apt-utils software-properties-common whiptail coreutils git nodejs npm


# Install Amazon Corretto Java
RUN wget -O- https://apt.corretto.aws/corretto.key | sudo apt-key add - && \
    sudo add-apt-repository 'deb https://apt.corretto.aws stable main' && \
    sudo apt update -y && \
    sudo apt install -y java-${JAVA_VER}-amazon-corretto-jdk

# Install Maven
ENV MVN_VER 3.8.8
RUN wget --no-verbose -O /tmp/apache-maven-${MVN_VER}-bin.tar.gz http://www-eu.apache.org/dist/maven/maven-3/${MVN_VER}/binaries/apache-maven-${MVN_VER}-bin.tar.gz && \
    tar xzf /tmp/apache-maven-${MVN_VER}-bin.tar.gz -C /opt/ && \
    ln -s /opt/apache-maven-${MVN_VER} /opt/maven && \
    ln -s /opt/maven/bin/mvn /usr/local/bin  && \
    rm -f /tmp/apache-maven-${MVN_VER}-bin.tar.gz
    
