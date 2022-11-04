FROM ruby:3.1.2

WORKDIR /app/langwire

COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .
RUN RAILS_ENV=production bundle exec rake assets:precompile

CMD bundle exec rails s -p 80 -b 0.0.0.0
