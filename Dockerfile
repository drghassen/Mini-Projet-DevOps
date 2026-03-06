# --- Étape 1 : Build ---
FROM python:3.12-slim AS builder

WORKDIR /app

# Empêcher Python de générer des fichiers .pyc
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Installer les dépendances de build
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    libc-dev \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt


# --- Étape 2 : Runtime ---
FROM python:3.12-slim

WORKDIR /app

# Créer un utilisateur non-root et le dossier de données
RUN groupadd -r django && useradd -r -g django django && \
    mkdir -p /app/data && chown -R django:django /app/data

# Copier les dépendances installées du builder
COPY --from=builder /install /usr/local

# Copier le code source
COPY --chown=django:django . .

# Variables d'environnement pour le fonctionnement
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Basculer vers l'utilisateur non-root
USER django

# Exposer le port par défaut de Django
EXPOSE 8000

# Commande de lancement (utilisant Gunicorn pour la prod-ready)
CMD ["gunicorn", "--bind", "0.0.0.0:8000", "gestion_etudiants.wsgi:application"]
