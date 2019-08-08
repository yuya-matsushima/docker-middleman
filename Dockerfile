FROM fillininc/ruby:2.6.3-18.04
LABEL maintainer="Yuya Matsushima"

ARG NODE_MAJOR_VERSION=10
ENV APP_DIR /app

RUN apt-get -qq update \
      && apt-get install -y curl git tzdata build-essential awscli ca-certificates \
      && curl -sL https://deb.nodesource.com/setup_$NODE_MAJOR_VERSION.x | bash - \
      && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
      && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
      && apt-get -qq update \
      && apt-get install -y nodejs yarn ruby-dev \
      && rm -rf /var/lib/apt/lists/*

WORKDIR $APP_DIR

EXPOSE 4567

VOLUME $APP_DIR

CMD ["bash"]
