FROM ruby:2.5
RUN gem install rest-client sinatra json
RUN gem install cucumber
COPY . ./
EXPOSE 8080
CMD ["ruby","book-library.rb","-p","8080"]