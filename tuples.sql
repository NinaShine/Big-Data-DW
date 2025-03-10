-- Insertion dans la table Joueurs
INSERT INTO Joueurs VALUES (1, 22, 'Europe', DATE '2023-01-10', 'Joueur Actif');
INSERT INTO Joueurs VALUES (2, 18, 'Asie', DATE '2024-05-20', 'Joueur Occasionnel');
INSERT INTO Joueurs VALUES (3, 30, 'Amérique du Nord', DATE '2022-09-15', 'Joueur Actif');
INSERT INTO Joueurs VALUES (4, 25, 'Europe', DATE '2023-03-05', 'Joueur Régulier');
INSERT INTO Joueurs VALUES (5, 35, 'Amérique du Sud', DATE '2021-07-15', 'Joueur Payant');
INSERT INTO Joueurs VALUES (6, 28, 'Afrique', DATE '2022-12-10', 'Joueur Occasionnel');
INSERT INTO Joueurs VALUES (7, 19, 'Océanie', DATE '2024-06-01', 'Nouveau Joueur');
INSERT INTO Joueurs VALUES (8, 21, 'Amérique du Nord', DATE '2024-01-12', 'Joueur Actif');
INSERT INTO Joueurs VALUES (9, 33, 'Asie', DATE '2020-10-20', 'Joueur Payant');
INSERT INTO Joueurs VALUES (10, 40, 'Europe', DATE '2019-05-30', 'Joueur Régulier');



-- Insertion dans la table Evenement
INSERT INTO Evenement VALUES (1, 'Tournoi', 4, 'Compétition internationale', 'Skin exclusif', NULL, NULL);
INSERT INTO Evenement VALUES (2, 'Mega pig', 7, 'Casser la tirelire dans un club', 'Skin legendaire',  TO_DATE('2024-04-05', 'YYYY-MM-DD'), TO_DATE('2024-04-29', 'YYYY-MM-DD'));
INSERT INTO Evenement VALUES (3, 'Community event', 7, 'Faire 200000000 kills', 'Star drop legendaire',TO_DATE('2024-02-05', 'YYYY-MM-DD'), TO_DATE('2024-02-12', 'YYYY-MM-DD'));
INSERT INTO Evenement VALUES (4, 'Bob l eponge', 31, 'Nouveaux pouvoirs et skins de bob l eponge', 'Skins thématiques', NULL, NULL);
INSERT INTO Evenement VALUES (5, 'Double Stardrop Week-End', 3, 'Star drops doublée pendant le week-end', 'Recompenses classiques des star drops', NULL, NULL);
INSERT INTO Evenement VALUES (6, 'Anges vs Demons', 31, 'Nouveaux cosmétiques et modes de jeu ajoutés', 'Nouvelles skins', TO_DATE('2024-09-01', 'YYYY-MM-DD'), TO_DATE('2024-10-01', 'YYYY-MM-DD'));
INSERT INTO Evenement VALUES (7, 'Mega boites', 31, 'Faire des défis pour gagner des mega boites', 'Grosse récompense de boites', NULL, NULL);
INSERT INTO Evenement VALUES (8, 'Anniversaire du jeu', 24, 'Célébration de l’anniversaire du jeu', 'Star drops gratuits', NULL, NULL);
INSERT INTO Evenement VALUES (9, 'Godzilla', 31, 'Récompenses de fin de saison', 'Skins et gemmes', TO_DATE('2024-04-01', 'YYYY-MM-DD'), TO_DATE('2024-05-01', 'YYYY-MM-DD'));
INSERT INTO Evenement VALUES (10, 'Lancement de Nouveau Brawler', 14, 'Nouveau brawler disponible', 'Nouveau brawler', NULL, NULL);
INSERT INTO Evenement VALUES (11, 'Aucun', 0, 'Aucun', 'Aucun', NULL, NULL);


-- Insertion dans la table Produit
INSERT INTO Produit VALUES (1, 'Pack de 160 gemmes', 9.99, 'Gemmes', 80);
INSERT INTO Produit VALUES (2, 'Skin légendaire de Mortis', 14.99, 'Cosmétique', 75);
INSERT INTO Produit VALUES (3, 'Brawl Pass', 8.99, 'Pass', 85);
INSERT INTO Produit VALUES (4, 'Brawl Pass Plus', 12.99, 'Pass', 55);
INSERT INTO Produit VALUES (5, 'Mini Pack de 30 gemmes', 4.99, 'Gemmes', 70);
INSERT INTO Produit VALUES (6, 'Skin Ange Colt', 3.99, 'Cosmétique', 40);
INSERT INTO Produit VALUES (7, 'Offre de Débutant', 2.99, 'Pack d’entrée', 70);
INSERT INTO Produit VALUES (8, 'Pack 10000 d’or', 10.99, 'Ressource virtuelle', 20);
INSERT INTO Produit VALUES (9, 'Power Booster 1000', 5.99, 'Ressource virtuelle', 15);
INSERT INTO Produit VALUES (10, 'Skin Demon de Willow', 3.99, 'Cosmétique', 50);
INSERT INTO Produit VALUES (11, 'Nouveau brawler Kenji', 19.99, 'Cosmétique', 40);
INSERT INTO Produit VALUES (12, 'Star drop demon', 0.99, 'Ressource virtuelle', 50);
INSERT INTO Produit VALUES (13, 'Star drop ange', 0.99, 'Ressource virtuelle', 50);
INSERT INTO Produit VALUES (14, 'Boite godzilla', 0.99, 'Ressource virtuelle', 60);






-- Insertion dans la table Promotion
INSERT INTO Promotion VALUES (1, 'Réduction prix Skins', 20.00, 12, 'Hebdomadaire', 80);
INSERT INTO Promotion VALUES (2, 'Black Friday', 50.00, 3, 'Annuel', 95);
INSERT INTO Promotion VALUES (3, 'Promo Evenement', 15.00, 14, 'Saisonnière', 75);
INSERT INTO Promotion VALUES (4, 'Offre Weekend', 10.00, 2, 'Hebdomadaire', 85);
INSERT INTO Promotion VALUES (5, 'Promo Été', 25.00, 10, 'Saisonnière', 70);
INSERT INTO Promotion VALUES (6, 'Offre Noël', 30.00, 5, 'Annuel', 95);
INSERT INTO Promotion VALUES (7, 'A moitie prix', 5.00, 1, 'Ponctuelle', 60);
INSERT INTO Promotion VALUES (8, 'Promo brawl pass', 20.00, 14, 'Annuel', 85);
INSERT INTO Promotion VALUES (9, 'Offre Saint-Valentin',  20.00, 7, 'Annuel', 85);
INSERT INTO Promotion VALUES (10, 'Promo Nouvelle Année', 35.00, 4, 'Annuel', 90);
INSERT INTO Promotion VALUES (11, 'Aucune', 0.0 , 0, 'Auucne', 0);




-- Insertion dans la table Date_Achats
INSERT INTO Date_Achats VALUES (1, TO_DATE('2024-09-10','YYYY-MM-DD'), 10, 11, 2024, 'Non', 'Automne');
INSERT INTO Date_Achats VALUES (2, TO_DATE ('2024-12-25', 'YYYY-MM-DD'), 25, 12, 2024, 'Oui', 'Hiver');
INSERT INTO Date_Achats VALUES (3, TO_DATE ('2024-01-01', 'YYYY-MM-DD') ,1, 01, 2024, 'Oui', 'Hiver');
INSERT INTO Date_Achats VALUES (4, TO_DATE ('2024-04-15', 'YYYY-MM-DD') ,15, 04, 2024, 'Non', 'Ete');
INSERT INTO Date_Achats VALUES (5, TO_DATE ('2024-03-12', 'YYYY-MM-DD'),12, 03, 2024, 'Non', 'Hiver');
INSERT INTO Date_Achats VALUES (6, TO_DATE ('2024-09-05', 'YYYY-MM-DD'),5, 09, 2024, 'Non', 'Automne');
INSERT INTO Date_Achats VALUES (7, TO_DATE ('2024-12-24', 'YYYY-MM-DD'),24, 12, 2024, 'Oui', 'Hiver');
INSERT INTO Date_Achats VALUES (8, TO_DATE ('2024-08-10', 'YYYY-MM-DD'),10, 08, 2024, 'Non', 'Ete');
INSERT INTO Date_Achats VALUES (9, TO_DATE ('2024-05-01', 'YYYY-MM-DD'),1, 05, 2024, 'Non', 'Printemps');
INSERT INTO Date_Achats VALUES (10, TO_DATE ('2024-04-01', 'YYYY-MM-DD'),1, 11, 2024, 'Non', 'Automne');
INSERT INTO Date_Achats VALUES (11, TO_DATE ('2024-02-10', 'YYYY-MM-DD'),10, 02, 2024, 'Non', 'Hiver');
INSERT INTO Date_Achats VALUES (12, TO_DATE ('2024-04-13', 'YYYY-MM-DD'),13, 04, 2024, 'Non', 'Printemps');
INSERT INTO Date_Achats VALUES (13, TO_DATE ('2024-04-14', 'YYYY-MM-DD'),14, 04, 2024, 'Non', 'Printemps');
INSERT INTO Date_Achats VALUES (14, TO_DATE ('2024-05-12', 'YYYY-MM-DD'),12, 05, 2024, 'Non', 'Printemps');




-- Insertion dans la table Session
INSERT INTO Session_Achats VALUES (1, 180, TO_DATE('2024-09-05 18:15','YYYY-MM-DD HH24:MI'), 'Session Longue', 100, 4, 600, 50, 2000, 0);
INSERT INTO Session_Achats VALUES (2, 45, TO_DATE( '2024-11-10 18:00', 'YYYY-MM-DD HH24:MI'), 'Session Courte', 20, 0, 150, 12, 0, 0);
INSERT INTO Session_Achats VALUES (3, 90, TO_DATE( '2024-02-10 19:00', 'YYYY-MM-DD HH24:MI'), 'Session Moyenne', 50, 2, 150, 12, 1500, 0);
INSERT INTO Session_Achats VALUES (4, 60, TO_DATE( '2024-11-11 12:00','YYYY-MM-DD HH24:MI'), 'Session Courte',30, 2, 150, 30, 0, 0);
INSERT INTO Session_Achats VALUES (5, 240, TO_DATE( '2024-09-10 20:00','YYYY-MM-DD HH24:MI'), 'Session Très Longue',150, 10, 500, 12, 3000, 0);
INSERT INTO Session_Achats VALUES (6, 30, TO_DATE( '2024-03-12 20:00', 'YYYY-MM-DD HH24:MI'), 'Session Très Courte', 15, 1, 50, 0, 100, 0);
INSERT INTO Session_Achats VALUES (7, 150, TO_DATE( '2024-04-13 18:10','YYYY-MM-DD HH24:MI'),  'Session Longue', 60, 5, 200, 12, 1000, 0);
INSERT INTO Session_Achats VALUES (8, 75, TO_DATE( '2024-11-13 10:00', 'YYYY-MM-DD HH24:MI'),'Session Moyenne', 30, 1, 150, 12, 0, 0);
INSERT INTO Session_Achats VALUES (9, 20, TO_DATE( '2024-11-13 21:00', 'YYYY-MM-DD HH24:MI'),'Session Flash', 5, 0, 20, 8, 0,0);
INSERT INTO Session_Achats VALUES (10, 120, TO_DATE( '2024-07-15 19:30', 'YYYY-MM-DD HH24:MI'), 'Session Longue', 50, 2, 250, 0, 1000,0);
INSERT INTO Session_Achats VALUES (11, 60, TO_DATE( '2024-05-12 20:00', 'YYYY-MM-DD HH24:MI'), 'Session Moyenne', 20, 1, 50, 0, 1000, 0);
INSERT INTO Session_Achats VALUES (12, 10, TO_DATE( '2024-04-14 10:00','YYYY-MM-DD HH24:MI'),  'Session Flash', 3, 1, 16, 0, 100, 0);
INSERT INTO Session_Achats VALUES (13, 40, TO_DATE( '2024-04-13 20:50','YYYY-MM-DD HH24:MI'),  'Session Moyenne', 10, 1, 60, 0, 100, 0);
INSERT INTO Session_Achats VALUES (14, 30, TO_DATE( '2024-12-24 20:50','YYYY-MM-DD HH24:MI'),  'Session Moyenne', 10, 1, 60, 0, 100, 0);
INSERT INTO Session_Achats VALUES (15, 30, TO_DATE( '2024-12-25 20:50','YYYY-MM-DD HH24:MI'),  'Session Moyenne', 8, 1, 50, 8, 100, 0);




-- Insertion dans la table Temps
INSERT INTO Temps VALUES (1, '14:00', 'PM');
INSERT INTO Temps VALUES (2, '18:00','PM');
INSERT INTO Temps VALUES (3, '12:00', 'PM');
INSERT INTO Temps VALUES (5, '20:00', 'PM');
INSERT INTO Temps VALUES (6, '16:00', 'PM');
INSERT INTO Temps VALUES (7, '10:00', 'AM');
INSERT INTO Temps VALUES (8, '21:00','PM');
INSERT INTO Temps VALUES (9, '22:00','PM');
INSERT INTO Temps VALUES (10, '09:00', 'AM');
INSERT INTO Temps VALUES (11, '11:00','AM');
INSERT INTO Temps VALUES (12, '20:20', 'PM');
INSERT INTO Temps VALUES (13, '19:00','PM');




-- Insertion dans la table TypeProduit
INSERT INTO TypeProduit VALUES (1, 'Skin');
INSERT INTO TypeProduit VALUES (2, 'Brawler');
INSERT INTO TypeProduit VALUES (3, 'Points Stars');
INSERT INTO TypeProduit VALUES (4, 'Gemmes');
INSERT INTO TypeProduit VALUES (5, 'Pieces');
INSERT INTO TypeProduit VALUES (6, 'Bling');
INSERT INTO TypeProduit VALUES (7, 'Brawl Pass');
INSERT INTO TypeProduit VALUES (8, 'Brawl Pass Plus');
INSERT INTO TypeProduit VALUES (9, 'Star drops');
INSERT INTO TypeProduit VALUES (10, 'Skin limite');
INSERT INTO TypeProduit VALUES (11, 'Ressource evenement limite');

INSERT INTO Achats VALUES (12, 1, 6, 11, 6, 1, 11, 13, 1.95 , 2); 
INSERT INTO Achats VALUES (13, 1, 6, 11, 6, 1, 11, 12, 0.99 , 1); 
INSERT INTO Achats VALUES (6, 1, 6, 11, 6, 1, 10, 8, 3.99 , 1); 


INSERT INTO Achats VALUES (2, 4, 3, 11, 11, 3, 1, 5, 14.99, 1); 
INSERT INTO Achats VALUES (5, 4, 3, 7, 11, 3, 4, 12, 2.49, 1); 


INSERT INTO Achats VALUES (10, 4, 9, 1, 4, 10, 1, 5, 2.99, 1); 
INSERT INTO Achats VALUES (3, 4, 9, 8, 4, 10, 7, 8, 6.99, 1);



INSERT INTO Achats VALUES (3, 10, 11, 8, 5, 6, 7, 12, 6.99, 1);
INSERT INTO Achats VALUES (14, 10, 2, 11, 12, 7, 11, 13, 2.95, 3);
INSERT INTO Achats VALUES (1, 10, 2, 11, 12, 7, 4, 5, 9.99, 1); 
INSERT INTO Achats VALUES (14, 10, 2, 11, 13, 12, 11, 7, 0.99, 1); 
INSERT INTO Achats VALUES (5, 10, 11, 4, 14, 11, 4, 5, 2.49, 1); 



INSERT INTO Achats VALUES (14, 2, 2, 11, 12, 13, 11, 8, 0.99, 1); 



INSERT INTO Achats VALUES (4, 5, 6, 1, 1, 5, 8, 5, 12.99, 1);
INSERT INTO Achats VALUES (10, 5, 6, 1, 1, 5, 4, 8, 3.99, 1);
INSERT INTO Achats VALUES (6, 5, 6, 1, 1, 5, 4, 9, 3.99, 1); 
INSERT INTO Achats VALUES (1, 5, 6, 3, 1, 5, 4, 9, 49.95, 5); 
INSERT INTO Achats VALUES (5, 5, 6, 4, 1, 5, 4, 9, 2.48, 1); 
INSERT INTO Achats VALUES (11, 5, 6, 4, 1, 5, 4, 9, 9.95, 1); 


--pendant Noel
-- OK Achats pendant Noël avec une promotion
INSERT INTO Achats VALUES 
(1, 1, 8, 6, 2, 15, 4, 8, 9.99, 1); -- Pack de 160 gemmes, joueur 1, promo Noël, le 25 décembre

INSERT INTO Achats VALUES 
(2, 2, 8, 6, 2, 15, 1, 8, 14.99, 1); -- Skin légendaire, joueur 2, promo Noël, le 25 décembre

-- OK Achats pendant Noël sans promotion
INSERT INTO Achats VALUES 
(4, 4, 8, 11, 2, 15, 8, 8, 12.99, 1); -- Brawl Pass Plus, joueur 4, sans promo, le 25 décembre

INSERT INTO Achats VALUES 
(7, 7, 8, 11, 7, 14, 1, 2, 10.99, 1); -- Pack 10 000 d'or, joueur 7, sans promo, le 24 décembre

-- OK Achats multiples d'un même joueur
INSERT INTO Achats VALUES 
(8, 10, 8, 6, 7, 14, 5, 6, 8.99, 3); -- pieces
INSERT INTO Achats VALUES 
(9, 10, 8, 11, 7, 14, 5, 7, 10.99, 2); -- pieces

----------  DATA MART 2 -------------------------

INSERT INTO Brawler VALUES (1, 'Shelly', 'Commune', 'Combattant', DATE '2017-06-15', 7400, 'Rapide', NULL, 3000, 'Long', 'Normal', 5760, 'Long');
INSERT INTO Brawler VALUES (2, 'Colt', 'Rare', 'Tireur', DATE '2017-06-15', 5600, 'Normal', NULL, 4320, 'Long', 'Rapide', 7680, 'Tres long');
INSERT INTO Brawler VALUES (3, 'El Primo', 'Super Rare', 'Tank', DATE '2017-08-06', 12000, 'Rapide', 'Charge ulti des degats recus', 3040, 'Court', 'Tres rapide', 1920, 'Long');
INSERT INTO Brawler VALUES (4, 'Barley', 'Rare', 'Lanceur', DATE '2017-06-15', 4800, 'Normal', 'Degats par seconde', 1600, 'Long', 'Lente', 1600, 'Tres long');
INSERT INTO Brawler VALUES (5, 'Crow', 'Légendaire', 'Assassin', DATE '2017-12-21', 4800, 'Tres rapide', 'Empoisonnement', 1920, 'Long', 'Rapide', 3000, 'Long');
INSERT INTO Brawler VALUES (6, 'Spike', 'Légendaire', 'Lanceur', DATE '2017-06-15', 5600, 'Normal', 'Attaque en épine', 1080, 'Long', 'Lente', 800, 'Long');
INSERT INTO Brawler VALUES (7, 'Leon', 'Légendaire', 'Assassin', DATE '2018-11-21', 6800, 'Tres rapide', 'Invisibilité pendant ulti', 3840, 'Tres long', 'Normal', 0, 'Duree de 6 secondes');
INSERT INTO Brawler VALUES (8, 'Sandy', 'Legendaire', 'Contrôleur', DATE '2019-09-18', 7600, 'Rapide', 'Invisibilite groupale pendant ulti', 1800, 'Normal', 'Normal', 0, 'Long');
INSERT INTO Brawler VALUES (9, 'Amber', 'Legendaire', 'Combattant', DATE '2020-10-23', 6400, 'Normal', NULL, 4200, 'Long', 'Tres rapide', 3840, 'Long');
INSERT INTO Brawler VALUES (10, 'Belle', 'Epique', 'Sniper', DATE '2021-04-07', 5200, 'Normal', 'Projectile rebondissant avec moitie degats', 2080, 'Tres long', 'Rapide', 1000, 'Tres long');
INSERT INTO Brawler VALUES (11, 'Willow', 'Mythique', 'Controleur', DATE '2023-03-28', 5600, 'Normal', 'Empoisonnement et control de brawler ennemi pendant ulti', 800, 'Long', 'Lent', 0, 'Long et duree de 4 secondes');
INSERT INTO Brawler VALUES (12, 'Larry & Lawrie', 'Mythique', 'Controleur', DATE '2023-03-28', 6000, 'Normal', 'Attaque deux fois et invoque un robot pour son ulti', 1600, 'Long', 'Lent', 1400, '6000 de vie pour le robot');
INSERT INTO Brawler VALUES (13, 'Kenji', 'Legendaire', 'Assassin', DATE '2024-10-06', 9000, 'Rapide', 'Attaque de deux façons différentes', 2500, 'Court', 'Lent', 2500, 'Tres long, attaque en croix');


INSERT INTO Session_Perf VALUES (1, 45, TO_DATE('2024-11-10 14:00','YYYY-MM-DD HH24:MI'), 'Ladder', 30, 1,  300, 16, 0,0);
INSERT INTO Session_Perf VALUES (2, 30, TO_DATE( '2024-11-10 18:00', 'YYYY-MM-DD HH24:MI'),'Ladder', 15, 0, 50, 8,0,0);
INSERT INTO Session_Perf VALUES (3, 60, TO_DATE( '2024-11-12 14:00','YYYY-MM-DD HH24:MI'),'Rank',  20, 3, 0, 0, 2000, 100);
INSERT INTO Session_Perf VALUES (4, 20, TO_DATE( '2024-11-13 10:00', 'YYYY-MM-DD HH24:MI'),'Rank',  5, 0, 0,0, 200, 300);
INSERT INTO Session_Perf VALUES (5, 50, TO_DATE( '2024-11-13 16:00','YYYY-MM-DD HH24:MI'),'Rank', 22, 1, 0, 0, 1200,0);
INSERT INTO Session_Perf VALUES (6, 35, TO_DATE( '2022-07-03 17:05','YYYY-MM-DD HH24:MI'),'Rank et Ladder', 12, 0, 8, 60, 200, 54);
INSERT INTO Session_Perf VALUES (7, 55, TO_DATE( '2024-11-13 16:50','YYYY-MM-DD HH24:MI'),'Ladder',  40, 2, 300,0,500, 0);
INSERT INTO Session_Perf VALUES (8, 25, TO_DATE( '2024-11-10 19:10', 'YYYY-MM-DD HH24:MI'),'Rank et Ladder',  15, 0, 50, 0, 180, 8);
INSERT INTO Session_Perf VALUES (9, 40, TO_DATE( '2024-03-08 19:00', 'YYYY-MM-DD HH24:MI'),'Rank', 16, 0, 0, 0, 250,1220);
INSERT INTO Session_Perf VALUES (10, 70 ,TO_DATE( '2024-11-13 21:00', 'YYYY-MM-DD HH24:MI'), 'Rank et Ladder', 60, 4, 160, 8, 1200, 1000);
INSERT INTO Session_Perf VALUES (11, 30 ,TO_DATE( '2024-11-13 23:00', 'YYYY-MM-DD HH24:MI'), 'Rank ', 10, 0, 0, 0, 0, 1000);
INSERT INTO Session_Perf VALUES (12, 30 ,TO_DATE( '2024-11-13 18:00', 'YYYY-MM-DD HH24:MI'), 'Rank ', 10, 0, 0, 0, 400, 600);




INSERT INTO Date_Perf VALUES (1, DATE '2021-01-01', 1, 01, 2021, 'Non', 'Hiver');
INSERT INTO Date_Perf VALUES (2, DATE '2022-06-02', 2, 06, 2022, 'Oui', 'Ete');
INSERT INTO Date_Perf VALUES (3, DATE '2022-07-03', 3, 07, 2022, 'Oui', 'Ete');
INSERT INTO Date_Perf VALUES (4, DATE '2022-11-04', 4, 11, 2022, 'Non', 'Automne');
INSERT INTO Date_Perf VALUES (5, DATE '2023-04-05', 5, 04, 2023, 'Non', 'Printemps');
INSERT INTO Date_Perf VALUES (6, DATE '2023-05-06', 6, 05, 2023, 'Non', 'Printemps');
INSERT INTO Date_Perf VALUES (7, DATE '2023-06-07', 7, 06, 2023, 'Oui', 'Ete');
INSERT INTO Date_Perf VALUES (8, DATE '2024-03-08', 8, 03, 2024, 'Non', 'Hiver');
INSERT INTO Date_Perf VALUES (9, DATE '2024-08-09', 9, 08, 2024, 'Oui', 'Ete');
INSERT INTO Date_Perf VALUES (10, DATE '2024-11-13', 13, 11, 2024, 'Non', 'Automne');
INSERT INTO Date_Perf VALUES (11, DATE '2024-11-10', 10, 11, 2024, 'Non', 'Automne');




INSERT INTO ModeJeu VALUES (1, 'Showdown', 'Survivre', 'Skull Creek', 0.85);
INSERT INTO ModeJeu VALUES (2, 'Brawl Ball', 'Marquer des buts', 'Super Stadium', 0.70);
INSERT INTO ModeJeu VALUES (3, 'Heist', 'Protéger le coffre', 'Safe Zone', 0.60);
INSERT INTO ModeJeu VALUES (4, 'Gem Grab', 'Collecter des gemmes', 'Crystal Arcade', 0.75);
INSERT INTO ModeJeu VALUES (5, 'Bounty', 'Éliminer les ennemis', 'Snake Prairie', 0.65);
INSERT INTO ModeJeu VALUES (6, 'Hot Zone', 'Contrôler la zone', 'Split', 0.50);
INSERT INTO ModeJeu VALUES (7, 'Knockout', 'Éliminer tous les adversaires', 'Goldarm Gulch', 0.65);
INSERT INTO ModeJeu VALUES (8, 'Duo Showdown', 'Survivre en duo', 'Double Trouble', 0.80);
INSERT INTO ModeJeu VALUES (9, 'Ranked', 'Compétitif', 'Random Map', 0.90);


INSERT INTO NiveauJoueur VALUES (1, 'Joueur Débutant', 1);
INSERT INTO NiveauJoueur VALUES (2, 'Joueur Intermédiaire', 2);
INSERT INTO NiveauJoueur VALUES (3, 'Joueur Avancé', 3);
INSERT INTO NiveauJoueur VALUES (4, 'Joueur Expert', 4);
INSERT INTO NiveauJoueur VALUES (5, 'Joueur Maître', 5);


-- PerfPersonnage : performances des brawlers par session, joueur, mode et date
INSERT INTO PerfPersonnage VALUES (1, 4, 6, 4, 3, 0.1, 20, 200000, 0.22, 0.0, FALSE); --ok shelly session 6

INSERT INTO PerfPersonnage VALUES (2, 2, 9, 9, 8, 0.6, 6, 240000, 0.37, 0.0, FALSE); --ok colt session 9
INSERT INTO PerfPersonnage VALUES (3, 2, 9, 9, 8, 0.5, 10, 450000, 0.63, 0.0, FALSE); --ok primo session 9

INSERT INTO PerfPersonnage VALUES (4, 5, 1, 2, 11, 1.0, 20, 1000000, 0.67, 0.0, FALSE); -- ok barley session 1
INSERT INTO PerfPersonnage VALUES (5, 5, 1, 3, 11, 0.6, 5, 150000, 0.17, 0.0, FALSE); -- ok crow session 1
INSERT INTO PerfPersonnage VALUES (6, 5, 1, 6, 11, 0.75, 5, 25000, 0.17, 0.0, FALSE); -- ok spike session 1

INSERT INTO PerfPersonnage VALUES (9, 2, 6, 9, 3, 0.0, 9, 250000,0.75, 0.0,FALSE); -- ok amber session 6
INSERT INTO PerfPersonnage VALUES (2, 2, 6, 3, 3, 0.67, 3, 150000, 0.25, 0.0,FALSE); -- ok colt session 6

INSERT INTO PerfPersonnage VALUES (7, 1, 10, 2, 10, 0.5, 2, 50000, 0.09, 0.0, FALSE); -- ok leon session 10 brawl ball
INSERT INTO PerfPersonnage VALUES (10, 1, 10, 5, 10, 0.5, 2, 70000, 1.0, 0.0, FALSE); -- ok belle session 10 bounty
INSERT INTO PerfPersonnage VALUES (1, 1, 10, 7, 10, 0.0, 2, 40000, 1.0, 0.0, FALSE); -- ok shelly session 10 knockout
INSERT INTO PerfPersonnage VALUES (2, 1, 10, 8, 10, 0.5, 2, 65000, 1.0, 0.0, FALSE); -- ok colt session 10 duo showdown
INSERT INTO PerfPersonnage VALUES (4, 1, 10, 4, 10, 1.0, 2, 50000, 0.16, 0.0, FALSE); -- ok barley session 10 gem grab
INSERT INTO PerfPersonnage VALUES (13, 1, 10, 2, 10, 0.9, 20, 1100000, 0.6, 0.0,FALSE); -- ok kenji session 10 brawl ball
INSERT INTO PerfPersonnage VALUES (13, 1, 10, 4, 10, 1.0, 10, 550000, 0.6, 0.0,FALSE); -- ok kenji session 10 gem grab
INSERT INTO PerfPersonnage VALUES (13, 1, 10, 9, 10, 1.0, 6, 250000, 1.0, 0.0,FALSE); -- session 10 rank pas banni
INSERT INTO PerfPersonnage VALUES (13, 1, 11, 9, 10, NULL,NULL , NULL, NULL, 0.7,TRUE); -- ok kenji session 10 banni
INSERT INTO PerfPersonnage VALUES (9, 1, 11, 9, 10, 0.14,14 , 100000, 0.28, 1.0,FALSE); -- ok amber session 10 quand kenji banni



INSERT INTO PerfPersonnage VALUES (9, 4, 9, 9, 8, 0.1, 12, 300000, 0.8, 0.0,FALSE); -- ok amber session 8
INSERT INTO PerfPersonnage VALUES (11, 4, 9, 9, 8, 1.0, 4, 220000, 0.2, 0.0,FALSE); -- ok willow session 8


INSERT INTO PerfPersonnage VALUES (12, 1, 7, 2, 10, 1.0, 30, 2400000, 0.75, 1.0, FALSE); --ok Larry session 7
INSERT INTO PerfPersonnage VALUES (12, 1, 7, 9, 10, 1.0, 1, 60000, 1.0, 0.0, FALSE); --ok Larry session 7 rank
INSERT INTO PerfPersonnage VALUES (12, 1, 12, 9, 10, NULL, NULL, NULL, NULL, 0.9, TRUE); --ok Larry session 7 banni
INSERT INTO PerfPersonnage VALUES (10 ,1, 12, 9, 10, 0.4, 10, 100000, 1.0, 0.0, FALSE); --ok Larry session 7 banni

