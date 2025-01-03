#!/bin/bash
set -e

# Criação do script SQL dinâmico a partir das variáveis de ambiente
cat <<EOF > /docker-entrypoint-initdb.d/create-users-and-dbs.sql
-- Criação do usuário e banco de dados para Evolution API
CREATE USER ${EVOLUTION_DB_USER} WITH PASSWORD '${EVOLUTION_DB_PASS}';
CREATE DATABASE ${EVOLUTION_DB_NAME} OWNER ${EVOLUTION_DB_USER};
GRANT ALL PRIVILEGES ON DATABASE ${EVOLUTION_DB_NAME} TO postgres;
ALTER USER ${EVOLUTION_DB_USER} WITH SUPERUSER;

-- Criação do usuário e banco de dados para Chatwoot
CREATE USER ${CHATWOOT_DB_USER} WITH PASSWORD '${CHATWOOT_DB_PASS}';
CREATE DATABASE ${CHATWOOT_DB_NAME} OWNER ${CHATWOOT_DB_USER};
GRANT ALL PRIVILEGES ON DATABASE ${CHATWOOT_DB_NAME} TO postgres;
ALTER USER ${CHATWOOT_DB_USER} WITH SUPERUSER;

-- Criação do usuário e banco de dados para Typebot
CREATE USER ${TYPEBOT_DB_USER} WITH PASSWORD '${TYPEBOT_DB_PASS}';
CREATE DATABASE ${TYPEBOT_DB_NAME} OWNER ${TYPEBOT_DB_USER};
GRANT ALL PRIVILEGES ON DATABASE ${TYPEBOT_DB_NAME} TO postgres;
ALTER USER ${TYPEBOT_DB_USER} WITH SUPERUSER;
EOF