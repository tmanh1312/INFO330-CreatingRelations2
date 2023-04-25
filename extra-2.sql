-- create trainer table
CREATE TABLE IF NOT EXISTS trainer (
    trainer_id INTEGER PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

-- create favorite_pokemon_types table
CREATE TABLE IF NOT EXISTS favorite_pokemon_types (
    trainer_id INTEGER NOT NULL,
    type TEXT NOT NULL,
    FOREIGN KEY (trainer_id) REFERENCES trainer(trainer_id),
    PRIMARY KEY (trainer_id, type)
);

-- create pokemon_teams table
CREATE TABLE IF NOT EXISTS pokemon_teams (
    trainer_id INTEGER NOT NULL,
    pokemon_id TEXT NOT NULL,
    FOREIGN KEY (trainer_id) REFERENCES trainer(trainer_id),
    FOREIGN KEY (pokemon_id) REFERENCES pokemon_stats(pokedex_number),
    PRIMARY KEY (trainer_id, pokemon_id)
);


-- insert values to 3 tables
INSERT INTO trainer (first_name, last_name) VALUES ('Ted', 'Neward');
INSERT INTO favorite_pokemon_types (trainer_id, type) VALUES (1, 'fairy');
INSERT INTO pokemon_teams (trainer_id, pokemon_id) VALUES (1, '23');

INSERT INTO trainer (first_name, last_name) VALUES ('Kaarina', 'Tulleau');
INSERT INTO favorite_pokemon_types (trainer_id, type) VALUES (2, 'fire');
INSERT INTO pokemon_teams (trainer_id, pokemon_id) VALUES (2, '330');

INSERT INTO trainer (first_name, last_name) VALUES ('Mia', 'Truong');
INSERT INTO favorite_pokemon_types (trainer_id, type) VALUES (3, 'psychic');
INSERT INTO pokemon_teams (trainer_id, pokemon_id) VALUES (3, '16');

