
-- What animals belong to Melody Pond?
-- Blossom, Charmander, Squirtle
SELECT animals.name from animals INNER JOIN owners on animals.owner_id=owners.id
WHERE owners.full_name='Melody Pond' ORDER BY animals.name;

-- List of all animals that are pokemon (their type is Pokemon)
-- Blossom, Charmander, Pikachu, Squirtle
SELECT animals.name FROM animals INNER JOIN species ON animals.species_id = species.id
WHERE species.name='Pokemon' ORDER BY animals.name;

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT owners.full_name, animals.name FROM owners LEFT JOIN animals ON owners.id = animals.owner_id
ORDER BY owners.full_name;

-- How many animals are there per species?
-- Digimon 6, Pokemon 4
SELECT species.name, COUNT(animals.name) AS count FROM animals  
INNER JOIN species ON animals.species_id = species.id GROUP BY species.id
ORDER BY count DESC;

-- List all Digimon owned by Jennifer Orwell.
-- Gabumon
SELECT animals.name FROM animals
INNER JOIN owners ON animals.owner_id = owners.id 
INNER JOIN species ON animals.species_id = species.id
WHERE species.name='Digimon' AND owners.full_name='Jennifer Orwell'
ORDER BY animals.name;

-- List all animals owned by Dean Winchester that haven't tried to escape.
-- NONE
SELECT animals.name FROM animals
INNER JOIN owners ON animals.owner_id = owners.id 
WHERE owners.full_name='Dean Winchester' AND escape_attempts=0
ORDER BY animals.name;

-- Who owns the most animals?
-- Melody Pond 3
SELECT owners.full_name, COUNT(animals.name) AS count FROM animals
INNER JOIN owners ON animals.owner_id = owners.id 
GROUP BY owners.full_name ORDER BY count DESC LIMIT 1;