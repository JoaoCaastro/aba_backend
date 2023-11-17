# Use uma imagem do Ruby
FROM ruby:3.2.2

# Configurar o diretório de trabalho no contêiner
WORKDIR /aba-project-rails-api

# Instalar dependências do sistema
RUN apt-get update -qq && \ 
    apt-get install -y build-essential libvips bash bash-completion libffi-dev tzdata postgresql nodejs npm yarn && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /usr/share/doc /usr/share/man

# Instalar gems
COPY Gemfile /aba-project-rails-api/Gemfile
COPY Gemfile.lock /aba-project-rails-api/Gemfile.lock
RUN gem install bundler:2.2.26
RUN bundle install

# Copiar o restante do código para o contêiner
COPY . /aba-project-rails-api

# Expor a porta 3000
EXPOSE 3000

# Iniciar o servidor
CMD  ["rails", "server", "-b", "0.0.0.0"]