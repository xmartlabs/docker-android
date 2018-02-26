# docker-android

[Docker image](https://hub.docker.com/r/xmartlabs/android/) for Android development.

NB: While building the image, it automatically accepts the related Android SDK licenses.

# Usage

You can build another image on top of this one (e.g., a Jenkins CI server) by using multi-stage builds in your Dockerfile like:

```Dockerfile
FROM xmartlabs/android

FROM other-image
ENV ANDROID_HOME /opt/android-sdk-linux
COPY --from=0 ${ANDROID_HOME} ${ANDROID_HOME}
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
```
