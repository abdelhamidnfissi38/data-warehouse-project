# **Conventions de Nommage**

Ce document décrit les conventions de nommage utilisées pour les schémas, tables, vues, colonnes et autres objets de l'entrepôt de données.

## **Table des Matières**

1. [Principes Généraux](#principes-généraux)
2. [Conventions de Nommage des Tables](#conventions-de-nommage-des-tables)
   - [Règles Bronze](#règles-bronze)
   - [Règles Silver](#règles-silver)
   - [Règles Gold](#règles-gold)
3. [Conventions de Nommage des Colonnes](#conventions-de-nommage-des-colonnes)
   - [Clés de Substitution](#clés-de-substitution)
   - [Colonnes Techniques](#colonnes-techniques)
4. [Procédures Stockées](#procédures-stockées)
---

## **Principes Généraux**

- **Conventions de nommage** : Utiliser le snake_case, avec des lettres minuscules et des underscores (`_`) pour séparer les mots.
- **Langue** : Utiliser l'anglais pour tous les noms.
- **Éviter les mots réservés** : Ne pas utiliser de mots réservés SQL comme noms d'objets.

## **Conventions de Nommage des Tables**

### **Règles Bronze**
- Tous les noms doivent commencer par le nom du système source, et les noms de tables doivent correspondre à leurs noms d'origine sans renommage.
- **`<sourcesystem>_<entity>`**
  - `<sourcesystem>` : Nom du système source (par ex., `crm`, `erp`).
  - `<entity>` : Nom exact de la table dans le système source.
  - Exemple : `crm_customer_info` → Informations client provenant du système CRM.

### **Règles Silver**
- Tous les noms doivent commencer par le nom du système source, et les noms de tables doivent correspondre à leurs noms d'origine sans renommage.
- **`<sourcesystem>_<entity>`**
  - `<sourcesystem>` : Nom du système source (par ex., `crm`, `erp`).
  - `<entity>` : Nom exact de la table dans le système source.
  - Exemple : `crm_customer_info` → Informations client provenant du système CRM.

### **Règles Gold**
- Tous les noms doivent utiliser des noms significatifs, alignés sur le métier, pour les tables, en commençant par le préfixe de catégorie.
- **`<category>_<entity>`**
  - `<category>` : Décrit le rôle de la table, tel que `dim` (dimension) ou `fact` (table de faits).
  - `<entity>` : Nom descriptif de la table, aligné sur le domaine métier (par ex., `customers`, `products`, `sales`).
  - Exemples :
    - `dim_customers` → Table de dimension pour les données clients.
    - `fact_sales` → Table de faits contenant les transactions de vente.

#### **Glossaire des Modèles de Catégories**

| Modèle      | Signification                    | Exemple(s)                              |
|-------------|----------------------------------|-----------------------------------------|
| `dim_`      | Table de dimension               | `dim_customer`, `dim_product`           |
| `fact_`     | Table de faits                   | `fact_sales`                            |
| `report_`   | Table de rapport                 | `report_customers`, `report_sales_monthly` |

## **Conventions de Nommage des Colonnes**

### **Clés de Substitution**
- Toutes les clés primaires des tables de dimension doivent utiliser le suffixe `_key`.
- **`<table_name>_key`**
  - `<table_name>` : Se réfère au nom de la table ou de l'entité à laquelle la clé appartient.
  - `_key` : Un suffixe indiquant que cette colonne est une clé de substitution.
  - Exemple : `customer_key` → Clé de substitution dans la table `dim_customers`.

### **Colonnes Techniques**
- Toutes les colonnes techniques doivent commencer par le préfixe `dwh_`, suivi d'un nom descriptif indiquant le but de la colonne.
- **`dwh_<column_name>`**
  - `dwh` : Préfixe exclusivement réservé aux métadonnées générées par le système.
  - `<column_name>` : Nom descriptif indiquant le but de la colonne.
  - Exemple : `dwh_load_date` → Colonne générée par le système utilisée pour stocker la date à laquelle l'enregistrement a été chargé.

## **Procédures Stockées**

- Toutes les procédures stockées utilisées pour le chargement des données doivent suivre le modèle de nommage :
- **`load_<layer>`**.

  - `<layer>` : Représente la couche en cours de chargement, telle que `bronze`, `silver`, ou `gold`.
  - Exemple :
    - `load_bronze` → Procédure stockée pour charger les données dans la couche Bronze.
    - `load_silver` → Procédure stockée pour charger les données dans la couche Silver.