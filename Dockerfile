FROM gillbeits/java:jdk8
MAINTAINER Ivan Koretskiy <gillbeits@gmail.com>

RUN cd /opt \
    && wget --no-cookies --no-check-certificate --referer=https://cloud.mail.ru/public/e9301fc777d7/atlassian-confluence-5.7.1.tar.gz \
        https://cloclo18.datacloudmail.ru/weblink/get/e9301fc777d7/atlassian-confluence-5.7.1.tar.gz \
    && tar xzf atlassian-confluence-5.7.1.tar.gz \
    && rm -rf atlassian-confluence-5.7.1.tar.gz

RUN echo 'confluence.home=/var/confluence' > /opt/confluence/confluence/WEB-INF/classes/confluence-init.properties

EXPOSE 8090

VOLUME ["/opt/confluence", "/var/confluence"]

ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

CMD ["start"]
