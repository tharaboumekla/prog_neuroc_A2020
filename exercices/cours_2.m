% Devoir : �crire un script (ou une fonction) qui dessine un grand_damier semblable au petit_damier de 2*N x 2*M cases en utilisant le petit_damier et des boucles.


%  exemple de script du dernier cours 
nn = 50;                        % la largeur d'une case
e = zeros(nn/2, nn/2);          
petit_damier = ones(nn, nn);
petit_damier(1:nn/2, 1:nn/2) = e;
petit_damier(nn/2+1:nn, nn/2+1:nn) = e;
figure, imshow(petit_damier)
% figure, imagesc(petit_damier,[0 1]),colormap(gray),axis('square')

    

% voir fonctions en bas au complet (functions should be defined at the end
% of a script).
% % % % % % % % % % % % % % % % % % % % % % % %
% % % % % % % % % % % % % % % % % % % % % % % % 


figure, imshow(fabriquer_grand_damier(100, 4, 4))
% figure, imshow(1-fabriquer_grand_damier(256/(4*3), 4, 4))
% figure,imagesc(fabriquer_grand_damier(256/(4*2), 4, 4),[0 1]),colormap(gray),axis('square')



%% % % % % % 























%% autre solution (paresseuse) 1 :
la_moitie = 10;
m_rangees = 10;
n_colonnes = 10;
grand_damier = repmat(fabriquer_petit_damier(la_moitie), m_rangees, n_colonnes);
%% autre solution (sophistique, mais un peu overkill) 2 :
la_moitie = 10;
nb_repetition = 5;
gradient=mod(0 : nb_repetition * 2 * la_moitie - 1, 2*la_moitie);
logic_gradient=(gradient < la_moitie);
lignes_x=repmat(logic_gradient, nb_repetition * 2 * la_moitie, 1);
lignes_y=lignes_x';
grand_damier = xor(lignes_x, lignes_y);
%% sauvegarder une image
grand_damier1 = fabriquer_grand_damier(256/8, 4, 4);
figure, imshow(grand_damier1)

imwrite(grand_damier1, 'damier.png', 'png')
grand_damier2 = imread('damier.png');
figure, imshow(grand_damier2)
%% il existe aussi d'autres alternatives interessantes pour sauvgarder vos *figures*.
figure, imagesc(grand_damier2),colormap(gray),axis('square'),title('mon premier damier')
saveas(gcf, 'output.png')

grand_damier2 = imread('output.png');
figure, imshow(grand_damier2)


%%
% uint8 vs. double entre 0 et 1...
min(grand_damier1(:)), max(grand_damier1(:))
min(grand_damier2(:)), max(grand_damier2(:))

num_grade=200;
% rampe de luminance
rampe = repmat(0:1/(num_grade-1):1, num_grade, 1);
figure, imshow(rampe)
imwrite(rampe, 'rampe.tif', 'tif')
rampe2 = imread('rampe.tif');
figure, imshow(rampe2)
numel(unique(rampe(:)))
numel(unique(rampe2(:)))
figure, plot(rampe(1,1:100), 255*rampe(1,1:100), 'k', rampe(1,1:100), rampe2(1,1:100), 'r')

rampe3 = uint8(255*rampe); % meme tranformation

%% existe donc plusieurs façon de storer des variables, dependament de la precision (ou de l'espace qu'on a..) dont on a besoin.

% double = 8 bytes (64 bits). single = 4 bytes (32 bits). uint8 = 1 bytes,  (8 bits)





%% % % % % % Devoir 2 % % % % :

% Le grand_damier varie presentement entre 0 (case noires) et 1
% (cases blanches);  faire varier les valeures entre p et q (avec p < q).
% Avec le format de votre choix (double, single, uint8). Vous devrez
% sauvegarder l'image resultante.

%% FUNCTIONS (TJRS A LA FIN DU SCRIPT)
function petit_damier = fabriquer_petit_damier(la_moitie)
% petit_damier = fabriquer_petit_damier(la_moitie)
% Fabrique un petit damier de 2 par 2 cases.
% Frederic Gosselin, 16/01/2003

petit_damier = ones(2 * la_moitie, 2 * la_moitie);
petit_damier(1 : la_moitie, 1 : la_moitie) = 0;
petit_damier(la_moitie + 1 : 2 * la_moitie, la_moitie + 1 : 2 * la_moitie) = 0;
end
% % % % % % % % % % % % % % % % % % % % % % % %
% % % % % % % % % % % % % % % % % % % % % % % % 


% % % % % % % % % % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % % % % % % % % % 
function grand_damier = fabriquer_grand_damier(la_moitie, m_rangees, n_colonnes)
% grand_damier = fabriquer_grand_damier(la_moitie, nb_repetition)
% Fabrique un damier de 2*m_rangees par 2*n_colonnes cases.
% Utilise la fonction fabriquer_petit_damier.
% Frederic Gosselin, 16/01/2003

% fabrique petit damier, i.e.le "cycle"
petit_damier = fabriquer_petit_damier(la_moitie);

% repete le petit damier
grand_damier = zeros(m_rangees * 2 * la_moitie, n_colonnes * 2 * la_moitie);
for ii = 1:m_rangees
	for jj = 1:n_colonnes
		grand_damier(((ii - 1) * 2 * la_moitie + 1) : (ii * 2 * la_moitie), ((jj - 1) * 2 * la_moitie + 1) : (jj * 2 * la_moitie)) = petit_damier;
	end
end

end




dam1(50,1,1,0,1)
dam2(50,1,1,0,1)


function damier= dam2(nn,N,M,ss,ff); 

petit_damier=creation1(nn,ss,ff);
grand_damier = zeros(nn*N, nn*M); %le grand_damier sera de la grosseur qu'on veut * la grosseur du petit damier
for col = 0:N-1  %loop verticale
    for rang = 0:M-1   %loop horizontale
        grand_damier((nn*col)+1:nn*(col+1),(nn*rang)+1:nn*(rang+1))= petit_damier; %damier (Y up :Y down, X Left: X Right)
        %on ajoute un petit_damier au coordonée
        %nn*(col/rang)+1:nn*(col/rang)+1. le +1 est pour eviter les 0 et le
        %chevauchement
    end
end

imwrite(grand_damier, 'damier.png', 'png')
grand_damier2 = imread('damier.png');
figure, imshow(grand_damier2);
end


function petit_damier=creation1(nn,ss,ff)
% le dégradé est déja mis dans cette function
e = zeros(nn/2, nn/2); 
rampe = repmat(ss:(ff-ss)/(nn/2-1):ff, nn/2, 1); %(start: largeur: fin, hauteur)%pour garder la forme de carré, c'est fin-debut/largeur/2-1 %(start: largeur: fin, hauteur)%pour garder la forme de carré, c'est fin-debut/largeur/2-1
petit_damier = ones(nn, nn);
petit_damier(1:nn/2, 1:nn/2) = e;
petit_damier(nn/2+1:nn, nn/2+1:nn);
petit_damier(nn/2+1:nn, 1:nn/2) = rampe;
petit_damier(1:nn/2, nn/2+2:nn) = rampe;
end


figure,imshow(dam1)

