from django.db import models

class Etudiant(models.Model):
    nom = models.CharField(max_length=100)
    prenom = models.CharField(max_length=100)
    email = models.EmailField(unique=True)
    filiere = models.CharField(max_length=100)
    date_inscription = models.DateField(auto_now_add=True)

    def __str__(self):
        return f"{self.nom} {self.prenom}"
