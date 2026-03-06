# Mini-Projet : Application Web 3-Tiers Gestion Étudiants

## 📝 Présentation
Ce projet est une application web de gestion d'étudiants développée avec **Django** et **SQLite**, conçue pour démontrer les principes fondamentaux du développement **DevOps** (Git Flow, Docker, Docker Compose).

---

## 🏗️ Architecture du Projet (3-Tiers)
L'application respecte une architecture 3-tiers modulaire :
1.  **Présentation (Frontend)** : Templates Django utilisant Bootstrap 5 pour une interface responsive et moderne.
2.  **Logique (Backend)** : Application Django gérant les vues CRUD (Create, Read, Update, Delete) et la logique métier.
3.  **Données (Base de données)** : SQLite pour le stockage persistant des informations étudiants.

---

## 🌳 Stratégie Git Flow
Le projet utilise une gestion de branches rigoureuse (Git Flow) :
*   **main** : Code stable et prêt pour la production. Aucun commit direct autorisé.
*   **develop** : Branche d'intégration pour les nouvelles fonctionnalités.
*   **feature/* ** : Branche temporaire pour *chaque* fonctionnalité. On crée une branche par tâche (ex: `feature/docker-setup`), on travaille dessus, puis on la fusionne dans `develop`.

### 📜 Règles de Commits (Conventional Commits)
Pour assurer une traçabilité claire et professionnelle, nous suivons la norme **Conventional Commits** :
*   **Format** : `<type>: <description>` (ex: `feat: ajout de la suppression étudiant`).
*   **Types autorisés** :
    *   `feat`: Nouvelle fonctionnalité.
    *   `fix`: Correction de bug.
    *   `docs`: Documentation seule (README, commentaires).
    *   `style`: Changement de style/formatage (CSS, indentations) sans changement de logique.
    *   `refactor`: Modification du code qui ne corrige ni un bug ni n'ajoute de fonction.
    *   `chore`: Tâches de maintenance (mise à jour de dépendances, config Git).
*   **Règle d'or** : Utiliser l'impératif ("add" au lieu de "added") et être concis (max 50 caractères).

---

## 🚀 Installation & Lancement (Local)
1.  **Cloner le projet** :
    ```bash
    git clone https://github.com/drghassen/Mini-Projet-DevOps.git
    cd Mini-Projet-DevOps
    ```
2.  **Lancer l'application** : (En attendant Docker)
    ```bash
    python manage.py runserver
    ```
L'application sera disponible sur [http://127.0.0.1:8000/](http://127.0.0.1:8000/).

---

## 🐳 Dockerisation (Production-Ready)
Le projet est entièrement conteneurisé selon les exigences :
*   **Dockerfile** : Multi-stage build optimisé (<300Mo) avec utilisateur non-root.
*   **Docker Compose** : Orchestration avec volume persistant pour la base de données.

### Lancer avec Docker
1.  **Construire et lancer les conteneurs** :
    ```bash
    docker-compose up --build
    ```
2.  **L'application** reste accessible sur le port **8000**.
