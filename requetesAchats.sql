
--Actions Achats

--traitement 1
SELECT 
    d.Date_achats, 
    j.IdJoueurs, 
    p.Categorie AS TypeAchat, 
    COUNT(a.IdProduit) AS NombreAchats, 
    SUM(a.Montant_achat) AS MontantTotal
FROM 
    Achats a
JOIN 
    Joueurs j ON a.IdJoueurs = j.IdJoueurs
JOIN 
    Produit p ON a.IdProduit = p.IdProduit
JOIN 
    Date_Achats d ON a.IdDate = d.IdDate
GROUP BY 
    CUBE(d.Date_achats, j.IdJoueurs, p.Categorie)
ORDER BY 
    d.Date_achats, j.IdJoueurs, p.Categorie;


--traitement 2
SELECT 
    j.IdJoueurs, 
    SUM(a.Nombre_achats) AS TotalAchats, 
    AVG(sa.Duree_Session_Minutes) AS MoyenneDureeSession, 
    AVG(sa.Nombre_parties) AS MoyenneParties
FROM 
    Achats a
JOIN 
    Joueurs j ON a.IdJoueurs = j.IdJoueurs
JOIN 
    Session_Achats sa ON a.IdSession_Achats = sa.IdSession_Achats
GROUP BY 
    ROLLUP(j.IdJoueurs)
ORDER BY 
    TotalAchats DESC;


--traitement 3     
SELECT
    e.IdEvenement,
    e.Type_evenement,
    e.date_debut,
    e.date_fin,
    SUM(CASE WHEN da.Date_achats < e.date_debut THEN a.Nombre_achats ELSE 0 END) AS Achats_pre_evenement,
    SUM(CASE WHEN da.Date_achats BETWEEN e.date_debut AND e.date_fin THEN a.Nombre_achats ELSE 0 END) AS Achats_pendant_evenement,
    SUM(CASE WHEN da.Date_achats > e.date_fin THEN a.Nombre_achats ELSE 0 END) AS Achats_post_evenement
FROM Evenement e
JOIN Achats a ON e.IdEvenement = a.IdEvenement
JOIN Date_Achats da ON a.IdDate = da.IdDate
GROUP BY ROLLUP(e.IdEvenement, e.Type_evenement, e.date_debut, e.date_fin)
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
GROUP BY CUBE(tp.TypeProduit, 
    p.Nom_Produit)
ORDER BY 
    Nombre_Total_Achats DESC, 
    Montant_Total_Achats DESC;


--traitement 5

SELECT 
    p.IdPromotion, 
    p.TypeOffre, 
    d.Date_achats, 
    SUM(a.Montant_achat) AS MontantTotal, 
    COUNT(a.IdProduit) AS NombreAchats
FROM 
    Achats a
JOIN 
    Promotion p ON a.IdPromotion = p.IdPromotion
JOIN 
    Date_Achats d ON a.IdDate = d.IdDate
WHERE 
    d.Date_achats BETWEEN (CURRENT_DATE - 7) AND (CURRENT_DATE + p.Duree + 7)
GROUP BY 
    ROLLUP(p.IdPromotion, p.TypeOffre, d.Date_achats)
ORDER BY 
    p.IdPromotion, d.Date_achats;


--requetes 6:Analyser les achats selon le type de produit et la saison
SELECT d.Saison, tp.TypeProduit, SUM(a.Montant_achat) AS Total_Achats
FROM Achats a
JOIN Date_Achats d ON a.IdDate = d.IdDate
JOIN TypeProduit tp ON a.IdTypeProduit = tp.IdTypeProduit
GROUP BY ROLLUP(d.Saison, tp.TypeProduit)
ORDER BY d.Saison, Total_Achats DESC;

--requete 7:Étudier la répartition des achats par tranche horaire :
SELECT 
    t.Heure AS Heure, 
    SUM(a.Montant_achat) AS Total_Achats
FROM 
    Achats a
JOIN 
    Temps t ON a.IdTemps = t.IdTemps
GROUP BY 
    CUBE(t.Heure)
ORDER BY 
    t.Heure;
