CREATE TABLE cliente (
id_cliente INT PRIMARY KEY NOT NULL auto_increment,
nome CHAR(60) NOT NULL,
email VARCHAR(200) NOT NULL,
cpf VARCHAR(14) NOT NULL,
rg VARCHAR(9) NOT NULL,
telefone VARCHAR(11) NOT NULL,
logradouro VARCHAR(60) NOT NULL,
numero INT NOT NULL,
cep VARCHAR(9) NOT NULL,
uf CHAR(2) NOT NULL,
UNIQUE (cpf, rg)
);

CREATE TABLE pedido (
id INT PRIMARY KEY NOT NULL auto_increment,
status_pedido CHAR(60) NOT NULL,
data_pedido DATE NOT NULL,
valor_final DOUBLE NOT NULL,
fk_veiculo_id INT NOT NULL,
fk_cliente_id INT NOT NULL,
fk_vendedor_id INT NOT NULL
);

CREATE TABLE veiculo (
id INT PRIMARY KEY NOT NULL auto_increment,
cod_chassi VARCHAR(17) UNIQUE NOT NULL,
marca CHAR(60) NOT NULL,
modelo VARCHAR(60) NOT NULL,
KM INT NOT NULL ,
cor CHAR(60) NOT NULL,
ano INT NOT NULL,
status_veiculo CHAR(60) NOT NULL,
preco_venda DOUBLE NOT NULL,
qtd_estoque INT NOT NULL,
fk_vendedor_id INT NOT NULL
);

CREATE TABLE vendedor (
id INT PRIMARY KEY NOT NULL auto_increment,
nome CHAR(60) NOT NULL,
email VARCHAR(100) NOT NULL,
telefone VARCHAR(14) NOT NULL,
cargo CHAR(60) NOT NULL
);

CREATE TABLE Pagamento (
id_pagamento INT PRIMARY KEY NOT NULL auto_increment,
Valor_pagamento DOUBLE NOT NULL,
Tipo_pagamento CHAR(100) NOT NULL,
fk_pedido_id INT NOT NULL
);

ALTER TABLE pedido ADD CONSTRAINT FK_pedido_2
FOREIGN KEY (fk_veiculo_id)
REFERENCES veiculo (id)
ON DELETE CASCADE;

ALTER TABLE pedido ADD CONSTRAINT FK_pedido_3
FOREIGN KEY (fk_cliente_id)
REFERENCES cliente (id_cliente)
ON DELETE CASCADE;

ALTER TABLE pedido ADD CONSTRAINT FK_pedido_4
FOREIGN KEY (fk_vendedor_id)
REFERENCES vendedor (id)
ON DELETE CASCADE;

ALTER TABLE veiculo ADD CONSTRAINT FK_veiculo_2
FOREIGN KEY (fk_vendedor_id)
REFERENCES vendedor (id)
ON DELETE CASCADE;

ALTER TABLE Pagamento ADD CONSTRAINT FK_Pagamento_2
FOREIGN KEY (fk_pedido_id)
REFERENCES pedido (id)
ON DELETE RESTRICT;