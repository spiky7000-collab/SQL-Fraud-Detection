 -- Objectif : Peupler la base avec des profils types (normaux, fraudeurs, inactifs)


INSERT INTO Clients (nom, pays_residence, date_ouverture) VALUES
('Jean Dupont', 'France', '2023-01-15'),     
('Alice Smith', 'Luxembourg', '2023-02-20'),  
('Bob Martin', 'France', '2023-05-10'),      
('Charlie Zen', 'France', '2024-01-05'),     
('Diana Prince', 'Suisse', '2023-03-12');    

INSERT INTO Comptes (id_client, type_compte, solde_actuel) VALUES
(1, 'Courant', 2500),
(2, 'Courant', 55000), 
(2, 'Epargne', 100000),
(3, 'Courant', 150),   
(4, 'Courant', 1200),
(5, 'Courant', 8000),
(5, 'Epargne', 20000);

INSERT INTO Transactions (id_compte, montant, date_transaction, motif) VALUES
(1, 3000, '2024-01-01', 'Salaire'),
(1, 800, '2024-01-05', 'Loyer'),

(2, 6000, '2024-01-10', 'Virement vers Paradis Fiscal'),
(2, 7000, '2024-01-15', 'Virement vers Paradis Fiscal'),
(2, 4000, '2024-01-20', 'Virement vers Paradis Fiscal'),

(5, 500, '2024-02-01', 'Achat Crypto-actifs'),
(5, 400, '2024-02-05', 'Achat Crypto-actifs'),

(6, 2000, '2024-03-01', 'Virement vers Paradis Fiscal'),
(6, 1500, '2024-03-05', 'Achat Crypto-actifs'),
(6, 5000, '2024-03-10', 'Retrait Cash Exceptionnel'),

(7, 3000, '2024-03-15', 'Achat Crypto-actifs');

-- LES REPONSES ATTENDU POUR CHAQUE REQUETE 
-- 1. Alice (id_client = 2 )car elle a 3 transactions vers un "Paradis Fiscal" pour un total de 17 000 €.
-- 2. Bob (id_client = 3) car il a un compte (id 4) mais n'apparaît jamais dans la table Transactions.
-- 3. Diana (id_client = 5) car elle est la seule cliente à avoir réalisé l'intégralité des types de transactions surveillés (Paradis Fiscal, Crypto ET Retrait Cash)
-- 4. Charlie et Diana. Pour Charlie c'est car il achète de la crypto mais n'a aucune ligne "Salaire". Pareil pour Diana mais en plus elle a deux comptes.
-- 5. Diana car elle est la seule à avoir effectué au moins une fois chacun des trois motifs de test : "Paradis Fiscal", "Achat Crypto" ET "Retrait Cash".





