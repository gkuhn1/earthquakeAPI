FROM ruby:2.5.0-alpine3.7

RUN apk --update add --virtual \
  build-dependencies build-base \
  postgresql-dev \
  libc-dev \
  linux-headers \
  libxml2-dev \
  libxslt-dev \
  postgresql-dev \
  tzdata \
  && rm -rf /var/cache/apk/*

# Define working directory
WORKDIR /app

COPY ./Gemfile /app/Gemfile

# Install Bundler
RUN gem install bundle

RUN bundle config build.nokogiri --use-system-libraries

RUN bundle install

# Cleanup
# RUN apk del build-dependencies