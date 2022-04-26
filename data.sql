/* Populate database with sample data. */
-- USE vet_clinic;

-- Insert owners data
INSERT INTO owners (full_name, age) VALUES ('Sam Smith 34', 34), 
('Jennifer Orwell',19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38)
;

-- Insert species data
INSERT INTO species (name) VALUES ('Pokemon'), 
('Digimon');

-- Insert animals data
INSERT INTO animals 
(name, date_of_birth, escape_attempts, neutered, weight_kg, owner_id) 
VALUES
('Agumon', '2020-02-03',0,true, 10.23,
 (SELECT id FROM owners WHERE full_name='Sam Smith')),
('Gabumon', '2018-11-15', 2,true, 8,
 (SELECT id FROM owners WHERE full_name='Jennifer Orwell')),
('Pikachu', '2021-01-07', 1,false, 15.04,
 (SELECT id FROM owners WHERE full_name='Jennifer Orwell')),
('Devimon', '2017-05-12', 5,true, 11,
 (SELECT id FROM owners WHERE full_name='Bob')),
('Plantmon', '2021-11-15', 2,true, -5.7,
 (SELECT id FROM owners WHERE full_name='Bob')),
('Charmander', '2020-02-08', 0,false, -11,
 (SELECT id FROM owners WHERE full_name='Melody Pond')),
('Squirtle', '1992-04-02', 3,false, -12.3,
 (SELECT id FROM owners WHERE full_name='Melody Pond')),
('Blossom', '1998-10-13', 3,true, 17,
 (SELECT id FROM owners WHERE full_name='Melody Pond')),
('Angemon', '2005-06-12', 1,true, -45,
 (SELECT id FROM owners WHERE full_name='Dean Winchester')),
('Boarmon', '2005-06-07', 7,true, 20.4,
 (SELECT id FROM owners WHERE full_name='Dean Winchester'));

UPDATE animals SET species_id=(SELECT id from species WHERE name='Digimon')
where name LIKE '%mon';
UPDATE animals SET species_id=(SELECT id from species WHERE name='Pokemon')
where name NOT LIKE '%mon';

-- Insert vet data
INSERT INTO vets (name ,age, date_of_graduation) VALUES 
('William Tatcher', 45, '2000-04-23'),
('Maisy Smith', 26, '2019-01-17'),
('Stephanie Mendez', 64, '1981-05-04'),
('Jack Harkness', 38, '2008-06-08');

-- Insert specializations data
INSERT INTO specializations (vet_id, species_id) VALUES
((SELECT id from vets WHERE name='William Tatcher'),
(SELECT id from species WHERE name='Pokemon'));

INSERT INTO specializations (vet_id, species_id) VALUES
((SELECT id from vets WHERE name='Stephanie Mendez'),
(SELECT id from species WHERE name='Pokemon'));

INSERT INTO specializations (vet_id, species_id) VALUES
((SELECT id from vets WHERE name='Stephanie Mendez'),
(SELECT id from species WHERE name='Digimon'));

INSERT INTO specializations (vet_id, species_id) VALUES
((SELECT id from vets WHERE name='Jack Harkness'),
(SELECT id from species WHERE name='Digimon'));

INSERT INTO visits (animal_id, vet_id, visit_date) VALUES
(
  (SELECT id from animals WHERE name='Agumon'),
  (SELECT id from vets WHERE name='William Tatcher'),
  '2020-05-24'
),
(
  (SELECT id from animals WHERE name='Agumon'),
  (SELECT id from vets WHERE name='Stephanie Mendez'),
  '2020-07-20'
),
(
  (SELECT id from animals WHERE name='Gabumon'),
  (SELECT id from vets WHERE name='Jack Harkness'),
  '2021-02-02'
),
(
  (SELECT id from animals WHERE name='Pikachu'),
  (SELECT id from vets WHERE name='Maisy Smith'),
  '2020-01-05'
),
(
  (SELECT id from animals WHERE name='Pikachu'),
  (SELECT id from vets WHERE name='Maisy Smith'),
  '2020-03-08'
),
(
  (SELECT id from animals WHERE name='Pikachu'),
  (SELECT id from vets WHERE name='Maisy Smith'),
  '2020-05-14'
),
(
  (SELECT id from animals WHERE name='Devimon'),
  (SELECT id from vets WHERE name='Stephanie Mendez'),
  '2021-05-04'
),
(
  (SELECT id from animals WHERE name='Charmander'),
  (SELECT id from vets WHERE name='Jack Harkness'),
  '2021-02-24'
),
(
  (SELECT id from animals WHERE name='Plantmon'),
  (SELECT id from vets WHERE name='Maisy Smith'),
  '2019-12-21'
),
(
  (SELECT id from animals WHERE name='Plantmon'),
  (SELECT id from vets WHERE name='William Tatcher'),
  '2020-08-10'
),
(
  (SELECT id from animals WHERE name='Plantmon'),
  (SELECT id from vets WHERE name='Maisy Smith'),
  '2021-04-07'
),
(
  (SELECT id from animals WHERE name='Squirtle'),
  (SELECT id from vets WHERE name='Stephanie Mendez'),
  '2019-09-29'
),
(
  (SELECT id from animals WHERE name='Angemon'),
  (SELECT id from vets WHERE name='Jack Harkness'),
  '2020-10-03'
),
(
  (SELECT id from animals WHERE name='Angemon'),
  (SELECT id from vets WHERE name='Jack Harkness'),
  '2020-11-04'
),
(
  (SELECT id from animals WHERE name='Boarmon'),
  (SELECT id from vets WHERE name='Maisy Smith'),
  '2019-01-24'
),
(
  (SELECT id from animals WHERE name='Boarmon'),
  (SELECT id from vets WHERE name='Maisy Smith'),
  '2019-05-15'
),
(
  (SELECT id from animals WHERE name='Boarmon'),
  (SELECT id from vets WHERE name='Maisy Smith'),
  '2020-02-27'
),
(
  (SELECT id from animals WHERE name='Boarmon'),
  (SELECT id from vets WHERE name='Maisy Smith'),
  '2020-08-03'
),
(
  (SELECT id from animals WHERE name='Blossom'),
  (SELECT id from vets WHERE name='Stephanie Mendez'),
  '2020-05-24'
),
(
  (SELECT id from animals WHERE name='Blossom'),
  (SELECT id from vets WHERE name='William Tatcher'),
  '2021-01-11'
);