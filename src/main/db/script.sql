-- *********************************************************************
-- Update Database Script
-- *********************************************************************
-- Change Log: src/main/db/master.yml
-- Ran at: 27/10/20, 5:57 PM
-- Against: postgres@jdbc:postgresql://localhost:5432/hbstudent
-- Liquibase version: 3.4.1
-- *********************************************************************

-- Create Database Lock Table
CREATE TABLE public.databasechangeloglock (ID INT NOT NULL, LOCKED BOOLEAN NOT NULL, LOCKGRANTED TIMESTAMP WITHOUT TIME ZONE, LOCKEDBY VARCHAR(255), CONSTRAINT PK_DATABASECHANGELOGLOCK PRIMARY KEY (ID));

-- Initialize Database Lock Table
DELETE FROM public.databasechangeloglock;

INSERT INTO public.databasechangeloglock (ID, LOCKED) VALUES (1, FALSE);

-- Lock Database
UPDATE public.databasechangeloglock SET LOCKED = TRUE, LOCKEDBY = 'SOUVIK-PC (192.168.56.1)', LOCKGRANTED = '2020-10-27 17:57:17.354' WHERE ID = 1 AND LOCKED = FALSE;

-- Create Database Change Log Table
CREATE TABLE public.databasechangelog (ID VARCHAR(255) NOT NULL, AUTHOR VARCHAR(255) NOT NULL, FILENAME VARCHAR(255) NOT NULL, DATEEXECUTED TIMESTAMP WITHOUT TIME ZONE NOT NULL, ORDEREXECUTED INT NOT NULL, EXECTYPE VARCHAR(10) NOT NULL, MD5SUM VARCHAR(35), DESCRIPTION VARCHAR(255), COMMENTS VARCHAR(255), TAG VARCHAR(255), LIQUIBASE VARCHAR(20), CONTEXTS VARCHAR(255), LABELS VARCHAR(255));

-- Changeset src/main/db/changelog/changelog1.yml::1::Souvik
CREATE TABLE public.course (id SERIAL NOT NULL, title VARCHAR(50), subject VARCHAR(50) NOT NULL, price INT, CONSTRAINT PK_COURSE PRIMARY KEY (id));

INSERT INTO public.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('1', 'Souvik', 'src/main/db/changelog/changelog1.yml', NOW(), 1, '7:968ab68becd7499ed0245ec7cc591eb7', 'createTable', '', 'EXECUTED', NULL, NULL, '3.4.1');

-- Changeset src/main/db/changelog/changelog1.yml::2::souvik
ALTER TABLE public.course ADD course_code VARCHAR(8);

ALTER TABLE public.course ADD mentor VARCHAR(20);

INSERT INTO public.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('2', 'souvik', 'src/main/db/changelog/changelog1.yml', NOW(), 2, '7:711bc78c0cdacf06c4dc3e861191c968', 'addColumn', '', 'EXECUTED', NULL, NULL, '3.4.1');

-- Changeset src/main/db/changelog/changelog1.yml::10::Souvik
CREATE TABLE public.mentor (id SERIAL NOT NULL, name VARCHAR(50), subject VARCHAR(50) NOT NULL, "Al" VARCHAR(50) NOT NULL, degree INT, course_id INT NOT NULL, CONSTRAINT PK_MENTOR PRIMARY KEY (id), CONSTRAINT fk_questions_author FOREIGN KEY (course_id) REFERENCES public.course(id));

INSERT INTO public.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('10', 'Souvik', 'src/main/db/changelog/changelog1.yml', NOW(), 3, '7:d9e5e107065f3dc8521441a98f40c7e2', 'createTable', '', 'EXECUTED', NULL, NULL, '3.4.1');

-- Changeset src/main/db/changelog/changelog2.yml::4::Souvik
CREATE TABLE public.person2 (id SERIAL NOT NULL, first_name VARCHAR(255) NOT NULL, last_name VARCHAR(255) NOT NULL, CONSTRAINT PK_PERSON2 PRIMARY KEY (id));

INSERT INTO public.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('4', 'Souvik', 'src/main/db/changelog/changelog2.yml', NOW(), 4, '7:fa9752961f47248dddd0ce68a7fd0017', 'createTable', '', 'EXECUTED', NULL, NULL, '3.4.1');

-- Changeset src/main/db/changelog/changelog2.yml::5::Souvik
INSERT INTO public.person2 (first_name, last_name) VALUES ('Marcel', 'Overdijk');

INSERT INTO public.databasechangelog (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE) VALUES ('5', 'Souvik', 'src/main/db/changelog/changelog2.yml', NOW(), 5, '7:963a2cb91e043df5cef5ff6f52775037', 'insert', '', 'EXECUTED', NULL, NULL, '3.4.1');

-- Release Database Lock
UPDATE public.databasechangeloglock SET LOCKED = FALSE, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;

