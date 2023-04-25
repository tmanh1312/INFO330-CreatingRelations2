-- create the ability table with list_ability column as TEXT
CREATE TABLE IF NOT EXISTS temp1 AS
	SELECT abilities as list_ability, pokedex_number
	FROM imported_pokemon_data
;

-- split abilities list
CREATE TABLE IF NOT EXISTS ability AS
SELECT list_ability,
    trim(value) AS ability,
	pokedex_number
FROM temp1,
    json_each('["' || replace(list_ability, ',', '","') || '"]')
WHERE ability <> ' '
;

--Create new table without the list_ability
CREATE TABLE IF NOT EXISTS new_ability AS
	SELECT ability, pokedex_number
	FROM ability
;

-- drop ability table
DROP TABLE ability;

--rename new table
ALTER TABLE new_ability RENAME TO ability;

-- drop table temp1
DROP TABLE temp1;

-- replace all the [ ' '] from ability
UPDATE ability
SET ability = REPLACE(REPLACE(REPLACE(ability, '[', ''), ']', ''), '''', '');

-- Create a new table without the abilities column
CREATE TABLE no_abilities_pokemon_data AS
SELECT 
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
  against_water, 
  attack, 
  base_egg_steps, 
  base_happiness, 
  base_total, 
  capture_rate, 
  classfication, 
  defense, 
  experience_growth, 
  height_m, 
  hp, 
  name, 
  percentage_male, 
  pokedex_number, 
  sp_attack, 
  sp_defense, 
  speed, 
  type1, 
  type2, 
  weight_kg, 
  generation, 
  is_legendary
FROM imported_pokemon_data;

-- join ability table back to imported_pokemon_data
CREATE TABLE pokemon_data AS
SELECT napd.*, a.ability
FROM no_abilities_pokemon_data AS napd
JOIN ability AS a ON napd.pokedex_number = a.pokedex_number;
