--pour postgres

-- Suppression des vues
DROP MATERIALIZED VIEW IF EXISTS Vue_Perf_Personnages;
DROP MATERIALIZED VIEW IF EXISTS perfpersonnage_aggregats;
DROP VIEW IF EXISTS v_joueurs;
DROP VIEW IF EXISTS v_Date;
DROP VIEW IF EXISTS v_Session;

-- Suppression des Tables Achats

DROP TABLE IF EXISTS Achats;
DROP TABLE IF EXISTS Joueurs;
DROP TABLE IF EXISTS Evenement;
DROP TABLE IF EXISTS Produit;
DROP TABLE IF EXISTS Date_Achats;
DROP TABLE IF EXISTS Promotion;
DROP TABLE IF EXISTS Temps;
DROP TABLE IF EXISTS TypeProduit;
DROP TABLE IF EXISTS Session_Achats;

-- Suppression des Tables PerfPersonnage

DROP TABLE IF EXISTS PerfPersonnage;
DROP TABLE IF EXISTS Brawler;
DROP TABLE IF EXISTS Session_Perf;
DROP TABLE IF EXISTS Date_Perf;
DROP TABLE IF EXISTS ModeJeu;
DROP TABLE IF EXISTS NiveauJoueur;




-- Dimension Joueurs
CREATE TABLE Joueurs (
    IdJoueurs SERIAL PRIMARY KEY,  
    Age INTEGER,
    Region VARCHAR(50),
    Date_Inscription DATE,
    Type_Joueur VARCHAR(50)
);

-- Dimension Évènement
CREATE TABLE Evenement (
    IdEvenement SERIAL PRIMARY KEY,
    Type_evenement VARCHAR(50),
    Duree INTEGER,  -- Durée en minutes ou en heures
    Description_evenement VARCHAR(255),
    Recompense_possible VARCHAR(255),
    date_debut DATE,
    date_fin DATE
);

-- Dimension Produit
CREATE TABLE Produit (
    IdProduit SERIAL PRIMARY KEY,
    Nom_Produit VARCHAR(100),
    Prix_unitaire NUMERIC(10, 2),
    Categorie VARCHAR(50),
    Popularite INTEGER
);

-- Dimension Date
CREATE TABLE Date_Achats (
    IdDate SERIAL PRIMARY KEY,
    Date_achats DATE,
    Jour INTEGER,
    Mois INTEGER,
    Annee INTEGER,
    Periode_vacances VARCHAR(50),
    Saison VARCHAR(50)
);

-- Dimension Offre/Promotion
CREATE TABLE Promotion (
    IdPromotion SERIAL PRIMARY KEY,
    TypeOffre VARCHAR(50),
    Remise_Promotion NUMERIC(5, 2),  -- Remise en pourcentage
    Duree INTEGER,  -- Durée en jours
    Frequence VARCHAR(50),
    Popularite INTEGER
);

-- Dimension Session
CREATE TABLE Session_Achats (
    IdSession_Achats SERIAL PRIMARY KEY,
    Duree_Session_Minutes INTEGER,
    Heure_debut TIMESTAMP,
    Type_session VARCHAR(50),
    Nombre_parties INTEGER,
    Achats_effectues INTEGER,
    Trophees_gagnes_total INTEGER DEFAULT 0,
    Trophees_perdus_total INTEGER DEFAULT 0,
    Points_gagnes_rank_total INTEGER DEFAULT 0,
    Points_perdus_rank_total INTEGER DEFAULT 0
);

--Dimensions Temps
CREATE TABLE Temps (
    IdTemps SERIAL PRIMARY KEY,
    Heure VARCHAR(10),
    AM_PM_indicator VARCHAR(50)
);

-- Dimension TypeProduit
CREATE TABLE TypeProduit (
    IdTypeProduit SERIAL PRIMARY KEY,
    TypeProduit VARCHAR(50)
);

-- Table des faits Achats
CREATE TABLE Achats (
    IdProduit INTEGER,
    IdJoueurs INTEGER,
    IdEvenement INTEGER,
    IdPromotion INTEGER,
    IdDate INTEGER,
    IdSession_Achats INTEGER,
    IdTypeProduit INTEGER,
    IdTemps INTEGER,
    Montant_achat NUMERIC(10, 2),
    Nombre_achats INTEGER,
    CONSTRAINT pk_achats PRIMARY KEY (IdProduit, IdJoueurs, IdEvenement, IdPromotion, IdDate, IdSession_Achats, IdTypeProduit, IdTemps),
    CONSTRAINT fk_achats_joueurs FOREIGN KEY (IdJoueurs) REFERENCES Joueurs(IdJoueurs),
    CONSTRAINT fk_achats_evenement FOREIGN KEY (IdEvenement) REFERENCES Evenement(IdEvenement),
    CONSTRAINT fk_achats_produit FOREIGN KEY (IdProduit) REFERENCES Produit(IdProduit),
    CONSTRAINT fk_achats_date FOREIGN KEY (IdDate) REFERENCES Date_Achats(IdDate),
    CONSTRAINT fk_achats_promotion FOREIGN KEY (IdPromotion) REFERENCES Promotion(IdPromotion),
    CONSTRAINT fk_achats_type_produit FOREIGN KEY (IdTypeProduit) REFERENCES TypeProduit(IdTypeProduit),
    CONSTRAINT fk_achats_temps FOREIGN KEY (IdTemps) REFERENCES Temps(IdTemps),
    CONSTRAINT fk_achats_session FOREIGN KEY (IdSession_Achats) REFERENCES Session_Achats(IdSession_Achats)
);
------------------------------------------------------------------------------------------------

-- Dimension Brawler
CREATE TABLE Brawler (
    IdBrawler SERIAL PRIMARY KEY,
    Nom VARCHAR(50),
    Rarete VARCHAR(50),
    Role_brawler VARCHAR(50),
    Date_Sortie DATE,
    Points_de_vie INTEGER,
    Vitesse VARCHAR(50),
    Trait VARCHAR(100),
    Attaque_Par_Munition INTEGER,
    Rang_attaque VARCHAR(50),
    Vitesse_recharge VARCHAR(50),
    Degats_ulti INTEGER,
    Rang_ulti VARCHAR(50)
);

-- Dimension Session
CREATE TABLE Session_Perf (
    IdSession_Perf SERIAL PRIMARY KEY,
    Duree_Session_Minutes INTEGER,
    Heure_debut TIMESTAMP,
    Type_session VARCHAR(50) DEFAULT 'Non applicable',
    Nombre_parties INTEGER DEFAULT 0,
    Achats_effectues INTEGER DEFAULT 0,
    Trophees_gagnes_total INTEGER DEFAULT 0,
    Trophees_perdus_total INTEGER DEFAULT 0,
    Points_gagnes_rank_total INTEGER DEFAULT 0,
    Points_perdus_rank_total INTEGER DEFAULT 0
);

-- Dimension Date
CREATE TABLE Date_Perf (
    IdDate SERIAL PRIMARY KEY,
    Date_p DATE,
    Jour INTEGER,
    Mois INTEGER,
    Annee INTEGER,
    Periode_vacances VARCHAR(50),
    Saison VARCHAR(50)
);

-- Dimension ModeJeu
CREATE TABLE ModeJeu (
    IdMode SERIAL PRIMARY KEY,
    Nom_mode VARCHAR(50),
    Objectif VARCHAR(50),
    Nom_map VARCHAR(50),
    Popularite FLOAT
);

-- Dimension NiveauJoueur
CREATE TABLE NiveauJoueur (
    IdNiveauJoueur SERIAL PRIMARY KEY,
    TypeJoueur VARCHAR(50),
    NiveauJoueur INTEGER
);

-- Table PerfPersonnage
CREATE TABLE PerfPersonnage (
    IdBrawler INTEGER,
    IdNiveauJoueur INTEGER,
    IdSession_Perf INTEGER,
    IdMode INTEGER,
    IdDate INTEGER,
    Taux_Victoire FLOAT,
    Frequence_Utilisation INTEGER,
    Degats_Totaux INTEGER,
    Pick_Rate FLOAT,
    Taux_ban FLOAT,
    EstBanni BOOLEAN,
    CONSTRAINT pk_perf PRIMARY KEY (IdBrawler, IdNiveauJoueur, IdSession_Perf, IdMode, IdDate),
    CONSTRAINT fk_perf_brawler FOREIGN KEY (IdBrawler) REFERENCES Brawler(IdBrawler),
    CONSTRAINT fk_perf_session FOREIGN KEY (IdSession_Perf) REFERENCES Session_Perf(IdSession_Perf),
    CONSTRAINT fk_perf_mode FOREIGN KEY (IdMode) REFERENCES ModeJeu(IdMode),
    CONSTRAINT fk_perf_date FOREIGN KEY (IdDate) REFERENCES Date_Perf(IdDate),
    CONSTRAINT fk_perf_niveaujoueur FOREIGN KEY (IdNiveauJoueur) REFERENCES NiveauJoueur(IdNiveauJoueur)
);

-- Vues pour la gestion des dimensions

-- Vue des Joueurs
CREATE OR REPLACE VIEW v_joueurs AS
SELECT 
    IdJoueurs, 
    Age, 
    Region, 
    Date_Inscription, 
    Type_Joueur
FROM
    Joueurs;

-- Vue des Dates
CREATE OR REPLACE VIEW v_Date AS
SELECT 
    IdDate, 
    Date_achats AS Date_Complete, 
    Jour, 
    Mois, 
    Annee, 
    Periode_vacances, 
    Saison
FROM Date_Achats
UNION ALL
SELECT 
    IdDate, 
    Date_p AS Date_Complete, 
    Jour, 
    Mois, 
    Annee, 
    Periode_vacances, 
    Saison
FROM Date_Perf;

-- Vue des Sessions
CREATE OR REPLACE VIEW v_Session AS
SELECT 
    'Perf' AS Source,
    IdSession_Perf,
    Duree_Session_Minutes,
    Heure_debut,
    Type_session,
    Nombre_parties,
    Achats_effectues,
    Trophees_gagnes_total,
    Trophees_perdus_total,
    Points_gagnes_rank_total,
    Points_perdus_rank_total
FROM Session_Perf
UNION ALL
SELECT 
    'Achats' AS Source,
    IdSession_Achats,
    Duree_Session_Minutes,
    Heure_debut,
    Type_session,
    Nombre_parties,
    Achats_effectues,
    Trophees_gagnes_total,
    Trophees_perdus_total,
    Points_gagnes_rank_total,
    Points_perdus_rank_total
FROM Session_Achats;
