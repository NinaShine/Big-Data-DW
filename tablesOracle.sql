
PROMPT "Suppression des relations existantes"
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE Achats';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE Joueurs';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE Evenement';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE Produit';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE Date_Achats';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE Promotion';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE Temps';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE TypeProduit';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE Session_Achats';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;    
/

------------------------------------------------------------------------------------------------

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE PerfPersonnage';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE Brawler';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE Session_Perf';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE Date_Perf';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE ModeJeu';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/

BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE NiveauJoueur';
EXCEPTION
   WHEN OTHERS THEN
      IF SQLCODE != -942 THEN
         RAISE;
      END IF;
END;
/
------------------------------------------------------------------------------------------------




-- Dimension Joueurs
CREATE TABLE Joueurs (
   IdJoueurs NUMBER PRIMARY KEY,
   Age NUMBER,
   Region VARCHAR2(50),
   Date_Inscription DATE,
   Type_Joueur VARCHAR2(50)
);

-- Dimension Évènement
CREATE TABLE Evenement (
   IdEvenement NUMBER PRIMARY KEY,
   Type_evenement VARCHAR2(50),
   Duree INT, -- Durée en jours
   Description_evenement VARCHAR2(255),
   Recompense_possible VARCHAR2(255),
   date_debut DATE,
   date_fin DATE
);

-- Dimension Produit
CREATE TABLE Produit (
   IdProduit NUMBER PRIMARY KEY,
   Nom_Produit VARCHAR2(100),
   Prix_unitaire NUMBER(10, 2),
   Categorie VARCHAR2(50),
   Popularite NUMBER
);

-- Dimension Date
CREATE TABLE Date_Achats (
   IdDate NUMBER PRIMARY KEY,
   Date_achats DATE,
   Jour NUMBER,
   Mois NUMBER,
   Annee NUMBER,
   Periode_vacances VARCHAR2(50),
   Saison VARCHAR2(50)
);

-- Dimension Offre/Promotion
CREATE TABLE Promotion (
    IdPromotion NUMBER PRIMARY KEY,
    TypeOffre VARCHAR2(50),
    --Cout_Promotion NUMBER(10, 2),
    Remise_Promotion NUMBER(5, 2), -- Remise en pourcentage
    Duree NUMBER, -- Durée en jours
    Frequence VARCHAR2(50),
    Popularite NUMBER
);
--Dimension Session
CREATE TABLE Session_Achats (
    IdSession_Achats NUMBER PRIMARY KEY,
    Duree_Session_Minutes INT,
    Heure_debut DATE,
    Type_session VARCHAR2(50),
    Nombre_parties NUMBER,
    Achats_effectues NUMBER,
    Trophees_gagnes_total INT DEFAULT 0,
    Trophees_perdus_total INT DEFAULT 0,
    Points_gagnes_rank_total INT DEFAULT 0,
    Points_perdus_rank_total INT DEFAULT 0
);
--Dimensions Temps
CREATE TABLE Temps (
    IdTemps NUMBER PRIMARY KEY,
    Heure VARCHAR2(10),
    AM_PM_indicator VARCHAR2(50)
);
--Dimension TypeProduit
CREATE TABLE TypeProduit (
    IdTypeProduit NUMBER PRIMARY KEY,
    TypeProduit VARCHAR2(50)
);

-- Table des faits Achats
CREATE TABLE Achats (
    IdProduit NUMBER,
    IdJoueurs NUMBER,
    IdEvenement NUMBER,
    IdPromotion NUMBER,
    IdDate NUMBER,
    IdSession_Achats NUMBER,
    IdTypeProduit NUMBER,
    IdTemps NUMBER,
    Montant_achat NUMBER(10, 2), 
    Nombre_achats INT,
    --Type_achat VARCHAR2(50),
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

--------------------------------------------------------------------------------------------------------------------------------------


--Dimension Brawler
CREATE TABLE Brawler (
    IdBrawler NUMBER PRIMARY KEY,
    Nom VARCHAR2(50),
    Rarete VARCHAR2(50),
    Role_brawler VARCHAR2(50),
    Date_Sortie DATE,
    Points_de_vie INT,
    Vitesse VARCHAR2(50),
    Trait VARCHAR2(100),
    Attaque_Par_Munition INT,
    Rang_attaque VARCHAR2(50),
    Vitesse_recharge VARCHAR2(50),
    Degats_ulti INT,
    Rang_ulti VARCHAR2(50)
);
--Dimension Session
CREATE TABLE Session_Perf (
    IdSession_Perf NUMBER PRIMARY KEY,
    Duree_Session_Minutes INT,
    Heure_debut DATE,
    Type_session VARCHAR2(50) DEFAULT 'Non applicable',
    Nombre_parties INT DEFAULT 0,
    Achats_effectues INT DEFAULT 0,
    Trophees_gagnes_total INT DEFAULT 0,
    Trophees_perdus_total INT DEFAULT 0,
    Points_gagnes_rank_total INT DEFAULT 0,
    Points_perdus_rank_total INT DEFAULT 0
);

--Dimension Date
CREATE TABLE Date_Perf (
    IdDate NUMBER PRIMARY KEY,
    Date_p DATE,
    Jour NUMBER,
    Mois NUMBER,
    Annee NUMBER,
    Periode_vacances VARCHAR2(50),
    Saison VARCHAR2(50)
);
--Dimension ModeJeu
CREATE TABLE ModeJeu (
    IdMode NUMBER PRIMARY KEY,
    Nom_mode VARCHAR2(50),
    Objectif VARCHAR2(50),
    Nom_map VARCHAR2(50),
    Popularite FLOAT
);
--Dimension NiveauJoueur
CREATE TABLE NiveauJoueur(
    IdNiveauJoueur NUMBER PRIMARY KEY,
    TypeJoueur VARCHAR2(50),
    NiveauJoueur INT
);

CREATE TABLE PerfPersonnage (
    IdBrawler NUMBER,
    IdNiveauJoueur NUMBER,
    IdSession_Perf NUMBER,
    IdMode NUMBER,
    IdDate NUMBER,
    Taux_Victoire FLOAT,
    Frequence_Utilisation INT,
    Degats_Totaux INT,
    Pick_Rate FLOAT,
    Taux_ban FLOAT,
    EstBanni NUMBER(1),
    CONSTRAINT pk_perf PRIMARY KEY (IdBrawler, IdNiveauJoueur, IdSession_Perf, IdMode, IdDate),
    CONSTRAINT fk_perf_brawler FOREIGN KEY (IdBrawler) REFERENCES Brawler(IdBrawler),
    CONSTRAINT fk_perf_session FOREIGN KEY (IdSession_Perf) REFERENCES Session_Perf(IdSession_Perf),
    CONSTRAINT fk_perf_mode FOREIGN KEY (IdMode) REFERENCES ModeJeu(IdMode),
    CONSTRAINT fk_perf_date FOREIGN KEY (IdDate) REFERENCES Date_Perf(IdDate),
    CONSTRAINT fk_perf_niveaujoueur FOREIGN KEY (IdNiveauJoueur) REFERENCES NiveauJoueur(IdNiveauJoueur)
);

------------------------------------------------------------------------------------------------

--vue dimensions Joueurs 
CREATE OR REPLACE VIEW v_joueurs AS
SELECT 
    IdJoueurs, 
    Age, 
    Region, 
    Date_Inscription, 
    Type_Joueur
FROM
    Joueurs;


--vue dimensions Date
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

--vue Session
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