--Actions Personnage
--traitement 1
SELECT 
    B.Nom AS Nom_Brawler,
    D.Saison,
    COUNT(P.IdSession_Perf) AS Total_Sessions
FROM 
    PerfPersonnage P
JOIN 
    Brawler B ON P.IdBrawler = B.IdBrawler
JOIN 
    Date_Perf D ON P.IdDate = D.IdDate
GROUP BY 
    B.Nom, D.Saison
ORDER BY 
    Total_Sessions DESC;

--traitement 2
SELECT 
    B.Nom AS Nom_Brawler,
    D.Saison,
    AVG(P.Taux_Victoire) AS Taux_Victoire_Moyen
FROM 
    PerfPersonnage P
JOIN 
    Brawler B ON P.IdBrawler = B.IdBrawler
JOIN 
    Date_Perf D ON P.IdDate = D.IdDate
GROUP BY 
    B.Nom, D.Saison
ORDER BY 
    Taux_Victoire_Moyen DESC;

--traitement 3
SELECT 
    B.Nom AS Nom_Brawler,
    NJ.TypeJoueur,
    AVG(P.Taux_Victoire) AS Taux_Victoire_Moyen,
    COUNT(P.IdSession_Perf) AS Total_Sessions
FROM 
    PerfPersonnage P
JOIN 
    Brawler B ON P.IdBrawler = B.IdBrawler
JOIN 
    NiveauJoueur NJ ON P.IdNiveauJoueur = NJ.IdNiveauJoueur
GROUP BY 
    B.Nom, NJ.TypeJoueur
HAVING 
    AVG(P.Taux_Victoire) > 0.7 OR AVG(P.Taux_Victoire) < 0.3
ORDER BY 
    Taux_Victoire_Moyen DESC;

--traitement 4
SELECT 
    B.Nom AS Nom_Brawler,
    D.Annee,
    D.Mois,
    AVG(P.Taux_Victoire) AS Taux_Victoire_Moyen
FROM 
    PerfPersonnage P
JOIN 
    Brawler B ON P.IdBrawler = B.IdBrawler
JOIN 
    Date_Perf D ON P.IdDate = D.IdDate
WHERE 
    D.Annee >= 2024 
GROUP BY 
    B.Nom, D.Annee, D.Mois
ORDER BY 
    D.Annee, D.Mois, Taux_Victoire_Moyen DESC;


--traitement 5 Analyse des personnages et modes de jeu

SELECT 
    B.Nom AS Nom_Brawler,
    M.Nom_mode AS Mode_Jeu,
    AVG(P.Taux_Victoire) AS Taux_Victoire_Moyen,
    AVG(P.Degats_Totaux) AS Degats_Moyens
FROM 
    PerfPersonnage P
JOIN 
    Brawler B ON P.IdBrawler = B.IdBrawler
JOIN 
    ModeJeu M ON P.IdMode = M.IdMode
GROUP BY 
    B.Nom, M.Nom_mode
HAVING 
    AVG(P.Taux_Victoire) > 0.7 OR AVG(P.Taux_Victoire) < 0.3
ORDER BY 
    Taux_Victoire_Moyen DESC;