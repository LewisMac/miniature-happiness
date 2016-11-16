DROP TABLE IF EXISTS albums;
DROP TABLE IF EXISTS artists;


CREATE TABLE artists (
  id SERIAL8 primary key,
  name VARCHAR(255)
);

CREATE TABLE albums (
  id SERIAL8 primary key,
  name VARCHAR(255),
  artist_id int8 references artists(id)
);