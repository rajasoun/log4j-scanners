FROM shiftleft/scan

# Defining default non-root user UID, GID, and name 
ARG USER_UID="1000"
ARG USER_GID="1000"
ARG USER_NAME="sast-shell"
ENV HOSTNAME="sast-shell"

ENV TZ="Asia/Kolkata"
ENV HOME="/home/$USER_NAME"


# Creating default non-user 
RUN set -x \
    && groupadd -g $USER_GID $USER_NAME \
	&& useradd -m -g $USER_GID -u $USER_UID $USER_NAME
    
# Switching to non-root user 
USER $USER_UID:$USER_GID

CMD [ "python3", "/usr/local/src/scan" ]