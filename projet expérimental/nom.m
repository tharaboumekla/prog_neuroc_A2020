%Demander le nom des participants

function [y] = nom(NomParticipants) %On créer une fonction nommée "nom" avec le paramètre "NomParticipants".
for i = 1:1:Nombre %La boucle for va passer à travers le nombre de participants un à la fois jusqu'à la fin. 
NomParticipants= input('Entrer le nom du participant: ', 's'); %On met 's' lorsqu'on entre des lettres, parce qu'on veut que ça reconnaissaise la variable comme étant un string.
end
y = NomParticipants; %On veut que la fonction retourne le nom du participant inscrit. 
end