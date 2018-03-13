FROM ubuntu

RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list
RUN echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
RUN apt-get update
RUN echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections

RUN apt-get update && apt-get install -y \
        gradle \
        oracle-java8-installer \
        oracle-java8-set-default \
        unzip \
        wget \
    && rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/platform-tools

WORKDIR /opt

ARG SDK_FILE=android-sdk.zip

RUN wget -O ${SDK_FILE} https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip \
    && unzip ${SDK_FILE} -d ${ANDROID_HOME} \
    && rm ${SDK_FILE}

RUN mkdir $HOME/.android && touch $HOME/.android/repositories.cfg

RUN yes | sdkmanager --licenses

VOLUME /opt/android-sdk-linux
