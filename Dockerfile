FROM ruby:3.1.2

WORKDIR /app/langwire

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .
CMD bundle exec rails s -p 8000
