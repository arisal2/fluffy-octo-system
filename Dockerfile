FROM ruby:2.6.3
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /fluffy-octo-system
WORKDIR /fluffy-octo-system
COPY Gemfile /fluffy-octo-system/Gemfile
COPY Gemfile.lock /fluffy-octo-system/Gemfile.lock
RUN bundle install
COPY . /fluffy-octo-system

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
ENV PORT 3000
EXPOSE $PORT


# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
