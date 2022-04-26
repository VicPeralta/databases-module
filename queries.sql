-- Who was the last animal seen by William Tatcher? (Blossom, on Jan 11th,2021)
SELECT animals.name, visits.visit_date FROM visits INNER JOIN animals ON animal_id = animals.id
INNER JOIN vets ON vet_id=vets.id WHERE vets.name='William Tatcher' ORDER BY visits.visit_date DESC LIMIT 1;

-- How many different animals did Stephanie Mendez see? (4)
SELECT COUNT(DISTINCT animals.name) FROM visits INNER JOIN animals ON animal_id = animals.id
INNER JOIN vets ON vet_id=vets.id WHERE vets.name='Stephanie Mendez';

-- List all vets and their specialties, including vets with no specialties.
SELECT vets.name, species.name FROM vets LEFT JOIN specializations ON vets.id = vet_id
LEFT JOIN species ON species_id=species.id ORDER BY vets.name;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT animals.name FROM visits INNER JOIN animals ON animal_id= animals.id
INNER JOIN vets ON vet_id=vets.id
WHERE vets.name='Stephanie Mendez' AND visit_date BETWEEN '2020-04-01' AND '2020-08-30'
ORDER BY animals.name;

-- What animal has the most visits to vets? (Boarmon, 4)
SELECT animals.name, COUNT(animals.name) AS number_visits FROM visits INNER JOIN animals ON animal_id= animals.id 
GROUP BY animals.name ORDER BY number_visits DESC LIMIT 1;


-- Who was Maisy Smith's first visit? (Boarmon on Jan 24th, 2019)
SELECT animals.name, visit_date  FROM visits INNER JOIN animals ON animal_id= animals.id
INNER JOIN vets ON vet_id=vets.id
WHERE vets.name='Maisy Smith'
ORDER BY visit_date ASC LIMIT 1;

-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT animals.name, animals.date_of_birth, animals.escape_attempts, animals.neutered, animals.weight_kg, 
vets.name, vets.age, vets.date_of_graduation
visit_date  FROM visits INNER JOIN animals ON animal_id= animals.id
INNER JOIN vets ON vet_id=vets.id
ORDER BY visit_date DESC LIMIT 1;

-- How many visits were with a vet that did not specialize in that animal's species?
SELECT COUNT(animals.name) FROM visits 
INNER JOIN animals ON animal_id= animals.id
INNER JOIN vets ON vet_id=vets.id
WHERE animals.species_id NOT IN((SELECT species_id FROM specializations WHERE vet_id=visits.vet_id));

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT species.name FROM animals INNER JOIN visits ON animals.id=animal_id
INNER JOIN vets ON vet_id=vets.id
INNER JOIN species ON animals.species_id=species.id
WHERE vets.name='Maisy Smith'
GROUP BY species.name ORDER BY  COUNT(species.name) DESC LIMIT 1