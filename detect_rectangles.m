function [liste]=detect_rectangles(im0)
% on suppose ici que toutes les zones blanches sont rectangulaires
% (Remarque : un pixel individuel blanc est aussi un rectangle)
im1=im0;
[n,m]=size(im0);
liste=[]; % liste des coordonnées
for x=1:n % on itère sur toute l'image
    for y=1:m
        if im1(x,y)==1 % si un pixel vaut 1
            fin_x=x;
            fin_y=y;
            % tant qu'on trouve des pixels blancs en bas, on descend
            while fin_x+1<=n && im1(fin_x+1,y)==1 
                fin_x=fin_x+1;
            end
            % tant qu'on trouve des pixels blancs à droite, on avance
            while fin_y+1<=m && im1(x,fin_y+1)==1
                fin_y=fin_y+1;
            end
            liste=[liste;[x fin_x y fin_y]]; % on ajoute les coordonnées trouvées
            im1(x:fin_x,y:fin_y)=zeros(fin_x-x+1,fin_y-y+1); % on met à 0 tous les pixels de la zone pour ne pas répéter
        end
    end
end
end
    
            
                
