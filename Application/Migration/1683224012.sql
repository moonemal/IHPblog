CREATE OR REPLACE FUNCTION set_updated_at_to_now() RETURNS TRIGGER AS $$BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;$$ language PLPGSQL;
CREATE TABLE "columns " (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    post_id UUID NOT NULL,
    author TEXT NOT NULL,
    body TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now() NOT NULL
);
CREATE INDEX "columns _post_id_index" ON "columns " (post_id);
ALTER TABLE "columns " ADD CONSTRAINT "columns _ref_post_id" FOREIGN KEY (post_id) REFERENCES posts (id) ON DELETE NO ACTION;
