/* Database schema to keep the structure of entire database. */

-- CREATE DATABASE
-- CREATE DATABASE vet_clinic;
-- USE vet_clinic;

-- Create table owners
DROP TABLE IF EXISTS owners;
CREATE TABLE owners(
  id INT GENERATED ALWAYS AS IDENTITY,
  full_name VARCHAR(100),
  age INTEGER
);
-- Add an email column to your owners table
ALTER TABLE owners 
  ADD COLUMN email VARCHAR(120);

ALTER TABLE owners
  ADD CONSTRAINT PK_owners
  PRIMARY KEY(id);

-- Create table species
DROP TABLE IF EXISTS species;
CREATE TABLE species(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(100)
);

ALTER TABLE species
  ADD CONSTRAINT PK_species
  PRIMARY KEY(id);

-- Create table animals
DROP TABLE IF EXISTS animals;
CREATE TABLE animals (
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(100),
  date_of_birth DATE,
  escape_attempts INTEGER default 0,
  neutered BOOLEAN default false,
  weight_kg DECIMAL not NULL,
  species_id INTEGER,
  owner_id INTEGER
);

ALTER TABLE animals 
  ADD CONSTRAINT PK_animals
  PRIMARY KEY (id);

ALTER TABLE animals 
  ADD CONSTRAINT FK_species
  FOREIGN KEY (species_id)
  REFERENCES species (id);

ALTER TABLE animals 
  ADD CONSTRAINT FK_owners
  FOREIGN KEY (owner_id)
  REFERENCES owners (id);


-- Create table vets
DROP TABLE IF EXISTS vets;
CREATE TABLE vets(
  id INT GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(100),
  age INTEGER,
  date_of_graduation DATE
);

ALTER TABLE vets
  ADD CONSTRAINT PK_vets
  PRIMARY KEY (id);

-- Create Join table specializations 
-- vets / species
DROP TABLE IF EXISTS specializations;
CREATE TABLE specializations(
  vet_id INTEGER,
  species_id INTEGER
);

ALTER TABLE specializations
  ADD CONSTRAINT FK_specializations_vet_id
  FOREIGN KEY (vet_id)
  REFERENCES vets(id);

ALTER TABLE specializations
  ADD CONSTRAINT FK_specializations_species_id
  FOREIGN KEY (species_id)
  REFERENCES species(id);

-- Create Join table visits
-- animals / vets
DROP TABLE IF EXISTS visits;
CREATE TABLE visits(
  animal_id INTEGER,
  vet_id INTEGER,
  date_of_visit DATE
);

ALTER TABLE visits
  ADD CONSTRAINT FK_visits_animal_id
  FOREIGN KEY (animal_id)
  REFERENCES animals(id);

ALTER TABLE visits
  ADD CONSTRAINT FK_visits_vet_id
  FOREIGN KEY (vet_id)
  REFERENCES vets(id);

-- Create index on visits table  based on animal_id
CREATE INDEX IDX_animal_id ON visits (animal_id);

-- Create index on visits table based on vet_id
CREATE INDEX IDX_vet_id ON visits(vet_id);
-- Create index on owners table
CREATE INDEX IDX_email ON owners(email);
