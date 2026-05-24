-- ============================================
-- CRIAÇÃO DO BANCO DE DADOS
-- ============================================

CREATE DATABASE IF NOT EXISTS db_agendamento
CHARACTER SET utf8mb4
COLLATE utf8mb4_general_ci;

USE db_agendamento;

-- ============================================
-- TABELA: tb_usuario
-- ============================================

CREATE TABLE tb_usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    
    nome VARCHAR(150) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    
    tipo_usuario ENUM('ADMIN','PROFESSOR','USUARIO') DEFAULT 'USUARIO',
    
    status ENUM('ATIVO','INATIVO') DEFAULT 'ATIVO',
    
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
    data_alteracao DATETIME DEFAULT CURRENT_TIMESTAMP
    ON UPDATE CURRENT_TIMESTAMP
);

-- ============================================
-- TABELA: tb_professor
-- ============================================

CREATE TABLE tb_professor (
    id_professor INT AUTO_INCREMENT PRIMARY KEY,
    
    nome VARCHAR(150) NOT NULL,
    email VARCHAR(150),
    telefone VARCHAR(20),
    
    status ENUM('ATIVO','INATIVO') DEFAULT 'ATIVO',
    
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ============================================
-- TABELA: tb_curso
-- ============================================

CREATE TABLE tb_curso (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    
    nome_curso VARCHAR(150) NOT NULL,
    sigla VARCHAR(20),
    
    status ENUM('ATIVO','INATIVO') DEFAULT 'ATIVO',
    
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- ============================================
-- TABELA: tb_turma
-- ============================================

CREATE TABLE tb_turma (
    id_turma INT AUTO_INCREMENT PRIMARY KEY,
    
    descricao_turma VARCHAR(100) NOT NULL,
    
    id_curso INT NOT NULL,
    
    semestre VARCHAR(20),
    ano YEAR,
    
    status ENUM('ATIVO','INATIVO') DEFAULT 'ATIVO',
    
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT fk_turma_curso
    FOREIGN KEY (id_curso)
    REFERENCES tb_curso(id_curso)
);

-- ============================================
-- TABELA: tb_disciplina
-- ============================================

CREATE TABLE tb_disciplina (
    id_disciplina INT AUTO_INCREMENT PRIMARY KEY,
    
    nome_disciplina VARCHAR(150) NOT NULL,
    sigla VARCHAR(20),
    carga_horaria INT,
    
    id_curso INT,
    
    status ENUM('ATIVO','INATIVO') DEFAULT 'ATIVO',
    
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT fk_disciplina_curso
    FOREIGN KEY (id_curso)
    REFERENCES tb_curso(id_curso)
);

-- ============================================
-- TABELA: tb_horario
-- ============================================

CREATE TABLE tb_horario (
    id_horario INT AUTO_INCREMENT PRIMARY KEY,
    
    descricao VARCHAR(100) NOT NULL,
    
    hora_inicio TIME NOT NULL,
    hora_fim TIME NOT NULL,
    
    periodo ENUM('MATUTINO','VESPERTINO','NOTURNO') NOT NULL,
    
    status ENUM('ATIVO','INATIVO') DEFAULT 'ATIVO'
);

-- ============================================
-- TABELA: tb_agendamento
-- ============================================

CREATE TABLE tb_agendamento (
    id_agendamento INT AUTO_INCREMENT PRIMARY KEY,
    
    titulo VARCHAR(200) NOT NULL,
    descricao TEXT,
    
    data_agendamento DATE NOT NULL,
    
    id_horario INT NOT NULL,
    id_professor INT NOT NULL,
    id_disciplina INT,
    id_turma INT,
    id_usuario INT NOT NULL,
    
    laboratorio VARCHAR(100),
    
    observacao TEXT,
    
    status ENUM(
        'PENDENTE',
        'APROVADO',
        'CANCELADO',
        'FINALIZADO'
    ) DEFAULT 'PENDENTE',
    
    data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP,
    
    data_alteracao DATETIME DEFAULT CURRENT_TIMESTAMP
    ON UPDATE CURRENT_TIMESTAMP,
    
    CONSTRAINT fk_agendamento_horario
    FOREIGN KEY (id_horario)
    REFERENCES tb_horario(id_horario),
    
    CONSTRAINT fk_agendamento_professor
    FOREIGN KEY (id_professor)
    REFERENCES tb_professor(id_professor),
    
    CONSTRAINT fk_agendamento_disciplina
    FOREIGN KEY (id_disciplina)
    REFERENCES tb_disciplina(id_disciplina),
    
    CONSTRAINT fk_agendamento_turma
    FOREIGN KEY (id_turma)
    REFERENCES tb_turma(id_turma),
    
    CONSTRAINT fk_agendamento_usuario
    FOREIGN KEY (id_usuario)
    REFERENCES tb_usuario(id_usuario)
);

-- ============================================
-- ÍNDICES
-- ============================================

CREATE INDEX idx_agendamento_data
ON tb_agendamento(data_agendamento);

CREATE INDEX idx_agendamento_status
ON tb_agendamento(status);

CREATE INDEX idx_agendamento_professor
ON tb_agendamento(id_professor);

CREATE INDEX idx_agendamento_horario
ON tb_agendamento(id_horario);

-- ============================================
-- DADOS INICIAIS
-- ============================================

INSERT INTO tb_usuario (
    nome,
    email,
    senha,
    tipo_usuario
) VALUES (
    'Administrador',
    'admin@sistema.com',
    MD5('123456'),
    'ADMIN'
);

INSERT INTO tb_horario (
    descricao,
    hora_inicio,
    hora_fim,
    periodo
) VALUES
('1º Aula', '18:50:00', '19:40:00', 'NOTURNO'),
('2º Aula', '19:40:00', '20:30:00', 'NOTURNO'),
('3º Aula', '20:40:00', '21:30:00', 'NOTURNO'),
('4º Aula', '21:30:00', '22:20:00', 'NOTURNO');