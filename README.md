# Detection-Fraude-SQL : Analyse de Risque et Surveillance des Flux Bancaires

## Présentation du Projet
Ce projet simule un environnement de données bancaires pour répondre à des problématiques de **détection de fraude** et de **gestion des risques**. L'objectif est de transformer des données transactionnelles brutes en informations exploitables pour un service de conformité.

Le projet a été conçu pour démontrer mes compétences en PostgreSQL et parce que le sujet m’intéresse.

---

## Architecture des Données
La base de données repose sur trois tables principales liées par des contraintes d'intégrité strictes :

* **`Clients`** : Informations signalétiques et pays de résidence.
* **`Comptes`** : Détails des comptes (Courant/Épargne) et soldes en temps réel.
* **`Transactions`** : Historique des mouvements avec typologie des motifs (Salaire, Loyer, Virement vers Paradis Fiscal, Achat Crypto-actifs, Retrait Cash).

---

## Compétences SQL Démontrées
Ce projet met en œuvre l'intégralité des concepts fondamentaux et avancés du langage SQL :

* **Jointures complexes** : `JOIN`, `LEFT JOIN`, `RIGHT JOIN`, `NATURAL JOIN`.
* **Opérateurs d'ensembles** : `UNION`, `INTERSECT`, `EXCEPT`.
* **Logique de filtrage** : `IN`, `NOT IN`, `EXISTS`, `NOT EXISTS`.
* **Agrégations et Analyse** : `COUNT`, `SUM`, `AVG`, `GROUP BY`, `HAVING`.
* **Requêtes Avancées** : Sous-requêtes corrélées, divisions relationnelles et Common Table Expressions (`WITH ... AS`).

---

## Scénarios d'Analyse (Requêtes Clés)

Le projet répond à 5 problématiques métier concrètes :

1.  **Détection de Blanchiment Potential** : Identification des comptes ayant effectué des volumes de transactions élevés vers des zones à risque (Paradis Fiscaux).
2.  **Surveillance de Rupture de Profil** : Détection des clients réalisant des achats de Crypto-actifs sans revenus réguliers enregistrés (Salaire).
3.  **Ciblage Marketing & VIP** : Croisement des comptes d'épargne élevés et des résidents étrangers via des opérateurs d'intersection.
4.  **Audit des Comptes Dormants** : Identification des comptes sans aucune activité transactionnelle (Comptes "coquilles").
5.  **Analyse des Profils Multi-Risques** : Requête de division pour isoler les clients ayant utilisé **tous** les types de transactions à risque.

---

## Installation et Utilisation
1.  Cloner le dépôt.
2.  Exécuter le fichier `schema.sql` pour créer les tables.
3.  Exécuter le fichier `data.sql` pour insérer les données de test.
4.  Lancer les requêtes d'analyse présentes dans `queries.sql`.

---

## Contact
**SHALABY Youssef** - Aspirant Data Analyst
* https://www.linkedin.com/in/youssef-a-shalaby/
* youssef.akram.shalaby@gmail.com
