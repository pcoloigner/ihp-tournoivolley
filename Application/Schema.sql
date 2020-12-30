-- Your database schema. Use the Schema Designer at http://localhost:8001/ to add some tables.
CREATE TABLE clubs (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    nom TEXT NOT NULL,
    nom_entier TEXT NOT NULL
);
CREATE TABLE tournois (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    nom TEXT NOT NULL,
    tournoi_date DATE NOT NULL,
    niveau TEXT NOT NULL,
    tournoi_type TEXT NOT NULL,
    nb_equipes INT NOT NULL,
    club_id UUID NOT NULL
);
ALTER TABLE tournois ADD CONSTRAINT tournois_ref_club_id FOREIGN KEY (club_id) REFERENCES clubs (id) ON DELETE NO ACTION;
