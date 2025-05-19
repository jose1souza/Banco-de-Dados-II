-- **Criação de Tabelas** --

-- Tabela salas
CREATE TABLE salas (
  SalaID INT PRIMARY KEY AUTO_INCREMENT,
  Descricao VARCHAR(255)
);

-- Tabela agendamentos
CREATE TABLE agendamentos (
  AgendamentoID INT PRIMARY KEY AUTO_INCREMENT,
  SalaID INT,
  Data DATE,
  Hora TIME,
  FOREIGN KEY (SalaID) REFERENCES salas(SalaID)
);

-- Tabela emails
CREATE TABLE emails (
  EmailID INT PRIMARY KEY AUTO_INCREMENT,
  AlunoID INT,
  ProfessorID INT,
  Email VARCHAR(255),
  FOREIGN KEY (AlunoID) REFERENCES alunos(AlunoID),
  FOREIGN KEY (ProfessorID) REFERENCES professores(ProfessorID)
);

-- Tabela telefones
CREATE TABLE telefones (
  TelefoneID INT PRIMARY KEY AUTO_INCREMENT,
  AlunoID INT,
  ProfessorID INT,
  Telefone VARCHAR(20),
  FOREIGN KEY (AlunoID) REFERENCES alunos(AlunoID),
  FOREIGN KEY (ProfessorID) REFERENCES professores(ProfessorID)
);

-- Tabela assistentes
CREATE TABLE assistentes (
  AssistenteID INT PRIMARY KEY AUTO_INCREMENT,
  AlunoID INT,
  ProfessorID INT,
  FOREIGN KEY (AlunoID) REFERENCES alunos(AlunoID),
  FOREIGN KEY (ProfessorID) REFERENCES professores(ProfessorID)
);

-- Tabela enderecos
CREATE TABLE enderecos (
  EnderecoID INT PRIMARY KEY AUTO_INCREMENT,
  AlunoID INT,
  ProfessorID INT,
  CEP VARCHAR(10),
  Rua VARCHAR(255),
  Bairro VARCHAR(100),
  Cidade VARCHAR(100),
  Numero INT,
  FOREIGN KEY (AlunoID) REFERENCES alunos(AlunoID),
  FOREIGN KEY (ProfessorID) REFERENCES professores(ProfessorID)
);

-- **Inserção de Dados** --

-- Inserir salas
INSERT INTO salas (Descricao) VALUES ('Sala 101');
INSERT INTO salas (Descricao) VALUES ('Sala 102');

-- **Consultas SQL** --

-- Consulta para exibir todos os telefones dos alunos
SELECT a.Nome, t.Telefone
FROM alunos a
INNER JOIN aluno_telefones at ON a.AlunoID = at.AlunoID
INNER JOIN telefones t ON at.TelefoneID = t.TelefoneID;

-- Consulta para contar os números de telefone de cada aluno
SELECT a.Nome, COUNT(t.Telefone)
FROM alunos a
INNER JOIN aluno_telefones at ON a.AlunoID = at.AlunoID
INNER JOIN telefones t ON at.TelefoneID = t.TelefoneID
GROUP BY a.Nome;

-- Consulta para exibir os professores e as disciplinas que lecionam
SELECT p.Nome, d.Descricao
FROM professores p
INNER JOIN professor_disciplinas pd ON p.ProfessorID = pd.ProfessorID
INNER JOIN disciplinas d ON pd.DisciplinaID = d.DisciplinaID;
