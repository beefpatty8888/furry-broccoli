FROM ubuntu:xenial

RUN apt update
RUN apt install curl git gnupg2 build-essential zlib1g-dev sudo -y
RUN gpg2 --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
RUN useradd -m jekyll
RUN echo 'jekyll ALL=(ALL) NOPASSWD: /usr/bin/apt,/usr/bin/apt-get' >> /etc/sudoers.d/jekyll
USER jekyll
RUN curl -sSL https://get.rvm.io | bash
SHELL ["/bin/bash", "-l", "-c"]
RUN source /home/jekyll/.rvm/scripts/rvm
RUN rvm install 2.4
RUN rvm use 2.4

#WORKDIR site
RUN mkdir /home/jekyll/site
RUN gem install jekyll bundler
#RUN echo 'gem "jekyll"' >> Gemfile
#RUN echo 'gem "github-pages", group: :jekyll_plugins' >> Gemfile
#RUN echo 'gem "jekyll-theme-slate"' >> Gemfile
ENTRYPOINT cd /home/jekyll/site && bundle install && jekyll serve --host 0.0.0.0
