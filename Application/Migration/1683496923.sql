DROP TABLE comments;
ALTER TABLE posts DROP COLUMN created_at;
ALTER TABLE posts DROP COLUMN updated_at;
CREATE OR REPLACE FUNCTION set_updated_at_to_now() RETURNS TRIGGER AS $$BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;$$ language PLPGSQL;
