FROM ruby:3.1.2
# ライブラリのインストール
RUN apt-get update -qq 
#git activestarage sqlite3
RUN apt-get install -y git imagemagick libmagick++-dev sqlite3

#nodejs 16のインストール
#nodejs ver.16だとwebpackerと相性相が悪い
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
RUN apt install -y nodejs

#yarnのインストール
RUN npm install n -g 
RUN npm install -g yarn 
RUN gem install rails -v 6.1.4

#workingディデクトリの作成
RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock /app

#Gemfileのコピーとインストール
RUN bundle install

ENTRYPOINT ["/app/entrypoint.sh"]

CMD ["rails", "server", "-b", "0.0.0.0"]