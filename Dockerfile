FROM adoptopenjdk/openjdk11:alpine as builder

# CMD ["/bin/sh"]

ENV LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8

RUN apk --no-cache add curl && \
    mkdir /opt/gradle && \
    curl -sSL "https://services.gradle.org/distributions/gradle-7.2-bin.zip" -o /tmp/gradle.zip && \
    unzip -o /tmp/gradle.zip -d /opt/gradle && \
    rm /tmp/gradle.zip && \
    chmod +x /opt/gradle/gradle-7.2/bin/gradle && \
    echo 'export GRADLE_OPTS=-Xmx512m' >> /etc/profile.d/gradle.sh 
    #&& \
#    echo 'export GRADLE_USER_HOME=/opt/gradle' >> /etc/profile.d/gradle.sh && \
#    echo 'export PATH=$PATH:/opt/gradle/bin' >> /etc/profile.d/gradle.sh && \
#    echo 'export GRADLE_HOME=/opt/gradle' >> /etc/profile.d/gradle.sh

