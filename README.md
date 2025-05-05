# 📊 Smart Leads – Limpeza e Formatação de Dados com SQL

Este projeto da Smart Leads utiliza SQL (TRIM, INSTR, REPLACE, SUBSTR) tendo como objetivo a higienização, padronização e extração de dados relevantes a partir de uma base de leads cadastrados.

## 🛠 Técnicas e Funções Utilizadas

Para garantir a qualidade e padronização dos dados, empregamos as seguintes funções SQL:

### `TRIM`

Remove espaços em branco e caracteres indesejados do início e fim de strings.  
Usado para:

- Eliminar espaços extras nos nomes e telefones.
- Retirar aspas duplas em registros inconsistentes.

### `INSTR`

Retorna a posição de um caractere específico dentro de uma string.  
Usado para:

- Localizar a posição do `@` nos e-mails.
- Encontrar o início do sobrenome nos nomes.
- Ajudar na extração de partes específicas de strings com `SUBSTR`.

### `REPLACE`

Substitui partes de uma string por outra.  
Usado para:

- Remover espaços e hífens dos telefones.
- Substituir domínios `.com` por `.org` nos e-mails (complementarmente).

### `SUBSTR`

Extrai partes específicas de uma string com base em posição.  
Usado para:

- Capturar o nome de usuário dos e-mails (antes do `@`).
- Obter o domínio do e-mail (depois do `@`).
- Extrair o sobrenome dos nomes.
- Gerar identificadores personalizados (ex: `a.paula.sao`).

## Outras Transformações

- Nomes foram convertidos para **maiúsculas** para padronização.
- Cidades foram abreviadas com os **três primeiros caracteres** em maiúsculo.
- Criado um campo `identificador` único com base no nome e cidade de cada lead, útil para identificação rápida.
