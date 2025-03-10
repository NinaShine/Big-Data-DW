
/*
-- Première version de vue mat qui couvre traitement 1 et 2


-- Création de la vue matérialisée PerfPersonnage_Aggregats qui reproupe la requête 1 et 2 du traitement 1 et 2 de requetesPersonnage.sql
CREATE MATERIALIZED VIEW PerfPersonnage_Aggregats AS
SELECT 
    B.Nom AS Nom_Brawler,
    D.Saison,
    COUNT(P.IdSession_Perf) AS Total_Sessions,
    AVG(P.Taux_Victoire) AS Taux_Victoire_Moyen
FROM 
    PerfPersonnage P
JOIN 
    Brawler B ON P.IdBrawler = B.IdBrawler
JOIN 
    Date_Perf D ON P.IdDate = D.IdDate
GROUP BY 
    B.Nom, D.Saison;


--la requetes 1 du traitement 1 de requetesPersonnage.sql devient comme ceci:
--total de sessions par saison
SELECT 
    Nom_Brawler,
    Saison,
    Total_Sessions
FROM 
    PerfPersonnage_Aggregats
ORDER BY 
    Total_Sessions DESC;

--la requetes 2 du traitement 2 de requetesPersonnage.sql devient comme ceci:
--taux de victoire moyen par saison
SELECT 
    Nom_Brawler,
    Saison,
    Taux_Victoire_Moyen
FROM 
    PerfPersonnage_Aggregats
ORDER BY 
    Taux_Victoire_Moyen DESC;

*/


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--apres les remarques du prof voila une vue materialiser qui regroupe toutes les requetes du fichier requetesPersonnage.sql
-- Supprimer la vue si elle existe déjà
DROP MATERIALIZED VIEW IF EXISTS Vue_Perf_Personnages;

CREATE MATERIALIZED VIEW Vue_Perf_Personnages AS
SELECT 
    B.Nom AS Nom_Brawler,
    M.Nom_mode AS Mode_Jeu,
    NJ.TypeJoueur AS Niveau_Joueur,
    D.Saison,
    D.Annee,
    D.Mois,
    COUNT(P.IdSession_Perf) AS Total_Sessions,
    AVG(P.Taux_Victoire) AS Taux_Victoire_Moyen,
    AVG(P.Degats_Totaux) AS Degats_Moyens
FROM 
    PerfPersonnage P
JOIN 
    Brawler B ON P.IdBrawler = B.IdBrawler
LEFT JOIN 
    ModeJeu M ON P.IdMode = M.IdMode
LEFT JOIN 
    NiveauJoueur NJ ON P.IdNiveauJoueur = NJ.IdNiveauJoueur
JOIN 
    Date_Perf D ON P.IdDate = D.IdDate
GROUP BY 
    B.Nom, M.Nom_mode, NJ.TypeJoueur, D.Saison, D.Annee, D.Mois;


--donc les requetes vont etre comme ceci:
--requetes traitelent 1:
SELECT 
    Nom_Brawler, 
    Saison, 
    SUM(Total_Sessions) AS Total_Sessions
FROM 
    Vue_Perf_Personnages
GROUP BY 
    Nom_Brawler, Saison
ORDER BY 
    Total_Sessions DESC;

--requetes traitelent 2:
SELECT 
    Nom_Brawler, 
    Saison, 
    AVG(Taux_Victoire_Moyen) AS Taux_Victoire_Moyen
FROM 
    Vue_Perf_Personnages
GROUP BY 
    Nom_Brawler, Saison
ORDER BY 
    Taux_Victoire_Moyen DESC;

--requetes traitelent 3:
SELECT 
    Nom_Brawler, 
    Niveau_Joueur, 
    AVG(Taux_Victoire_Moyen) AS Taux_Victoire_Moyen, 
    SUM(Total_Sessions) AS Total_Sessions
FROM 
    Vue_Perf_Personnages
GROUP BY 
    Nom_Brawler, Niveau_Joueur
HAVING 
    AVG(Taux_Victoire_Moyen) > 0.7 OR AVG(Taux_Victoire_Moyen) < 0.3
ORDER BY 
    Taux_Victoire_Moyen DESC;

--requetes traitelent 4:
SELECT 
    Nom_Brawler, 
    Annee, 
    Mois, 
    AVG(Taux_Victoire_Moyen) AS Taux_Victoire_Moyen
FROM 
    Vue_Perf_Personnages
WHERE 
    Annee >= 2024
GROUP BY 
    Nom_Brawler, Annee, Mois
ORDER BY 
    Annee, Mois, Taux_Victoire_Moyen DESC;

--requetes traitelent 5:

SELECT 
    Nom_Brawler, 
    Mode_Jeu, 
    AVG(Taux_Victoire_Moyen) AS Taux_Victoire_Moyen, 
    AVG(Degats_Moyens) AS Degats_Moyens
FROM 
    Vue_Perf_Personnages
GROUP BY 
    Nom_Brawler, Mode_Jeu
HAVING 
    AVG(Taux_Victoire_Moyen) > 0.7 OR AVG(Taux_Victoire_Moyen) < 0.3
ORDER BY 
    Taux_Victoire_Moyen DESC;
