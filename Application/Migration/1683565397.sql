ALTER TABLE posts ADD COLUMN thumbsupcounter INT DEFAULT 0;
ALTER TABLE posts ADD COLUMN thumbsdowncounter INT DEFAULT 0;
ALTER TABLE posts ADD COLUMN userreaction TEXT DEFAULT '' NOT NULL;
CREATE OR REPLACE FUNCTION set_updated_at_to_now() RETURNS TRIGGER AS $$BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;$$ language PLPGSQL;
