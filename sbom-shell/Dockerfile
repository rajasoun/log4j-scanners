FROM ubuntu:latest

# Defining default non-root user UID, GID, and name 
ARG USER_UID="1000"
ARG USER_GID="1000"
ARG USER_NAME="sbom-shell"
ENV HOSTNAME="ci-shell"

ENV TZ="Asia/Kolkata"
ENV HOME="/home/$USER_NAME"


# Creating default non-user 
RUN set -x \
    && groupadd -g $USER_GID $USER_NAME \
	&& useradd -m -g $USER_GID -u $USER_UID $USER_NAME

# Installing basic packages 
RUN set -x \
    && apt-get update  \
	&& apt-get install -y zip unzip curl git \
	&& rm -rf /var/lib/apt/lists/*  \
	&& rm -rf /tmp/*

RUN curl -sSfL https://raw.githubusercontent.com/anchore/syft/main/install.sh  | sh -s -- -b /usr/local/bin 
RUN curl -sSfL https://raw.githubusercontent.com/anchore/grype/main/install.sh | sh -s -- -b /usr/local/bin

# Switching to non-root user 
USER $USER_UID:$USER_GID
WORKDIR /scan-dir

COPY scan.sh /usr/local/bin

ENTRYPOINT ["scan.sh"]



