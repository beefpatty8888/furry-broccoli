FROM ubuntu:xenial

RUN apt update
RUN apt install curl git gnupg2 build-essential zlib1g-dev -y
RUN gpg2 --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
RUN curl -sSL https://get.rvm.io | bash
SHELL ["/bin/bash", "-l", "-c"]
RUN source /etc/profile.d/rvm.sh
RUN rvm install 2.4
RUN rvm use 2.4

#WORKDIR site
RUN mkdir site
RUN gem install jekyll bundler
#RUN echo 'gem "jekyll"' >> Gemfile
#RUN echo 'gem "github-pages", group: :jekyll_plugins' >> Gemfile
#RUN echo 'gem "jekyll-theme-slate"' >> Gemfile
ENTRYPOINT cd site && bundle install && jekyll serve --host 0.0.0.0
