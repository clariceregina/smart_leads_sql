-- criar tabela com dados dos leads

CREATE TABLE tabela_leads (
    id INTEGER PRIMARY KEY,
    nome TEXT,
    email TEXT,
    telefone TEXT,
    cidade TEXT
);

INSERT INTO tabela_leads (nome, email, telefone, cidade) VALUES
('  Ana Paula  ', 'ana.paula@email.com', ' (11) 98888-1234 ', 'São Paulo'),
('Carlos Souza', '  carlos@empresa.com  ', '(21)97777-4567', 'Rio de Janeiro'),
('  MARIA clara', 'maria.clara@dominio.net', ' (31)98888-0000', 'Belo Horizonte'),
('João Silva', 'joao.silva@email.com  ', ' (41)99999-9999', 'Curitiba'),
('Lucas Lima', 'lucas.lima@empresa.org', ' (51)91111-2222 ', 'Porto Alegre'),
(' julia mendes ', 'julia@exemplo.com', '(61)91234-5678', 'Brasília'),
('PEDRO alves', ' pedro.alves@email.com', ' (71)98765-4321 ', 'Salvador'),
('Fernanda Dias', 'fernanda@empresa.com.br', ' (85)99876-5432', 'Fortaleza'),
('"Anitta Larissa"', 'a.lari@email.com.br', '"(12)93456-7890"', 'Belo Horizonte');

-- remova os espaços extras nos nomes e nos telefones dos usuários

SELECT TRIM(nome) AS nome_sem_espaco, 
    TRIM(telefone) AS tel_sem_espaco 
FROM 
	tabela_leads;

-- remova as aspas extras nos nomes e nos telefones dos usuários

SELECT 
	TRIM(nome, '"') AS nome_sem_espaco, 
    TRIM(telefone, '"') AS tel_sem_espaco 
FROM 
	tabela_leads;

-- encontre a posição do caractere @ nos e-mails de todos os usuários
SELECT email, INSTR(email, '@') AS posicao_arroba
FROM tabela_leads;

-- substitua todos os domínios .com por .org nos e-mails
SELECT email, INSTR(email, '@') AS posicao_arroba
FROM tabela_leads;

-- extraia o nome de usuário dos e-mails (antes do @)
SELECT email, SUBSTR(email, 1, INSTR(email, '@') - 1) AS email_user
FROM tabela_leads;

-- exiba todos os nomes em maiúsculo, sem espaços extras
SELECT UPPER (TRIM(nome)) AS nome_formatado
FROM tabela_leads;

-- extraia o domínio dos e-mails (após o @), independentemente do número de caracteres antes do @
SELECT email, SUBSTR(email, INSTR(email, '@') + 1) AS dominio_email
FROM tabela_leads;

-- remova todos os espaços e hífens do telefone
SELECT telefone, REPLACE(REPLACE(telefone, ' ', ''), '-', '')
FROM tabela_leads;

-- pegue os três primeiros caracteres da cidade
SELECT cidade, UPPER(SUBSTR(cidade, 1, 3)) AS sigla_cidade
FROM tabela_leads;

-- pegue o sobrenome dos nomes (tudo depois do primeiro espaço)
SELECT 
  nome, 
  SUBSTR(nome, INSTR(TRIM(nome), ' ') + 1) AS sobrenome
FROM 
  tabela_leads;

-- crie um identificador para cada usuário no formato "primeira_letra_do_nome + sobrenome + código da cidade" exemplo: Nome: " Ana Paula ", Cidade: "São Paulo" → a.paula.SP
SELECT 
nome, LOWER(SUBSTR(TRIM(nome), 1, 1)) || '.' || LOWER(SUBSTR(nome, INSTR(TRIM(nome), ' ') + 1)) || '.' || LOWER(SUBSTR(cidade, 1, 3)) AS identificador
FROM tabela_leads;