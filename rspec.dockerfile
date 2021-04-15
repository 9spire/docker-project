FROM ruby:alpine
LABEL maintainer="9spire@gmail.com"

RUN apk add build-base ruby-nokogiri
RUN gem install rspec capybara selenium-webdriver

ENTRYPOINT [ "rspec" ]