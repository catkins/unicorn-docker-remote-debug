FROM ruby:2.2.2

RUN mkdir /app
WORKDIR /app

# install dependencies
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install

# add in the app
COPY . /app

EXPOSE 3000
EXPOSE 3031

CMD ["bundle", "exec", "unicorn", "-c", "unicorn.rb"]
