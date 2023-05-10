ALTER TABLE posts ALTER COLUMN thumbsupcounter SET DEFAULT 0;
ALTER TABLE posts ALTER COLUMN thumbsdowncounter SET DEFAULT 0;
ALTER TABLE posts ADD COLUMN userreaction TEXT NOT NULL;
CREATE OR REPLACE FUNCTION set_updated_at_to_now() RETURNS TRIGGER AS $$BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;$$ language PLPGSQL;
