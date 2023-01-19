CREATE GROUP ml_engineers;
GRANT USAGE ON SCHEMA public TO ml_engineers;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO ml_engineers;
ALTER ROLE ml_engineers WITH LOGIN;

-- Add new user and add to ml_engineers group
CREATE USER jdoe WITH password 'changeme';
ALTER GROUP ml_engineers ADD USER jdoe;


