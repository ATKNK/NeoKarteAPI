FROM ruby:3.3

# Dependências do sistema
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  postgresql-client

# Diretório da app
WORKDIR /NeoKarteAPI

# Copia Gemfile antes (melhora cache)
COPY Gemfile Gemfile.lock ./

# Instala gems
RUN bundle install

# Copia o resto da aplicação
COPY . .

# Expõe a porta padrão
EXPOSE 3000

# Comando padrão
CMD ["rails", "server", "-b", "0.0.0.0"]