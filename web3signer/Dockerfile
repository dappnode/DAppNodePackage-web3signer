ARG UPSTREAM_VERSION

################
# Runner image #
################

FROM consensys/web3signer:$UPSTREAM_VERSION
USER root
RUN apt update && apt install ca-certificates unzip --yes

COPY /security /security
COPY entrypoint.sh /usr/bin/entrypoint.sh

ENV JAVA_OPTS="-Xmx2g -Xms128m"

#USER web3signer
EXPOSE 9000
ENTRYPOINT /bin/bash /usr/bin/entrypoint.sh
