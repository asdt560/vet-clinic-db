/* Database schema to keep the structure of entire database. */


CREATE TABLE animals(
    id INT GENERATED ALWAYS AS IDENTITY, 
    name VARCHAR(255), 
    date_of_birth DATE, 
    escape_attempts INT, 
    neutered BOOLEAN, 
    weight_kg decimal,
    owner_id INT,
    species_id INT,
    PRIMARY KEY(id)
);

CREATE TABLE owners(
    id INT GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR(255),
    age INT,
    PRIMARY KEY(id)
);

CREATE TABLE species(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255),
    PRIMARY KEY(id)
);
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD CONSTRAINT fk_owner FOREIGN KEY(owner_id) REFERENCES owners(id);
ALTER TABLE animals ADD CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id);

CREATE TABLE vets(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255),
    age INT,
    date_of_graduation DATE,
    PRIMARY KEY(id)
);

CREATE TABLE specializations(
    vet_id INT REFERENCES vets(id) ON UPDATE CASCADE ON DELETE CASCADE,
    species_id INT REFERENCES species(id) ON UPDATE CASCADE ON DELETE CASCADE,
    PRIMARY KEY(vet_id, species_id)
);

CREATE TABLE visits(
    vet_id INT REFERENCES vets(id) ON UPDATE CASCADE ON DELETE CASCADE,
    animal_id INT REFERENCES animals(id) ON UPDATE CASCADE ON DELETE CASCADE,
    date_of_visit DATE,
    PRIMARY KEY(vet_id, animal_id, date_of_visit)
);
