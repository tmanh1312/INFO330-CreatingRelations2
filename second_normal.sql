-- table for basic stats
CREATE TABLE pokemon_stats (
    pokedex_number TEXT PRIMARY KEY,
    name TEXT,
    generation TEXT,
    classification TEXT,
    height_m TEXT,
    weight_kg TEXT
);

-- insert value to pokemon_stats
INSERT INTO pokemon_stats
    SELECT 
        DISTINCT pokedex_number,
        name, 
        generation,
        classfication,
        height_m,
        weight_kg
    FROM pokemon_data;

-- table for additional info
CREATE TABLE pokemon_additional_info (
    pokedex_number TEXT PRIMARY KEY,
    percentage_male TEXT,
    capture_rate TEXT,
    base_egg_steps TEXT,
    base_happiness TEXT,
    base_total TEXT,
    experience_growth TEXT,
    hp TEXT,
    is_legendary TEXT,
    sp_attack TEXT,
    sp_defense TEXT,
    attack TEXT,
    speed TEXT,
    defense TEXT,
    FOREIGN KEY (pokedex_number) REFERENCES pokemon_stats(pokedex_number)
);

-- insert value to pokemon_additional_info
INSERT INTO pokemon_additional_info
    SELECT 
        DISTINCT pokedex_number,
        percentage_male,
        capture_rate,
        base_egg_steps,
        base_happiness,
        base_total,
        experience_growth,
        hp,
        is_legendary,
        sp_attack,
        sp_defense,
        attack,
        speed,
        defense
    FROM pokemon_data;


-- table for type and type-related stat
CREATE TABLE IF NOT EXISTS pokemon_types (
    pokedex_number TEXT,
    type1 TEXT,
    type2 TEXT,
FOREIGN KEY (pokedex_number) REFERENCES pokemon_stats(pokedex_number)
);

-- insert value to pokemon_stats
INSERT INTO pokemon_types
    SELECT 
        DISTINCT pokedex_number,
        type1, 
        type2
    FROM pokemon_data;

CREATE TABLE IF NOT EXISTS pokemon_against (
    pokedex_number TEXT,
    against_bug TEXT,
    against_dark TEXT,
    against_dragon TEXT,
    against_electric TEXT,
    against_fairy TEXT,
    against_fight TEXT,
    against_fire TEXT,
    against_flying TEXT,
    against_ghost TEXT,
    against_grass TEXT,
    against_ground TEXT,
    against_ice TEXT,
    against_normal TEXT,
    against_poison TEXT,
    against_psychic TEXT,
    against_rock TEXT,
    against_steel TEXT,
    against_water TEXT
FOREIGN KEY(pokedex_number) REFERENCES pokemon_stats(pokedex_number)
);
-- insert value to pokemon_against
INSERT INTO pokemon_against
    SELECT 
        DISTINCT pokedex_number,
        against_bug,
        against_dark,
        against_dragon,
        against_electric,
        against_fairy,
        against_fight,
        against_fire,
        against_flying,
        against_ghost,
        against_grass,
        against_ground,
        against_ice,
        against_normal,
        against_poison,
        against_psychic,
        against_rock,
        against_steel,
        against_water
    FROM pokemon_data;



-- Create the abilities table
CREATE TABLE IF NOT EXISTS pokemon_distinct_abilities(
  id INTEGER PRIMARY KEY,
  name TEXT
);

-- Populate the abilities table
INSERT INTO pokemon_distinct_abilities (name)
  SELECT DISTINCT ability
  FROM pokemon_data;

-- Create the Pokemon-Abilities association table
CREATE TABLE IF NOT EXISTS pokemon_abilities (
  pokedex_number TEXT,
  ability_id INTEGER,
  FOREIGN KEY (pokedex_number) REFERENCES pokemon_stats(pokedex_number),
  FOREIGN KEY (ability_id) REFERENCES pokemon_distinct_abilities(id),
  PRIMARY KEY (pokedex_number, ability_id)
);

-- Populate the Pokemon-Abilities association table
INSERT INTO pokemon_abilities (pokedex_number, ability_id)
  SELECT DISTINCT
    pd.pokedex_number,
    a.id
  FROM pokemon_data pd
  INNER JOIN pokemon_distinct_abilities a ON pd.ability = a.name;






