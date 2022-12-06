/* Database schema to keep the structure of entire database. */


CREATE TABLE animals(
    id INT GENERATED ALWAYS AS IDENTITY, 
    name VARCHAR(255), 
    date_of_birth DATE, 
    escape_attempts INT, 
    neutered BOOLEAN, 
    weight_kg decimal,
    species VARCHAR(255),
    PRIMARY KEY(id)
);
