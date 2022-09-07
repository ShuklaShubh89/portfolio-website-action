FROM node:latest

LABEL "com.github.actions.name"="Portfolio Website Actions"
LABEL "com.github.actions.description"="Sync directory to an AWS S3 repository and invalidate cloudfront cache"
LABEL "com.github.actions.icon"="refresh-cw"
LABEL "com.github.actions.color"="green"

LABEL version="0.1.0"
LABEL repository="https://github.com/ShuklaShubh89/portfolio-website-action"
LABEL homepage="https://portfolio.shubhamshukla-resume.com/"
LABEL maintainer="Shubham Shukla <shubham.cored@gmail.com>"

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip -q awscliv2.zip
RUN ./aws/install

RUN useradd -ms /bin/bash nonroot
RUN usermod -aG sudo nonroot

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

USER nonroot

ENTRYPOINT ["/entrypoint.sh"]