/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon%';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name = 'Agumon' OR name = 'Pikachu';
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN;
UPDATE animals SET species = 'unidentified';
SELECT * FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon%';
UPDATE animals SET species = 'pokemon' WHERE species IS NULL;
COMMIT;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals;
ROLLBACK;
SELECT * FROM animals;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT save;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SAVEPOINT save;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, SUM(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MAX(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '1999-12-31' GROUP BY species;

SELECT animals.id, name FROM animals INNER JOIN owners ON owner_id = owners.id WHERE owners.full_name = 'Melody Pond';
SELECT full_name, animals.name FROM owners LEFT JOIN animals ON owners.id = owner_id;
SELECT species.name, COUNT(*) FROM animals INNER JOIN species ON species_id = species.id GROUP BY species.name;
SELECT animals.name, full_name, species.name FROM animals INNER JOIN species ON species_id = species.id JOIN owners ON owner_id = owners.id WHERE species.name = 'Digimon' AND full_name = 'Jennifer Orwell';
SELECT animals.name FROM animals INNER JOIN species ON species_id = species.id WHERE species.name = 'Pokemon';
SELECT animals.name FROM animals INNER JOIN owners ON owner_id = owners.id WHERE escape_attempts = 0 AND full_name = 'Dean Winchester';
SELECT full_name, COUNT(animals.name) AS count FROM owners INNER JOIN animals ON owner_id = owners.id GROUP BY full_name ORDER BY count DESC;

SELECT vets.name, animals.name, date_of_visit FROM animals INNER JOIN visits ON visits.animal_id = animals.id JOIN vets ON vets.id = visits.vet_id WHERE vets.name = 'William Tatcher' ORDER BY date_of_visit DESC LIMIT 1;
SELECT COUNT(animals.name) FROM visits INNER JOIN animals ON animals.id = visits.animal_id JOIN vets ON visits.vet_id = vets.id WHERE vets.name = 'Stephanie Mendez';
SELECT vets.name, species.name FROM vets LEFT JOIN specializations ON specializations.vet_id = vets.id LEFT JOIN species ON species.id = specializations.species_id;
SELECT animals.name FROM visits JOIN animals ON visits.animal_id = animals.id JOIN vets ON visits.vet_id = vets.id WHERE vets.name = 'Stephanie Mendez' AND visits.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';
SELECT animals.name, COUNT(animals.name) FROM animals JOIN visits ON animals.id = visits.animal_id GROUP BY animals.name ORDER BY COUNT(animals.name) DESC LIMIT 1;
SELECT animals.name, date_of_visit FROM animals INNER JOIN visits ON visits.animal_id = animals.id JOIN vets ON vets.id = visits.vet_id WHERE vets.name = 'Maisy Smith' ORDER BY date_of_visit ASC LIMIT 1;
SELECT vets.name, animals.name, date_of_visit FROM animals INNER JOIN visits ON visits.animal_id = animals.id JOIN vets ON vets.id = visits.vet_id ORDER BY date_of_visit DESC LIMIT 1;
SELECT COUNT(*) FROM visits FULL JOIN vets ON visits.vet_id = vets.id FULL JOIN specializations ON specializations.vet_id = vets.id FULL JOIN animals ON visits.animal_id = animals.id WHERE visits.vet_id != 3 AND animals.species_id != specializations.species_id OR specializations.vet_id IS NULL;
SELECT species.name FROM visits JOIN animals ON visits.animal_id = animals.id JOIN species ON animals.species_id = species.id JOIN vets ON visits.vet_id = vets.id WHERE vet_id = 2 GROUP BY(species.name) LIMIT 1;
