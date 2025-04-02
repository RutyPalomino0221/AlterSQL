use master
go
--------------------------------------------------------------------------------------------
if DB_ID('BDAlterTable') is not null
   drop database BDAlterTable
go
create database BDAlterTable
go
--------------------------------------------------------------------------------------------
use BDAlterTable
go

CREATE TABLE ESTUDIANTES (
    ID_ESTUDIANTE INT PRIMARY KEY,
    NOMBRE VARCHAR(100),
    APELLIDO VARCHAR(100),
    EMAIL VARCHAR(100) UNIQUE,
    FECHA_NACIMIENTO DATE
);
go

CREATE TABLE CURSOS (
    ID_CURSO INT PRIMARY KEY,
    NOMBRE_CURSO VARCHAR(100),
    DESCRIPCION VARCHAR(255),
    DURACION INT, -- Duración en horas
    PRECIO DECIMAL(10, 2)
);
go

CREATE TABLE INSCRIPCIONES (
    ID_INSCRIPCION INT PRIMARY KEY,
    ID_ESTUDIANTE INT,
    ID_CURSO INT,
    FECHA_INSCRIPCION DATE,
    CALIFICACION INT,
    CONSTRAINT FK_ESTUDIANTE FOREIGN KEY (ID_ESTUDIANTE) REFERENCES ESTUDIANTES(ID_ESTUDIANTE),
    CONSTRAINT FK_CURSO FOREIGN KEY (ID_CURSO) REFERENCES CURSOS(ID_CURSO),
    CONSTRAINT UC_ESTUDIANTE_CURSO UNIQUE (ID_ESTUDIANTE, ID_CURSO)
);
go
