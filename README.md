# Aplicação Omnichannel com bot e WhatsApp

Utilizando Chatwoot, Typebot e Evolution API em containers

```sh
dc run --rm chatwoot-rails bundle exec rails db:chatwoot_prepare # preparando banco de dados chatwoot
dc run --rm chatwoot-rails bundle exec rake secret # para criar chave secreta
dc up -d
```

### Atenção para configuração nginx

Ver issue https://github.com/orgs/chatwoot/discussions/2149

```conf
# Nginx strips out underscore in headers by default
# Chatwoot relies on underscore in headers for API
# Make sure that the config is set to on.
underscores_in_headers on;
```