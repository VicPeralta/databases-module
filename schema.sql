/* Database schema to keep the structure of entire database. */

-- CREATE DATABASE
-- CREATE DATABASE vet_clinic;
-- USE vet_clinic;

DROP TABLE IF EXISTS animals;
CREATE TABLE animals (
id INT GENERATED ALWAYS AS IDENTITY,
name text NOT NULL,
date_of_birth DATE,
escape_attempts INTEGER default 0,
neutered BOOLEAN default false,
weight_kg DECIMAL not NULL
);

