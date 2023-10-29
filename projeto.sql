CREATE DATABASE projeto
GO
USE projeto

GO
CREATE TABLE projeto(
 id            INT            NOT NULL IDENTITY(10001,1),
 nome          VARCHAR(45)    NOT NULL,
 descricao     VARCHAR(45)    NOT NULL,
 data_projeto  DATE           NOT NULL CHECK (data_projeto > '2014-09-01')
 PRIMARY KEY (id)
 )

 GO
 CREATE TABLE usuario(
 id_user           INT            NOT NULL IDENTITY(1,1),
 nome			   VARCHAR(45)    NOT NULL,
 username		   VARCHAR(45)    NOT NULL UNIQUE,
 senha             VARCHAR(45)    NOT NULL DEFAULT '123mudar',
 email             VARCHAR(45)    NOT NULL
 PRIMARY KEY(id_user)
 )
  
GO
CREATE TABLE usuario_projeto(
id_user       INT            NOT NULL,
id            INT            NOT NULL
 PRIMARY KEY(id, id_user)
 FOREIGN KEY(id_user) REFERENCES usuario (id_user),
 FOREIGN KEY(id) REFERENCES projeto (id)
 )

 -- Alterando numero varchar das colunas da tabela usuario 
SELECT username, CONVERT(VARCHAR(10), username)AS converted_username
FROM usuario;

SELECT senha, CONVERT(VARCHAR(8), senha)AS converted_senha
FROM usuario;

INSERT INTO usuario VALUES
( 'Maria','Rh_maria', '123mudar', 'maria@empresa.com'),
( 'Paulo','Ti_paulo', '123@456', 'paulo@empresa.com'),
( 'Ana','Rh_ana', '123mudar', 'ana@empresa.com'),
('Clara','Ti_clara', '123mudar', 'clara@empresa.com'),
( 'Aparecido','Rh_apareci', '55@!cido', 'aparecido@empresa.com')

INSERT INTO projeto VALUES
( 'Re_folha','Refatoração das Folhas', '2014-09-05'),
( 'Manutenção PC´s','Manutenção PC´s', '2014-09-06'),
( 'Auditoria','', '2014-09-07')

INSERT INTO usuario_projeto VALUES
(1, 10001),
(5, 10001),
(3, 10003),
(4, 10002),
(2, 10002)

UPDATE usuario
SET username = 'Rh_cido'
WHERE username = 'Aparecido';

UPDATE usuario
SET senha = '888@*'
WHERE username = 'Rh_maria' AND senha= '123mudar';

DELETE usuario_projeto
WHERE id = 2 AND id_user = 10002;