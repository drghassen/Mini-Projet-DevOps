from django.shortcuts import render, redirect, get_object_or_404
from .models import Etudiant
from django.db.models import Count

def liste_etudiants(request):
    etudiants = Etudiant.objects.all()
    total_etudiants = etudiants.count()
    return render(request, 'etudiants/liste.html', {
        'etudiants': etudiants,
        'total': total_etudiants
    })

def ajouter_etudiant(request):
    if request.method == 'POST':
        nom = request.POST.get('nom')
        prenom = request.POST.get('prenom')
        email = request.POST.get('email')
        filiere = request.POST.get('filiere')
        
        Etudiant.objects.create(
            nom=nom,
            prenom=prenom,
            email=email,
            filiere=filiere
        )
        return redirect('liste_etudiants')
    return render(request, 'etudiants/ajouter.html')

def supprimer_etudiant(request, pk):
    etudiant = Etudiant.objects.get(pk=pk)
    etudiant.delete()
    return redirect('liste_etudiants')
