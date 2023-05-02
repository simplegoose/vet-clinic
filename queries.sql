/*Queries that provide answers to the questions from all projects.*/

/* Task One */
SELECT * from animals WHERE NAME LIKE '%mon';
SELECT NAME FROM animals WHERE DOB >= '2016-01-01' AND DOB <= '2019-12-31';
SELECT NAME FROM animals WHERE NEUTERED=true AND ESCAPE_ATTEMPTS < 3;
SELECT DOB FROM animals WHERE NAME='Agumon' OR NAME='Pikachu';
SELECT NAME, ESCAPE_ATTEMPTS FROM animals WHERE WEIGHT_KG>10.5;
SELECT * FROM animals WHERE NEUTERED=true;
SELECT * FROM animals WHERE NAME!='Gabumon';
SELECT * FROM animals WHERE WEIGHT_KG BETWEEN 10.4 AND 17.3;

/* Task Two */

BEGIN;

UPDATE animals SET SPECIES='unspecified';

ROLLBACK;

BEGIN;

UPDATE animals SET SPECIES='digimon' WHERE name LIKE '%mon';
UPDATE animals SET SPECIES='pokemon' WHERE species IS NULL;

COMMIT;

BEGIN;

DELETE FROM animals;

ROLLBACK;

BEGIN;

DELETE FROM animals WHERE dob > '2022-01-01';

SAVEPOINT del_jan_2022;

UPDATE animals SET weight_kg=weight_kg * -1;

ROLLBACK TO del_jan_2022;

UPDATE animals SET weight_kg=weight_kg * -1 WHERE sign(weight_kg) < 1;

COMMIT;

SELECT COUNT(*) as total_number FROM animals;
SELECT COUNT(*) as never_tried_to_escape FROM animals WHERE escape_attempts < 1;
SELECT AVG(weight_kg) as avg_weight FROM animals;
SELECT neutered, avg(escape_attempts) as escapes FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE dob >= '1990-01-01' AND dob <= '2000-12-31' GROUP BY species;
