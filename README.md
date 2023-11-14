# README

## 環境
- ruby 3.1.2
- rails 6.1.7

### 用意するもの
・Dockerfile
・docker-compose.yml
・entrypoint.sh
Gemfile
```
source 'https://rubygems.org/'
gem 'rails', '6.1.7'
```
・Gemfile.lock
中身は空でok!

コマンド
1. $ docker compose run --rm web rails new . --force --webpack
この時、Dockerfile内のbundle installをコメントアウト

2. $ docker compose build
先ほどコメントアウトしたものを復活させる

3. $ docker compose up