# Use uma imagem do Ruby
FROM ruby:3.2.2

# Configurar o diretório de trabalho no contêiner
WORKDIR /aba-project-rails-api

# Instalar dependências do sistema
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Instalar gems
COPY Gemfile Gemfile.lock ./
RUN gem install bundler:2.2.26
RUN bundle install

# Copiar o restante do código para o contêiner
COPY . .

# Expor a porta 3000
EXPOSE 3000

# Iniciar o servidor
CMD ["rails", "server", "-b", "0.0.0.0"]