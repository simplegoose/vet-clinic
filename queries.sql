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
SELECT * FROM animals;

ROLLBACK;

SELECT * FROM animals;

BEGIN;

UPDATE animals SET SPECIES='digimon' WHERE name LIKE '%mon';
UPDATE animals SET SPECIES='pokemon' WHERE species IS NULL;
SELECT * FROM animals;

COMMIT;

SELECT * FROM animals;

BEGIN;

DELETE FROM animals;
SELECT * FROM animals;

ROLLBACK;

SELECT * FROM animals;

BEGIN;

DELETE FROM animals WHERE dob > '2022-01-01';

SELECT * FROM animals;

SAVEPOINT del_jan_2022;

SELECT * FROM animals;

UPDATE animals SET weight_kg=weight_kg * -1;

SELECT * FROM animals;

ROLLBACK TO del_jan_2022;

SELECT * FROM animals;

UPDATE animals SET weight_kg=weight_kg * -1 WHERE sign(weight_kg) < 1;

SELECT * FROM animals;

COMMIT;

SELECT * FROM animals;

SELECT COUNT(*) as total_number FROM animals;
SELECT COUNT(*) as never_tried_to_escape FROM animals WHERE escape_attempts < 1;
SELECT AVG(weight_kg) as avg_weight FROM animals;
SELECT neutered, avg(escape_attempts) as escapes FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE dob >= '1990-01-01' AND dob <= '2000-12-31' GROUP BY species;

/* Task Three */
SELECT full_name as owner_full_name, name as animal_name FROM OWNERS 
  JOIN ANIMALS ON owners.id = animals.owner_id 
  WHERE full_name='Melody Pond'; 

SELECT specie_name, name as animal_name FROM SPECIES 
  JOIN ANIMALS ON species.id = animals.species_id 
  WHERE specie_name='pokemon';

SELECT * FROM OWNERS 
  LEFT JOIN ANIMALS ON owners.id = animals.owner_id;

SELECT specie_name, COUNT(*) FROM SPECIES 
  LEFT JOIN ANIMALS ON species.id = animals.species_id 
  GROUP BY SPECIE_NAME;

SELECT * FROM OWNERS 
  JOIN ANIMALS ON owners.id = animals.owner_id 
  JOIN SPECIES ON animals.species_id = species.id 
  WHERE owners.full_name='Jennifer Orwell' AND species.specie_name = 'digimon';

SELECT full_name as owner_full_name, name as animal_name FROM OWNERS 
  JOIN ANIMALS ON owners.id = animals.owner_id 
  WHERE full_name='Dean Winchester' AND animals.escape_attempts = 0; 

SELECT full_name, COUNT(*) as total_animals FROM OWNERS 
  JOIN ANIMALS ON owners.id = animals.owner_id 
  GROUP BY FULL_NAME
  ORDER BY total_animals DESC;
