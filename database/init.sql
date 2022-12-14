--* INICIO - ADMINISTRADORES

DROP TABLE IF EXISTS administradores;
CREATE TABLE administradores(
    id_admin SERIAL PRIMARY KEY,
    cui CHAR(13) UNIQUE NOT NULL,
    correo VARCHAR(250) UNIQUE NOT NULL,
    nombres VARCHAR(250) NOT NULL,
    apellidos VARCHAR(250) NOT NULL,
    nombre_completo VARCHAR(250) NOT NULL, -- util para reportes
    genero CHAR(1) NOT NULL DEFAULT 'M', 
    direccion VARCHAR(250) NOT NULL,
    esta_activo BOOLEAN DEFAULT TRUE NOT NULL
);
INSERT INTO administradores(cui, correo, nombres, apellidos, nombre_completo, genero, direccion) VALUES
('1123456789123','srick@cebe.com', 'Rick','Sanchez', 'Rick Sanchez', 'M', 'P.O. Box 733, 218 Tincidunt Street');

--* FIN - ADMINISTRADORES

--* INICIO - DOCENTES

DROP TABLE IF EXISTS docentes;
CREATE TABLE docentes(
    id_docente SERIAL PRIMARY KEY,
    cui CHAR(13) UNIQUE NOT NULL,
    correo VARCHAR(250) UNIQUE NOT NULL,
    nombres VARCHAR(250) NOT NULL,
    apellidos VARCHAR(250) NOT NULL,
    nombre_completo VARCHAR(250) NOT NULL, -- util para reportes
    genero CHAR(1) NOT NULL DEFAULT 'M', 
    direccion VARCHAR(250) NOT NULL,
    esta_activo BOOLEAN DEFAULT TRUE NOT NULL
);
INSERT INTO docentes(cui, correo, nombres, apellidos, nombre_completo, genero, direccion) VALUES
('1123456789123','eesteban@cebe.com', 'Elmer','Esteban', 'Elmer Esteban', 'M', 'P.O. Box 733, 218 Tincidunt Street'),
('2123456789123','rpineda@cebe.com', 'Rony','Pineda', 'Rony Pineda', 'M', 'P.O. Box 733, 218 Tincidunt Street'),
('3123456789123','lgarcia@cebe.com', 'Lidia','Garcia', 'Lidia Garcia', 'F', 'P.O. Box 733, 218 Tincidunt Street'),
('4123456789123','emendez@cebe.com', 'Edwin','Mendez', 'Edwin Mendez', 'M', 'P.O. Box 733, 218 Tincidunt Street'),
('5123456789123','aroman@cebe.com', 'Alexander','Roman', 'Alexander Roman', 'M', 'P.O. Box 733, 218 Tincidunt Street'),
('6123456789123','jramirez@cebe.com', 'Jorge','Ramirez', 'Jorge Ramirez', 'M', 'P.O. Box 733, 218 Tincidunt Street');

--* FIN - DOCENTES

--* INICIO  - ROLES

DROP TABLE IF EXISTS roles;
CREATE TABLE roles(
    id_rol SERIAL PRIMARY KEY,
    nombre VARCHAR(250) UNIQUE NOT NULL,
    descripcion TEXT UNIQUE NOT NULL
);
INSERT INTO roles(nombre, descripcion) VALUES
('Administrador', 'Supervisan las tareas administrativas del colegio, garantizan que la organizaci??n funcione a la perfecci??n y tambi??n gestionan instalaciones y personal'),
('Docente', 'Su funci??n es de car??cter profesional que implica la realizaci??n directa de los procesos sistem??ticos de ense??anza - aprendizaje, lo cual incluye el diagn??stico, la planificaci??n, la ejecuci??n y la evaluaci??n de los mismos procesos y sus resultados, y de otras actividades educativas'),
('Estudiante', 'Se dedica a la aprehensi??n, puesta en pr??ctica y lectura de conocimientos sobre las diferentes ramas de alguna ciencia, disciplina o arte impartido por un catedr??tico'),
('Padre de familia', 'El padre de familia puede supervisar los datos de los alumnos que hayan sido asignados a su dependencia'),
('Madre de familia', 'La madre de familia puede supervisar los datos de los alumnos que hayan sido asignados a su dependencia'),
('Encargado de estudiante','El encargado de estudiante puede supervisar los datos de los alumnos que hayan sido asignados a su dependencia');

--* FIN - ROLES

--* INICIO - TIPOS DE CONTACTO

DROP TABLE IF EXISTS tipos_de_contacto;
CREATE TABLE tipos_de_contacto(
    id_tipoc SERIAL PRIMARY KEY,
    nombre VARCHAR(50) UNIQUE NOT NULL
);
INSERT INTO tipos_de_contacto(nombre) VALUES
('celular'),('telefono'),('facebook'),('twitter'),('instagram'),('linkedin');

--* FIN - TIPOS DE CONTACTO

--* INICIO - CONTACTOS

-- DROP TABLE IF EXISTS contactos;
-- CREATE TABLE contactos(
--     id_contacto SERIAL PRIMARY KEY,
--     id_tipoc INT NOT NULL,  -- que tipo de contacto es: email, phone, social media link
--     id_persona INT NOT NULL, -- para saber a que persona pertenece ese contacto
--     contacto VARCHAR(250) NOT NULL UNIQUE, --puede venir un enlace muy grande si se trata de social media
--     CONSTRAINT fk_tipoc
--     FOREIGN KEY(id_tipoc)
--     REFERENCES tipos_de_contacto(id_tipoc), --el tipo de contacto debe existir si o si, caso contrario da error.
--     CONSTRAINT fk_persona
--     FOREIGN KEY(id_persona) 
-- 	REFERENCES personas(id_persona)
--     ON DELETE CASCADE --Si se elimina los datos de la persona, tambien se elimina los contactos asociados a esa persona
-- ); 
-- INSERT INTO contactos(id_tipoc, id_persona, contacto) VALUES
-- (1, 1, '12345678');

--* FIN - CONTACTOS

--* INICIO - GRADOS

DROP TABLE IF EXISTS grados;
CREATE TABLE grados(
    id_grado SERIAL PRIMARY KEY,
    grado VARCHAR(20) UNIQUE NOT NULL
);
INSERT INTO grados(grado) VALUES ('PRIMERO'), ('SEGUNDO'), ('TERCERO'), ('CUARTO'), ('QUINTO');

--* FIN - GRADOS

--* INICIO - GRUPOS

DROP TABLE IF EXISTS grupos;
CREATE TABLE grupos(
    id_grupo SERIAL PRIMARY KEY,
    grupo VARCHAR(250) UNIQUE NOT NULL
);
INSERT INTO grupos(grupo) VALUES ('B??SICO'), ('BACHILLERATO EN COMPUTACI??N'), ('PRIMARIA');

--* FIN - GRUPOS

--* INICIO - JORNADAS

DROP TABLE IF EXISTS jornadas;
CREATE TABLE jornadas(
    id_jornada SERIAL PRIMARY KEY,
    jornada VARCHAR(20) UNIQUE NOT NULL
);
INSERT INTO jornadas(jornada) VALUES('VESPERTINA'), ('MATUTINA');

--* FIN - JORNADAS

--* INICIO - SECCIONES

DROP TABLE IF EXISTS secciones;
CREATE TABLE secciones(
    id_seccion SERIAL PRIMARY KEY,
    seccion VARCHAR(1) UNIQUE NOT NULL
);
INSERT INTO secciones(seccion) VALUES('A'), ('B'), ('C'), ('D');

--* FIN - SECCIONES

--* INICIO - A??OS

DROP TABLE IF EXISTS anios;
CREATE TABLE anios(
    id_anio SERIAL PRIMARY KEY,
    anio CHAR(4) UNIQUE NOT NULL
);
INSERT INTO anios(anio) VALUES('2022'), ('2021'), ('2020'), ('2019'), ('2018');

--* FIN - A??OS

--* INICIO - AULAS

DROP TABLE IF EXISTS aulas;
CREATE TABLE aulas(
    id_aula SERIAL PRIMARY KEY,
    nombre VARCHAR(250) UNIQUE NOT NULL, -- concatenacion mediante combobox de grados, grupos, jornadas, seccions, anios.
    n_cupos SMALLINT NOT NULL DEFAULT 0,
    n_inscritos SMALLINT NOT NULL DEFAULT 0,
    CONSTRAINT chk_capacidad CHECK (n_inscritos <= n_cupos) -- de modo que no se puedan inscribir mas alumnos de los que soporta el aula.
);
INSERT INTO aulas(nombre, n_cupos) VALUES
('PRIMERO B??SICO - JORNADA VESPERTINA - SECCI??N A - 2022', 32),
('SEGUNDO B??SICO - JORNADA VESPERTINA - SECCI??N A - 2022', 28),
('TERCERO B??SICO - JORNADA VESPERTINA - SECCI??N A - 2022', 23);

--* FIN - AULAS

DROP TABLE IF EXISTS cursos;
CREATE TABLE cursos(
    id_curso SERIAL PRIMARY KEY,
    nombre VARCHAR(250) UNIQUE NOT NULL,
    descripcion TEXT UNIQUE NOT NULL
);
INSERT INTO cursos(nombre, descripcion) VALUES
('MATEM??TICA I', 'DESCRIPCI??N MATEM??TICA I'),
('F??SICA I', 'DESCRIPCI??N F??SICA I'),
('QU??MICA I', 'DESCRIPCI??N QU??MICA I'),
('MATEM??TICA II', 'DESCRIPCI??N MATEM??TICA II'),
('F??SICA II', 'DESCRIPCI??N F??SICA II'),
('QU??MICA II', 'DESCRIPCI??N QU??MICA II'),
('MATEM??TICA III', 'DESCRIPCI??N MATEM??TICA III'),
('F??SICA III', 'DESCRIPCI??N F??SICA III'),
('QU??MICA III', 'DESCRIPCI??N QU??MICA III');

--* INICIO - ASIGNACIONES CURSOS A DOCENTES

DROP TABLE IF EXISTS asignacionCC;
CREATE TABLE asignacionCC(
    id_asignacionCC SERIAL PRIMARY KEY,
    id_curso SMALLINT NOT NULL DEFAULT 0,
    id_docente SMALLINT NOT NULL DEFAULT 0,
    id_aula SMALLINT NOT NULL DEFAULT 0,
    id_horario SMALLINT NOT NULL DEFAULT 0,
    CONSTRAINT fk_aula FOREIGN KEY(id_aula) REFERENCES aulas(id_aula), 
	CONSTRAINT fk_curso FOREIGN KEY(id_curso) REFERENCES cursos(id_curso), 
	CONSTRAINT fk_docente FOREIGN KEY(id_docente) REFERENCES docentes(id_docente), 
	CONSTRAINT fk_horario FOREIGN KEY(id_horario) REFERENCES horarios (id_horario) 
	
);


--* INSERTANDO DATOS DE PRUEBA
INSERT INTO asignacionCC(id_curso, id_docente, id_aula, id_horario) VALUES
(1,1,1,1),
(1,2,3,3)
--* FIN - Asignaciones

DROP TABLE IF EXISTS horarios;
CREATE TABLE horarios(
    id_horario SERIAL PRIMARY KEY,
    inicio_fin CHAR(13) UNIQUE NOT NULL -- '07:00 - 07:35' = 13
);

INSERT INTO horarios(inicio_fin) VALUES
('07:00 - 07:35'), 
('07:40 - 08:15'),
('08:20 - 08:55'),
('09:00 - 09:35'), 
('09:40 - 10:15'), 
('10:20 - 10:55'), 
('11:00 - 11:35'),
('11:40 - 12:15'),
('12:20 - 12:55'),
('13:00 - 13:35'),
('13:40 - 14:15'),
('14:20 - 14:55'),
('15:00 - 15:35'),
('15:40 - 16:15'),
('16:20 - 16:55'),
('17:00 - 17:35'),
('17:40 - 18:15');

--* FINAL - HORARIOS
