ALTER TABLE posts RENAME COLUMN thumbsupcounter TO upvote;
ALTER TABLE posts DROP COLUMN thumbsdowncounter;
ALTER TABLE posts DROP COLUMN userreaction;
ALTER TABLE posts DROP COLUMN reactiontype;
ALTER TABLE users ALTER COLUMN locked_at DROP NOT NULL;
CREATE OR REPLACE FUNCTION set_updated_at_to_now() RETURNS TRIGGER AS $$BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;$$ language PLPGSQL;
