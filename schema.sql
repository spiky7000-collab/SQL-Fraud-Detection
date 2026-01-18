/* PROJET : Analyse de Risque et Surveillance des Flux Bancaires
   Objectif : Détection de comportements atypiques 
*/

DROP TABLE IF EXISTS Transactions CASCADE;
DROP TABLE IF EXISTS Comptes CASCADE;
DROP TABLE IF EXISTS Clients CASCADE;

CREATE TABLE Clients (
    id_client SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    pays_residence VARCHAR(50) NOT NULL,
    date_ouverture DATE NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE Comptes (
    id_compte SERIAL PRIMARY KEY,
    id_client INTEGER NOT NULL REFERENCES Clients(id_client), 
    type_compte VARCHAR(20) NOT NULL CHECK (type_compte IN ('Courant', 'Epargne')),
    solde_actuel INTEGER NOT NULL DEFAULT 0 
);

CREATE TABLE Transactions (
    id_trans SERIAL PRIMARY KEY,
    id_compte INTEGER NOT NULL REFERENCES Comptes(id_compte), 
    montant INTEGER NOT NULL CHECK (montant > 0),
    date_transaction DATE NOT NULL,
    motif VARCHAR(100) NOT NULL CHECK (motif IN (
        'Salaire', 
        'Loyer', 
        'Virement vers Paradis Fiscal', 
        'Achat Crypto-actifs', 
        'Retrait Cash Exceptionnel'
    ))
);