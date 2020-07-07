
CREATE TABLE adresse (
                adresse_id INTEGER NOT NULL,
                email VARCHAR NOT NULL,
                telephone INTEGER NOT NULL,
                numero_de_rue INTEGER NOT NULL,
                complement_numero_de_rue VARCHAR,
                complement_rue VARCHAR NOT NULL,
                code_postal INTEGER NOT NULL,
                ville VARCHAR NOT NULL,
                CONSTRAINT adresse_pk PRIMARY KEY (adresse_id)
);


CREATE TABLE pizzeria (
                pizzeria_id INTEGER NOT NULL,
                adresse_id INTEGER NOT NULL,
                nom VARCHAR NOT NULL,
                CONSTRAINT pizzeria_pk PRIMARY KEY (pizzeria_id)
);


CREATE TABLE ingredient (
                ingredient_id INTEGER NOT NULL,
                nom VARCHAR NOT NULL,
                volume FLOAT NOT NULL,
                CONSTRAINT ingredient_pk PRIMARY KEY (ingredient_id)
);


CREATE TABLE stock (
                pizzeria_id INTEGER NOT NULL,
                ingredient_id INTEGER NOT NULL,
                volume FLOAT NOT NULL,
                CONSTRAINT stock_pk PRIMARY KEY (pizzeria_id, ingredient_id)
);


CREATE TABLE pizza (
                pizza_id INTEGER NOT NULL,
                nom VARCHAR NOT NULL,
                prix FLOAT NOT NULL,
                ingredients VARCHAR NOT NULL,
                CONSTRAINT pizza_pk PRIMARY KEY (pizza_id)
);


CREATE TABLE recette (
                ingredient_id INTEGER NOT NULL,
                pizza_id INTEGER NOT NULL,
                volume INTEGER NOT NULL,
                CONSTRAINT recette_pk PRIMARY KEY (ingredient_id, pizza_id)
);


CREATE TABLE Utilisateur (
                utilisateur_id INTEGER NOT NULL,
                adresse_id INTEGER NOT NULL,
                prenom VARCHAR NOT NULL,
                nom VARCHAR NOT NULL,
                poste INTEGER NOT NULL,
                login VARCHAR NOT NULL,
                mot_de_passe VARCHAR NOT NULL,
                CONSTRAINT Utilisateur_pk PRIMARY KEY (utilisateur_id)
);


CREATE TABLE Commande (
                commande_id INTEGER NOT NULL,
                utilisateur_id INTEGER NOT NULL,
                pizzeria_id INTEGER NOT NULL,
                type_paiement INTEGER NOT NULL,
                statut_commande INTEGER NOT NULL,
                mode_retrait INTEGER NOT NULL,
                payement_effectue BOOLEAN NOT NULL,
                prix FLOAT NOT NULL,
                date DATE NOT NULL,
                CONSTRAINT Commande_pk PRIMARY KEY (commande_id)
);


CREATE TABLE ligne_commande (
                ligne_commande_id INTEGER NOT NULL,
                commande_id INTEGER NOT NULL,
                pizza_id INTEGER NOT NULL,
                prix FLOAT NOT NULL,
                quantite INTEGER NOT NULL,
                CONSTRAINT ligne_commande_pk PRIMARY KEY (ligne_commande_id)
);


ALTER TABLE pizzeria ADD CONSTRAINT adresse_pizzeria_fk
FOREIGN KEY (adresse_id)
REFERENCES adresse (adresse_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Utilisateur ADD CONSTRAINT adresse_Utilisateur_fk
FOREIGN KEY (adresse_id)
REFERENCES adresse (adresse_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE stock ADD CONSTRAINT pizzeria_stock_fk
FOREIGN KEY (pizzeria_id)
REFERENCES pizzeria (pizzeria_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Commande ADD CONSTRAINT pizzeria_Commande_fk
FOREIGN KEY (pizzeria_id)
REFERENCES pizzeria (pizzeria_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE recette ADD CONSTRAINT ingredient_recette_fk
FOREIGN KEY (ingredient_id)
REFERENCES ingredient (ingredient_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE stock ADD CONSTRAINT ingredient_stock_fk
FOREIGN KEY (ingredient_id)
REFERENCES ingredient (ingredient_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE ligne_commande ADD CONSTRAINT pizza_ligne_commande_fk
FOREIGN KEY (pizza_id)
REFERENCES pizza (pizza_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE recette ADD CONSTRAINT pizza_recette_fk
FOREIGN KEY (pizza_id)
REFERENCES pizza (pizza_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE Commande ADD CONSTRAINT Utilisateur_Commande_fk
FOREIGN KEY (utilisateur_id)
REFERENCES Utilisateur (utilisateur_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE ligne_commande ADD CONSTRAINT Commande_ligne_commande_fk
FOREIGN KEY (commande_id)
REFERENCES Commande (commande_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
