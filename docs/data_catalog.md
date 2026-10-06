# Catalogue de Données — Couche Gold

## Aperçu
La couche Gold est la représentation des données au niveau métier, structurée pour prendre en charge les cas d'usage analytiques et de reporting. Elle se compose de **tables de dimensions** et de **tables de faits** pour des indicateurs métier spécifiques.

---

### 1. **gold.dim_customers**
- **Objectif :** Stocke les détails des clients enrichis avec des données démographiques et géographiques.
- **Colonnes :**

| Nom de colonne   | Type de données | Description                                                                                   |
|------------------|-----------------|-----------------------------------------------------------------------------------------------|
| customer_key     | INT             | Clé de substitution identifiant de manière unique chaque enregistrement client dans la table de dimension. |
| customer_id      | INT             | Identifiant numérique unique attribué à chaque client.                                        |
| customer_number  | NVARCHAR(50)    | Identifiant alphanumérique représentant le client, utilisé pour le suivi et la référence.     |
| first_name       | NVARCHAR(50)    | Le prénom du client, tel qu'enregistré dans le système.                                       |
| last_name        | NVARCHAR(50)    | Le nom de famille du client.                                                                  |
| country          | NVARCHAR(50)    | Le pays de résidence du client (par ex., 'Australia').                                        |
| marital_status   | NVARCHAR(50)    | La situation matrimoniale du client (par ex., 'Married', 'Single').                           |
| gender           | NVARCHAR(50)    | Le genre du client (par ex., 'Male', 'Female', 'n/a').                                        |
| birthdate        | DATE            | La date de naissance du client, au format YYYY-MM-DD (par ex., 1971-10-06).                   |
| create_date      | DATE            | La date et l'heure de création de l'enregistrement client dans le système.                    |

---

### 2. **gold.dim_products**
- **Objectif :** Fournit des informations sur les produits et leurs attributs.
- **Colonnes :**

| Nom de colonne      | Type de données | Description                                                                                   |
|---------------------|-----------------|-----------------------------------------------------------------------------------------------|
| product_key         | INT             | Clé de substitution identifiant de manière unique chaque enregistrement produit dans la table de dimension des produits. |
| product_id          | INT             | Un identifiant unique attribué au produit pour le suivi et la référence internes.             |
| product_number      | NVARCHAR(50)    | Un code alphanumérique structuré représentant le produit, souvent utilisé pour la catégorisation ou l'inventaire. |
| product_name        | NVARCHAR(50)    | Nom descriptif du produit, incluant des détails clés tels que le type, la couleur et la taille. |
| category_id         | NVARCHAR(50)    | Un identifiant unique pour la catégorie du produit, le reliant à sa classification de haut niveau. |
| category            | NVARCHAR(50)    | La classification générale du produit (par ex., Bikes, Components) pour regrouper les articles associés. |
| subcategory         | NVARCHAR(50)    | Une classification plus détaillée du produit au sein de la catégorie, telle que le type de produit. |
| maintenance_required| NVARCHAR(50)    | Indique si le produit nécessite une maintenance (par ex., 'Yes', 'No').                        |
| cost                | INT             | Le coût ou prix de base du produit, exprimé en unités monétaires.                             |
| product_line        | NVARCHAR(50)    | La ligne ou série de produits spécifique à laquelle appartient le produit (par ex., Road, Mountain). |
| start_date          | DATE            | La date à laquelle le produit est devenu disponible à la vente ou à l'utilisation.            |

---

### 3. **gold.fact_sales**
- **Objectif :** Stocke les données transactionnelles de ventes à des fins analytiques.
- **Colonnes :**

| Nom de colonne  | Type de données | Description                                                                                   |
|-----------------|-----------------|-----------------------------------------------------------------------------------------------|
| order_number    | NVARCHAR(50)    | Un identifiant alphanumérique unique pour chaque commande de vente (par ex., 'SO54496').      |
| product_key     | INT             | Clé de substitution reliant la commande à la table de dimension des produits.                 |
| customer_key    | INT             | Clé de substitution reliant la commande à la table de dimension des clients.                  |
| order_date      | DATE            | La date à laquelle la commande a été passée.                                                  |
| shipping_date   | DATE            | La date à laquelle la commande a été expédiée au client.                                      |
| due_date        | DATE            | La date à laquelle le paiement de la commande était dû.                                       |
| sales_amount    | INT             | La valeur monétaire totale de la vente pour la ligne d'article, en unités monétaires entières (par ex., 25). |
| quantity        | INT             | Le nombre d'unités du produit commandées pour la ligne d'article (par ex., 1).                |
| price           | INT             | Le prix unitaire du produit pour la ligne d'article, en unités monétaires entières (par ex., 25). |