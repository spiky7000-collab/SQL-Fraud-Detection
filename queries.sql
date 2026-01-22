-- 1. Trouver les clients ayant envoyé plus de 3 virements vers des "Paradis Fiscaux" pour un total > 15 000 €.
-- (Identification des clients à haut risque)
select a.id_client, count(distinct b.id_trans), sum(b.montant)
from Comptes a
join Transactions b on (a.id_compte=b.id_compte)
where b.motif='Virement vers Paradis Fiscal'
group by a.id_client
having count(distinct b.id_trans)>= 3 and SUM(b.montant)>15000;

-- 2. Lister les clients qui possèdent un compte mais n'ont strictement aucune transaction enregistrée.
-- (Détection de comptes "Coquilles Vides")
select distinct id_client
from Comptes  
except 
select a.id_client
from Comptes a
join Transactions b on (a.id_compte=b.id_compte);

-- 3. Trouver les clients qui sont à la fois résidents dans un pays étranger ET qui ont effectué des achats de "Crypto-actifs"
-- (Croisement de profils suspects)
select id_client
from clients 
where pays_residence != 'France'
intersect
select distinct a.id_client
from Comptes a
join transactions b on (a.id_compte = b.id_compte)
where b.motif = 'Achat Crypto-actifs';

-- 4. Identifier les comptes qui ont des transactions de sortie importantes (ex: Loyer) mais qui ne reçoivent jamais de "Salaire".
-- (Analyse des revenus non justifiés)
SELECT DISTINCT c.nom
FROM Clients c
JOIN Comptes co ON c.id_client = co.id_client
WHERE co.id_compte IN (
    SELECT id_compte 
    FROM Transactions 
    WHERE motif = 'Achat Crypto-actifs'
    AND id_compte NOT IN (SELECT id_compte FROM Transactions WHERE motif = 'Salaire')
);

-- 5. Trouver les clients qui ont testé tous les motifs de transaction à risque (Virement Paradis Fiscal ET Achat Crypto-actifs ET Retrait Cash Exceptionnel).
-- (La "Division SQL" : Les profils multi-risques)
SELECT a.id_client
FROM Comptes a
JOIN Transactions b ON a.id_compte = b.id_compte
WHERE b.motif IN ('Virement vers Paradis Fiscal', 'Achat Crypto-actifs', 'Retrait Cash Exceptionnel')
GROUP BY a.id_client
HAVING COUNT(DISTINCT b.motif) = 3; 

