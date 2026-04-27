create database consultorio_db;
use consultorio_db;

create table paciente (
    idpaciente int auto_increment primary key,
    nome varchar(100) not null,
    cpf varchar(14) not null unique,
    datanascimento date not null,
    telefone varchar(20),
    email varchar(100) not null unique
);
insert into paciente (nome, cpf, datanascimento, telefone, email) values
('daniel', '11111111111', '2001-01-01', '11 1111 1111', 'daniel@gmail.com'),
('davidy', '22222222222', '2002-02-02', '22 2222 2222', 'davidy@gmail.com'),
('willian', '33333333333', '2003-03-03', '33 3333 3333', 'willian@gmail.com'),
('laiane', '44444444444', '2004-04-04', '44 4444 4444', 'laiane@gmail.com'),
('ana', '55555555555', '2005-05-05', '55 5555 5555', 'ana@gmail.com');

create table medico (
    idmedico int auto_increment primary key,
    nome varchar(100) not null,
    crm varchar(20) not null unique,
    especialidade varchar(100) default 'clinico geral',
    salario decimal(10,2) not null check (salario > 0)
);
insert into medico (nome, crm, especialidade, salario) values
('joão', 'CRM001', 'cardiologia', 10000),
('maria', 'CRM002', 'pediatria', 9000),
('pedro', 'CRM003', 'ortopedia', 9500),
('ana', 'CRM004', default, 8000),
('carlos', 'CRM005', 'dermatologia', 8500);

create table consulta (
    idconsulta int auto_increment primary key,
    dataconsulta date not null,
    horario time not null,
    valor decimal(10,2) not null,
    idmedico int not null,
    idpaciente int not null,
    status varchar(20) default 'agendada',
    foreign key (idmedico) references medico(idmedico)
        on delete cascade on update cascade,
    foreign key (idpaciente) references paciente(idpaciente)
        on delete cascade on update cascade
);

alter table paciente
add tiposanguineo varchar(5) not null;

rename table consulta to atendimento;

insert into atendimento (dataconsulta, horario, valor, idmedico, idpaciente, status) values
('2025-01-10', '10:00:00', 200, 1, 1, 'agendada'),
('2025-01-11', '11:00:00', 250, 2, 2, 'realizada'),
('2025-01-12', '12:00:00', 300, 3, 3, 'agendada'),
('2025-01-13', '13:00:00', 150, 4, 4, 'cancelada'),
('2025-01-14', '14:00:00', 180, 5, 5, 'agendada');

show tables;
describe atendimento;
update paciente
set nome = 'daniel mazzaro'
where idpaciente = 1;
update paciente
set telefone = '99 9999 9999'
where idpaciente = 2;

delete from medico
where idmedico = 5;
delete from atendimento
where status = 'agendada';