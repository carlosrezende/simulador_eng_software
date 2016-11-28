
/*usuário: root, senha: root*/

/*criar banco de dados com nome simulador*/
create database simulador;

/*usar o banco criado*/
use simulador;

/*criar tabela para armazenar administradores*/
create table admins(

/*chave primária*/
id int not null auto_increment,

/*atributos do administrador*/
nome varchar(100),
matricula varchar(50),
login varchar(50),
senha varchar(50),
cpf varchar(15),
nivel int,

/*definir quem é a chave primária*/
primary key(id));

insert into admins values(1,'Carlos Henrique Rezende Santos','1','admin','admin','06794597586', 3);

/*criar tabela para armazenar usuários*/
create table usuarios(

/*chave primária*/
id int not null auto_increment,

/*atributos do usuário*/
nome varchar(100),
matricula varchar(50),
login varchar(50),
senha varchar(50),
cpf varchar(15),
nivel int,

/*definir quem é a chave primária*/
primary key(id));

/*criar tabela para armazenar clientes*/
create table clientes(

/*chave primária*/
id int not null auto_increment,

/*atributos do cliente*/
nome varchar(100),
matricula varchar(50),
login varchar(50),
senha varchar(50),
cpf varchar(15),
nivel int,

/*definir quem é a chave primária*/
primary key(id));

/*criar tabela para armazenar investimentos*/
create table investimentos(

/*chave primária*/
id int not null auto_increment,

/*atributos do investimento*/
nome varchar(100),
valor double,
valor_minimo double,
taxa double,
tempo int,

/*definir quem é a chave primária*/
primary key(id));

select * from investimentos;

insert into investimentos values(1,'Tesouro Nacional',0,30,1.14,0);
insert into investimentos values(2,'LCI',0,1000,1.1013,0);
insert into investimentos values(3,'LCA',0,1000,1.1013,0);
insert into investimentos values(4,'CDB',0,5000,0.984,0);
insert into investimentos values(5,'Personalizado',0,500,1.12,0);