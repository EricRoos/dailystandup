FROM ruby:2.7.0
ARG RAILS_MASTER_KEY
RUN apt-get update -yq \
    && apt-get install curl gnupg -yq \
    && curl -sL https://deb.nodesource.com/setup_13.x | bash \
    && apt-get install nodejs -yq \
    && npm install -g yarn

ENV RAILS_ENV=production
ENV RAILS_LOG_TO_STDOUT=true
ENV RAILS_SERVE_STATIC_FILES=true


RUN mkdir /app
WORKDIR /app

COPY Gemfile.lock /app
COPY Gemfile /app
RUN gem install bundler:2.1.4

RUN bundle install --without development test
COPY package.json /app
COPY yarn.lock /app
RUN yarn install


COPY . /app
RUN RAILS_MASTER_KEY=${RAILS_MASTER_KEY} bundle exec rake assets:precompile

EXPOSE 3000
CMD bundle exec rails s -p 3000

