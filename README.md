# redis_python

Redis container preparado para EasyPanel, com autenticacao obrigatoria e persistencia.

Este Redis pode ser compartilhado por varios projetos.

## Variaveis de Ambiente

- `REDIS_PASSWORD` (obrigatoria): senha do Redis.
- `REDIS_PORT` (opcional, padrao `6379`): porta interna.
- `REDIS_APPENDONLY` (opcional, padrao `yes`): persistencia AOF.
- `REDIS_SAVE` (opcional, padrao `900 1 300 10 60 10000`): snapshots RDB.
- `REDIS_MAXMEMORY` (opcional, padrao `0`): limite de memoria (`256mb`, `1gb`...).
- `REDIS_MAXMEMORY_POLICY` (opcional, padrao `noeviction`): politica de eviction.

## Deploy no EasyPanel

1. Builder: `Dockerfile`
2. Arquivo: `Dockerfile`
3. Porta interna: `6379` (ou `REDIS_PORT`)
4. Volume persistente recomendado: `/data`
5. Rede: privada/interna (nao expor publicamente)

## Uso compartilhado entre projetos

- Preferir prefixo de chave por projeto, exemplo: `chatwoot:*`, `novauniao:*`.
- Usar TTL para chaves temporarias.
- Se necessario, separar por database (`/0`, `/1`, `/2`) por dominio.
- Manter autenticacao sempre habilitada.

## Conexao (exemplo)

`redis://:SUA_SENHA@redis:6379/0`
