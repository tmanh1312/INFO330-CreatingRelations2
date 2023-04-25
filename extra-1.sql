-- Add Huskichu to the pokemon_stats table
INSERT INTO pokemon_stats (pokedex_number, name, generation, classification, height_m, weight_kg)
VALUES ('802', 'Huskichu', '1', 'Mascot Pokemon', '1.8', '150');

-- Add Huskichu to the pokemon_primary_type table
INSERT INTO pokemon_primary_type (pokedex_number, type1)
VALUES ('802', 'fairy');

-- Add Huskichu's attacks to the pokemon_abilities table
INSERT INTO pokemon_abilities (pokedex_number, ability_id)
VALUES ('802', 117), ('802', 22);

-- Add Cougarite to the pokemon_stats table
INSERT INTO pokemon_stats (pokedex_number, name, generation, classification, height_m, weight_kg)
VALUES ('803', 'Cougarite', '1', 'Mascot Pokemon', '1.7', '220');

-- Add Cougarite to the pokemon_primary_type table
INSERT INTO pokemon_primary_type (pokedex_number, type1)
VALUES ('803', 'psychic');

-- Add Cougarite's "Slow Attack" to the pokemon_distinct_abilities table
INSERT INTO pokemon_distinct_abilities (id, name)
VALUES (228, 'Slow Attack');

-- Add Cougarite's "Slow Attack" to the pokemon_abilities table
INSERT INTO pokemon_abilities (pokedex_number, ability_id)
VALUES ('803', 228);