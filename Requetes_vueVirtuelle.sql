--requetes apres mise a jour des vue virtuelle :
--actions achats:

--traitement 1
SELECT 
    v_Date.Date_Complete AS DateAchats, 
    v_joueurs.IdJoueurs, 
    p.Categorie AS TypeAchat, 
    COUNT(a.IdProduit) AS NombreAchats, 
    SUM(a.Montant_achat) AS MontantTotal
FROM 
    Achats a
JOIN 
    v_joueurs ON a.IdJoueurs = v_joueurs.IdJoueurs
JOIN 
    Produit p ON a.IdProduit = p.IdProduit
JOIN 
    v_Date ON a.IdDate = v_Date.IdDate
GROUP BY 
    v_Date.Date_Complete, v_joueurs.IdJoueurs, p.Categorie
ORDER BY 
    v_Date.Date_Complete, v_joueurs.IdJoueurs, p.Categorie;

--traitement 2
SELECT 
    v_j.IdJoueurs, 
    SUM(a.Nombre_achats) AS TotalAchats, 
    AVG(v_s.Duree_Session_Minutes) AS MoyenneDureeSession, 
    AVG(v_s.Nombre_parties) AS MoyenneParties
FROM 
    Achats a
JOIN 
    v_joueurs v_j ON a.IdJoueurs = v_j.IdJoueurs
JOIN 
    v_Session v_s ON a.IdSession_Achats = v_s.IdSession_Perf 
                   AND v_s.Source = 'Achats'
GROUP BY 
    v_j.IdJoueurs
ORDER BY 
    TotalAchats DESC;



--traitement 3
SELECT
    e.IdEvenement,
    e.Type_evenement,
    e.date_debut,
    e.date_fin,
    SUM(CASE WHEN v_d.Date_Complete < e.date_debut THEN a.Nombre_achats ELSE 0 END) AS Achats_pre_evenement,
    SUM(CASE WHEN v_d.Date_Complete BETWEEN e.date_debut AND e.date_fin THEN a.Nombre_achats ELSE 0 END) AS Achats_pendant_evenement,
    SUM(CASE WHEN v_d.Date_Complete > e.date_fin THEN a.Nombre_achats ELSE 0 END) AS Achats_post_evenement
FROM Evenement e
JOIN Achats a ON e.IdEvenement = a.IdEvenement
JOIN v_Date v_d ON a.IdDate = v_d.IdDate
GROUP BY e.IdEvenement, e.Type_evenement, e.date_debut, e.date_fin
ORDER BY e.date_debut;


--traitement 4
SELECT 
    tp.TypeProduit AS Type_Produit,
    p.Nom_Produit AS Nom_Produit,
    COUNT(a.IdProduit) AS Nombre_Total_Achats,
    COUNT(DISTINCT a.IdJoueurs) AS Nombre_Joueurs_Uniques,
    ROUND(AVG(a.Nombre_achats), 2) AS Moyenne_Achats_Par_Joueur,
    ROUND(SUM(a.Montant_achat), 2) AS Montant_Total_Achats
FROM 
    Achats a
INNER JOIN Produit p ON a.IdProduit = p.IdProduit
INNER JOIN TypeProduit tp ON a.IdTypeProduit = tp.IdTypeProduit
GROUP BY 
    tp.TypeProduit, 
    p.Nom_Produit
ORDER BY 
    Nombre_Total_Achats DESC, 
    Montant_Total_Achats DESC;

--traitement 5
SELECT 
    p.IdPromotion, 
    p.TypeOffre, 
    v_d.Date_Complete, 
    SUM(a.Montant_achat) AS MontantTotal, 
    COUNT(a.IdProduit) AS NombreAchats
FROM 
    Achats a
JOIN 
    Promotion p ON a.IdPromotion = p.IdPromotion
JOIN 
    v_Date v_d ON a.IdDate = v_d.IdDate
WHERE 
    v_d.Date_Complete BETWEEN (CURRENT_DATE - 7) AND (CURRENT_DATE + p.Duree + 7)
GROUP BY 
    p.IdPromotion, p.TypeOffre, v_d.Date_Complete
ORDER BY 
    p.IdPromotion, v_d.Date_Complete;

--traitement 6
SELECT 
    v_d.Saison, 
    tp.TypeProduit, 
    SUM(a.Montant_achat) AS Total_Achats
FROM 
    Achats a
JOIN 
    v_Date v_d ON a.IdDate = v_d.IdDate
JOIN 
    TypeProduit tp ON a.IdTypeProduit = tp.IdTypeProduit
GROUP BY 
    v_d.Saison, tp.TypeProduit
ORDER BY 
    v_d.Saison, Total_Achats DESC;

--traitement 7
SELECT 
    t.Heure AS Heure, 
    SUM(a.Montant_achat) AS Total_Achats
FROM 
    Achats a
JOIN 
    Temps t ON a.IdTemps = t.IdTemps
GROUP BY 
    t.Heure
ORDER BY 
    t.Heure;



--actions personnage:

--traitement 1
SELECT 
    B.Nom AS Nom_Brawler,
    VD.Saison,
    COUNT(P.IdSession_Perf) AS Total_Sessions
FROM 
    PerfPersonnage P
JOIN 
    Brawler B ON P.IdBrawler = B.IdBrawler
JOIN 
    v_Date VD ON P.IdDate = VD.IdDate  
GROUP BY 
    B.Nom, VD.Saison 
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
    v_Date D ON P.IdDate = D.IdDate
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
    v_Date D ON P.IdDate = D.IdDate
WHERE 
    D.Annee >= 2024 
GROUP BY 
    B.Nom, D.Annee, D.Mois
ORDER BY 
    D.Annee, D.Mois, Taux_Victoire_Moyen DESC;


--traitement 5
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

