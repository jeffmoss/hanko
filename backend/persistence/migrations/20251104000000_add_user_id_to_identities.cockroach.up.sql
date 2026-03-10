ALTER TABLE identities ADD COLUMN user_id UUID;
UPDATE identities SET user_id = (SELECT user_id FROM emails WHERE emails.id = identities.email_id) WHERE email_id IS NOT NULL;
ALTER TABLE identities ALTER COLUMN email_id DROP NOT NULL;
ALTER TABLE identities ADD CONSTRAINT identities_users_id_fk FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE;
