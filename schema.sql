/* Database schema to keep the structure of entire database. */


CREATE TABLE animals(
    id INT GENERATED ALWAYS AS IDENTITY, 
    name VARCHAR(255), 
    date_of_birth DATE, 
    escape_attempts INT, 
    neutered BOOLEAN, 
    weight_kg decimal,
    species_id VARCHAR(255) references species(name),
    owner_id VARCHAR(255) references owner(name),
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

