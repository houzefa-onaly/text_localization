function [liste]=effective_text_region(im0,L)
% on prend en entrée l'image et les coordonnées des rectangles 
% obtenus par la fonction detect_rectangles
[n,~]=size(L);
liste=[];
n_gris=sum(imhist(im0)>0); % nombre total de niveaux de gris de l'image
for i=1:n % pour chaque région potentielle
    crds=L(i,:);
    x=crds(1,1);
    fin_x=crds(1,2);
    y=crds(1,3);
    fin_y=crds(1,4);
    im=im0(x:fin_x,y:fin_y);
    p=imhist(im)/numel(im); % histogramme normalisé de la région
    [~,ind]=maxk(p,2); % 2 plus grands pics
    if abs((ind(1)-ind(2)))>(0.15*n_gris) % si la distance est sup au seuil
        liste=[liste;crds]; % on ajoute les coordonnées à la liste
    end
end
end

    
