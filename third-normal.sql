-- split types into 2 tables
CREATE TABLE pokemon_primary_type (
    pokedex_number TEXT PRIMARY KEY,
    type1 TEXT,
    FOREIGN KEY (pokedex_number) REFERENCES pokemon_stats(pokedex_number)
);

CREATE TABLE pokemon_secondary_type (
    pokedex_number TEXT PRIMARY KEY,
    type2 TEXT,
    FOREIGN KEY (pokedex_number) REFERENCES pokemon_stats(pokedex_number)
);

--insert value into 2 tables
INSERT INTO pokemon_primary_type
    SELECT 
        DISTINCT pokedex_number,
        type1
    FROM pokemon_data;

INSERT INTO pokemon_secondary_type
    SELECT 
        DISTINCT pokedex_number,
        type2
    FROM pokemon_data;

-- drop all redundant tables
DROP TABLE ability;
DROP TABLE imported_pokemon_data;
DROP TABLE no_abilities_pokemon_data;
DROP TABLE pokemon_data;
DROP TABLE pokemon_types;

