DELETE FROM passcodes WHERE user_id IS NULL;
ALTER TABLE passcodes ALTER COLUMN user_id SET NOT NULL;
ALTER TABLE passcodes DROP CONSTRAINT IF EXISTS passcodes_flows_id_fk;
ALTER TABLE passcodes DROP COLUMN IF EXISTS flow_id;
