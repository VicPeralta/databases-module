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
