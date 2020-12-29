-- Your database schema. Use the Schema Designer at http://localhost:8001/ to add some tables.
CREATE TABLE club (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    nom TEXT NOT NULL,
    nom_entier TEXT NOT NULL
);
