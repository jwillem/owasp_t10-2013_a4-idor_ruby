FROM ruby:2.3

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -qq && apt-get install -y build-essential

# for postgres
RUN apt-get install -y libpq-dev

# for nokogiri
RUN apt-get install -y libxml2-dev libxslt1-dev

# for a JS runtime
RUN apt-get install -y nodejs

ENV APP_HOME /usr/src/app
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

ADD ./app/Gemfile $APP_HOME/
RUN bundle install

# for container startup
RUN wget -q https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh -P /usr/bin
RUN chmod +x /usr/bin/wait-for-it.sh
