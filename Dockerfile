FROM ruby:2.4.2-alpine

ENV APP_ROOT /usr/src/app

RUN mkdir -p $APP_ROOT

WORKDIR $APP_ROOT
EXPOSE 3000

ENV BASE_PACKAGES="git" \
    BUILD_PACKAGES="bash curl-dev ruby-dev build-base" \
    DEV_PACKAGES="zlib-dev libxml2-dev libxslt-dev tzdata yaml-dev sqlite-dev postgresql-dev mysql-dev" \
    RUBY_PACKAGES="ruby-json yaml nodejs"

RUN apk update && \
    apk upgrade && \
    apk add --update --no-cache \
    $BASE_PACKAGES \
    $BUILD_PACKAGES \
    $DEV_PACKAGES \
    $RUBY_PACKAGES \
    $GEM_PACKAGES

COPY Gemfile $APP_ROOT
COPY Gemfile.lock $APP_ROOT

RUN bundle config build.nokogiri --use-system-libraries && \
    bundle install -j4 && \
    bundle clean

COPY . $APP_ROOT
