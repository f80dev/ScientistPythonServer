#Objectif
L'objectif de ce projet est de construire deux images Docker à destination des DATA Analystes et DATA Scienctist
contenant 
- les principaux outils nécessaires à l'analyse de données via Python
- l'environnement Flask pour exposer le développement sous forme d'API

Du point de vue fonctionnelle, les deux images sont identiques. 
- La première est compatible avec les architectures x86
- La deuxième est destinée aux architectures ARM : Raspberry et carte de développements en général

#Composition
Dans les deux cas, on se repose sur la distribution Linux : Alpine qui à l'avantage d'être légère et
compatible x86 et ARM

Les libraries installées sont 
- Numpy:
- Pandas:
- Scikit-Learn: 
- NetworkX: pour la gestion des graphes
- HDBscan: un algorithme puissant de clustering non inclu dans Scikit-Learn
- matplotlib:


#Gestion sous jenkins
docker rm -f jenkins && docker run --name jenkins -d -u root -v /var/run/docker.sock:/var/run/docker.sock -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkinsci/blueocean
   