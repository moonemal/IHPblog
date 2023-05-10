ALTER TABLE posts ALTER COLUMN thumbsupcounter SET NOT NULL;
ALTER TABLE posts ALTER COLUMN thumbsdowncounter SET NOT NULL;
ALTER TABLE posts ADD COLUMN reactiontype UUID DEFAULT uuid_generate_v4() NOT NULL;
CREATE OR REPLACE FUNCTION set_updated_at_to_now() RETURNS TRIGGER AS $$BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;$$ language PLPGSQL;
