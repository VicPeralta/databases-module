-- Inside a transaction update the animals table by setting the species column to unspecified. 
-- Verify that change was made. Then roll back the change and verify that species columns 
-- went back to the state before transaction.

-- setting the species column to unspecified
BEGIN TRANSACTION;
UPDATE animals SET species='unspecified';
-- Verify that change was made
SELECT * FROM animals ORDER BY id; 
-- column specied contains unspecified
-- roll back the change
ROLLBACK;
-- column specied contains null

-- Inside a transaction
-- Update the animals table by setting the species column to digimon for all animals 
-- that have a name ending in mon.

BEGIN TRANSACTION;
UPDATE animals SET species='digimon' WHERE name LIKE '%mon' ;

-- Update the animals table by setting the species column to pokemon for all animals 
-- that don't have species already set.
UPDATE animals SET species='pokemon' WHERE species IS NULL;
-- Commit the transaction.
COMMIT TRANSACTION;
-- change was made and persists after commit.
SELECT * FROM animals ORDER BY id;

BEGIN TRANSACTION;
DELETE FROM animals;

-- this query returns none
SELECT * FROM animals ORDER BY id;
ROLLBACK;
-- this query returns all records
SELECT * FROM animals ORDER BY id;

-- inside a transaction
BEGIN TRANSACTION;
-- Delete all animals born after Jan 1st, 2022.
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SELECT * FROM animals ORDER BY id;
-- Create a savepoint for the transaction.
SAVEPOINT BEFORE_WEIGHT_CHANGE;
-- Update all animals' weight to be their weight multiplied by -1.
UPDATE animals SET weight_kg = (weight_kg * -1);
SELECT * FROM animals ORDER BY id;
-- Rollback to the savepoint
ROLLBACK TO BEFORE_WEIGHT_CHANGE
SELECT * FROM animals ORDER BY id;
-- Update all animals' weights that are negative to be their weight multiplied by -1.
UPDATE animals SET weight_kg = (weight_kg * -1) WHERE weight_kg <0;
-- all weights positives
SELECT * FROM animals ORDER BY id;
COMMIT TRANSACTION;

-- How many animals are there? (10)
SELECT COUNT(name) FROM animals;

-- How many animals have never tried to escape? (2)
SELECT COUNT(name) FROM animals WHERE escape_attempts=0;

-- What is the average weight of animals? (15.567)
SELECT AVG(weight_kg) AS "average weight" FROM animals;

-- Who escapes the most, neutered or not neutered animals? (Neutered 20)
SELECT CASE 
WHEN neutered=true THEN 'Neutered' ELSE 'Not Neutered' 
END,
SUM(escape_attempts) as "escapes" FROM animals GROUP BY neutered ORDER BY escapes DESC LIMIT 1;

-- What is the minimum and maximum weight of each type of animal?
SELECT species, MIN(weight_kg) AS "Minimum weight", MAX(weight_kg)  AS "Maximum weight" FROM animals GROUP BY species;

-- What is the average number of escape attempts per animal type of those born 
-- between 1990 and 2000? (3)
SELECT species, AVG(escape_attempts) FROM animals WHERE EXTRACT(YEAR FROM date_of_birth) 
BETWEEN 1990 AND 2000 GROUP BY species;