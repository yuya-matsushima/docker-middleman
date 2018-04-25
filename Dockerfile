FROM ubuntu:16.04
MAINTAINER Yuya Matsushima

RUN apt-get -qq update \
      && apt-get install -y curl awscli \
      && curl -sL https://deb.nodesource.com/setup_8.x | bash - \
      && apt-get install -y nodejs

RUN apt-get install -y build-essential libbison-dev libffi-dev libgdbm-dev libncurses5-dev libreadline6-dev libssl-dev libxml2-dev libxslt1-dev libyaml-dev zlib1g-dev \
      && curl https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.1.tar.gz | tar xz -C /tmp \
      && cd /tmp/ruby-2.5.1/; ./configure --prefix=/usr/local/ruby/2.5.1 \
      && cd /tmp/ruby-2.5.1/; make && make test && make install \
      && /usr/local/ruby/2.5.1/bin/gem install bundler --no-ri --no-rdoc \
      && echo 'gem: --no-ri --no-rdoc' > ~/.gemrc \
      && rm -rf /tmp/ruby-2.5.1

ENV PATH $PATH:/usr/local/ruby/2.5.1/bin
