%Fonction qui indique si le participant est prêt à commencer l'expérience

function [y] = exp (Debut) %À voir avec Simon ou Michelle si on peut créer une fonction pour les boucles.

Debut = input('Êtes-vous prêt à commencer ? (oui ou non): ', 's');
if strcmpi(Debut,'oui')== 1 %strcmpi : peu importe si le mot est en majuscule ou minuscule, ça va le comparer. Sans le "i", il faut que ça soit écrit exactement de la même façon (majuscules et minuscules prises en compte).
    disp('image'); %Si le participant répond oui, ça va commencer à lui afficher la première image. 
elseif strcmpi(Debut,'non')== 1 %Si le participant répond non, ça va lui donner le message 'Au revoir!'.
    fprintf ('Au revoir!');
end
while strcmpi(Debut,'oui')== 0 || strcmpi(Debut,'non')== 0 
Debut = input('Êtes-vous prêt à commencer ? (oui ou non): ', 's'); %On va faire une boucle while et comparer la réponse du participant à "oui" et "non". Tant qu'il ne répond ni "oui" ni "non", on va lui demander s'il est prêt à commencer l'expérience. 
end
if strcmpi(Debut,'oui')== 1
    disp('image');
elseif strcmpi(Debut,'non')== 1
    disp ('Au revoir!');
end
    
y = Debut; %À voir si on peut créer une fonction pour ces boucles. 
end