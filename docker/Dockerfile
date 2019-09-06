FROM docker:stable AS docker_build
RUN apk --update add git less openssh && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

COPY ./scripts/startup.sh /startup.sh

RUN chmod a+x startup.sh 

CMD ["/startup.sh"]
