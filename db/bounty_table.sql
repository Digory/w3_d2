DROP TABLE IF EXISTS  bounty_table;

CREATE TABLE bounty_table(
  id SERIAL8  PRIMARY KEY,
  name VARCHAR(255),
  species VARCHAR(255),
  bounty INT8,
  danger_level VARCHAR(255)
);

  -- INSERT INTO bounty_table(name, species, bounty, danger_level)
  -- VALUES ('David Bowie', 'Spaceman', 100000, 'low');
  --
  -- INSERT INTO bounty_table(name, species, bounty, danger_level)
  -- VALUES ('Jamiroquai', 'Spacebusker', 50000, 'high');
  --
  -- INSERT INTO bounty_table(name, species, bounty, danger_level)
  -- VALUES ('Ursa Major', 'Bear', 10000, 'ermagerdyerderd');

  -- SELECT * FROM bounty_table;
