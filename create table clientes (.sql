create table clientes (
id serial primary key,
nome VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE NOT NULL,
telefone VARCHAR(20) NOT NULL,
cpf VARCHAR(11) UNIQUE NOT NULL,
data_cadastra TIMESTAMP DEFAULT CURRENT_TIME
);
create table mecanicos (
id serial primary key,
nome VARCHAR(100) NOT NULL,
especialidade VARCHAR(50) NOT NULL,
valor_hora NUMERIC(10,2)NOT NULL CHECK(valor_hora > 0)
);

create table veículos (
id serial primary key,
cliente_id INT NOT NULL,
placa VARCHAR(7) UNIQUE NOT NULL,
modelo VARHCAR(50) NOT NULL,
marca VARCHAR(50 NOT NULL,
ano INT NOT NULL CHECK( ano >1900)

COSNTRAINT fk_veiclo_cliente
FOREIGN KEY (cliente_id)
REFERENCES clientes(id)
ON DELETE CASCADE

);

 create table ordens_serviço (
   id serial primary key,
  veiculo_id INT NOT NULL,
    mecanico_id INT NOT NULL,
    data_abertura TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    valor_mao_obra NUMERIC(10, 2) NOT NULL DEFAULT 0.00 CHECK (valor_mao_obra >= 0),
    status VARCHAR(20) DEFAULT 'Em Aberto' CHECK (status IN ('Em Aberto', 'Em Andamento', 'Concluida', 'Cancelada')),
CONSTRAINT fk_os_veiculo 
        FOREIGN KEY (veiculo_id) 
        REFERENCES veiculos(id) 
        ON DELETE RESTRICT,
    CONSTRAINT fk_os_mecanico 
        FOREIGN KEY (mecanico_id) 
        REFERENCES mecanicos(id) 
        ON DELETE RESTRICT
 );

 create table pecas_os (
id serial primary key,
os_id INT NOT NULL,
nome_peca VARCHAR(100) NOT NULL,
quantidade INT NOT NULL CHECK(valor_unitário > 0)

CONSTRAINT fk_peca_os
FOREIGN KEY (os_id)
REFERENCES ordens_servico(id)
ON DELETE CASCADE
 );

 INSERT INTO clientes (nome,email,telefone,cpf) VALUES
 ('Jair Bolsonaro,'jair.bolsonaro@gmail.com','(48)9911-233'),
 ('MrBeast Souza', 'MrBeast.souza@email.com', '(48) 98822-4455', '55566677788'),
(' POUtinha', 'POUtinha.martins@email.com', '(48) 97733-6677', '99900011122');

INSERT INTO mecanicos (nome, especialidade, valor_hora) VALUES 
('Carlos Eduardo', 'Motor e Câmbio', 120.00),
('Jesus', 'Deus te abeçõe', 85.00),
('Alanzoka', 'Elétrica e Injeção', 100.00);

INSERT INTO veiculos (cliente_id, placa, modelo, marca, ano) VALUES 
(1, 'ABC1D23', 'Civic 2.0', 'Honda', 2020),       -- Veículo 1 (Fernanda)
(1, 'XYZ9K88', 'Fit 1.5', 'Honda', 2018),         -- Veículo 2 (Fernanda)
(2, 'KLR4M55', 'Corolla 2.0', 'Toyota', 2021),    -- Veículo 3 (Roberto)
(3, 'JHG8T77', 'Onix 1.0 Turbo', 'Chevrolet', 2022);-- Veículo 4 (Amanda)
