ALTER TABLE quiz_mania_db.users MODIFY COLUMN id_icon int(11) DEFAULT 1 NOT NULL;
ALTER TABLE quiz_mania_db.users DROP FOREIGN KEY users_FK;
ALTER TABLE quiz_mania_db.users ADD CONSTRAINT users_FK FOREIGN KEY (id_icon) REFERENCES quiz_mania_db.icons(id_icon) ON DELETE SET DEFAULT ON UPDATE CASCADE;