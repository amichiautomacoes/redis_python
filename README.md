# redis_python

Redis container preparado para EasyPanel, com autenticação obrigatória e persistência.

## Variáveis de Ambiente

- `REDIS_PASSWORD` (obrigatória): senha do Redis.
- `REDIS_PORT` (opcional, padrão `6379`): porta interna.
- `REDIS_APPENDONLY` (opcional, padrão `yes`): persistência AOF.
- `REDIS_SAVE` (opcional, padrão `900 1 300 10 60 10000`): snapshots RDB.
- `REDIS_MAXMEMORY` (opcional, padrão `0`): limite de memória (`256mb`, `1gb`...).
- `REDIS_MAXMEMORY_POLICY` (opcional, padrão `noeviction`): política de eviction.

## Deploy no EasyPanel

1. Builder: `Dockerfile`
2. Arquivo: `Dockerfile`
3. Porta interna: `6379` (ou `REDIS_PORT`)
4. Volume persistente recomendado: `/data`
5. Rede: privada/interna

## Conexão (exemplo)

`redis://:SUA_SENHA@redis:6379/0`

