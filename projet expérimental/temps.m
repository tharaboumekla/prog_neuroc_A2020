
function [y] = temps(time)
nn = 50; %J'ai utiliser le petit damier juste pour avoir une figure à montrer. 
petit_damier = zeros(nn,nn);
T1 = tic; %Tic et toc sont utilisés pour mesurer le temps. En mettant T1 égal à tic, ça fait démarrer le chronomètre. 
time = 0; %On initialise le temps à 0 secondes. 
while time<=5.00 %Tant que la variable "temps" n'atteint pas 5,00 secondes, le petit damier va continuer à être affiché.
    figure,imshow(petit_damier);
time = toc(T1); % Une fois que le temps atteint 5.00 secondes, on fait arrêter l'affichage du petit damier. 
end
close ALL FORCE
end

%Chercher comment faire apparaître et disparaitre l'image smoothly 
%Comprendre pourquoi on a mis time = toc(T1). Je ne comprend pas trop
%pourquoi on met T1 entre parenthèse. Pour dire qu'on arrête le chronomètre
%T1? Mais alors pourquoi on doit dire que le temps est égal au chronomètre?
