ALTER TABLE identities DROP CONSTRAINT IF EXISTS identities_users_id_fk;
UPDATE identities SET email_id = (SELECT id FROM emails WHERE emails.user_id = identities.user_id LIMIT 1) WHERE email_id IS NULL AND user_id IS NOT NULL;
ALTER TABLE identities ALTER COLUMN email_id SET NOT NULL;
ALTER TABLE identities DROP COLUMN IF EXISTS user_id;
