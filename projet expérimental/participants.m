%But de la fonction : demander le nombre de participants qui vont
%participer à l'expérience. 

function [y] = participants(NbParticipants)
NbParticipants=0; %On initialise la variable en premier.
while NbParticipants < 1 %Tant que le nombre de participant inscrit est en bas de 1, on va demander d'entrer un nombre de participants qui est valide. 
NbParticipants = input('Entrer le nombre de participants: ');
end
y = NbParticipants; %On veut que la fonction retourne une valeur.
end
