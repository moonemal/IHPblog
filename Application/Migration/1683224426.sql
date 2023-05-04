ALTER TABLE "columns " RENAME TO comments;
DROP INDEX "columns _post_id_index";
ALTER TABLE comments DROP CONSTRAINT "columns _ref_post_id";
CREATE OR REPLACE FUNCTION set_updated_at_to_now() RETURNS TRIGGER AS $$BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;$$ language PLPGSQL;
CREATE INDEX comments_post_id_index ON comments (post_id);
ALTER TABLE comments ADD CONSTRAINT comments_ref_post_id FOREIGN KEY (post_id) REFERENCES posts (id) ON DELETE NO ACTION;
