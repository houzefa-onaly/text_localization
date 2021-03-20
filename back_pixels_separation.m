function [im1,u]=back_pixels_separation(im0)
[n,m]=size(im0);
im1=im0;
p=imhist(im0); % l'histogramme de l'image
u=256; %dernier indice de l'histogramme
Nb=p(u); % nombre de pixels valant 255
while Nb<(0.02*numel(im0)) % tant que Nb est inférieur à 0.2% du nb total de pixels
    Nb=Nb+p(u-1); % on rajoute à Nb le nb de pixels de la valeur qui précède la valeur actuelle
    u=u-1; % on retranche 1 à u
end
u=u-1; %on retranche 1 à u car les indices vont de 1 à 256 alors que ...
       % ... les pixels vont de 0 à 255
       
% on applique l'équation 2 à tous les pixels :

for x=1:n
    for y=1:m
        if im0(x,y)>u  
            im1(x,y)=255;  
        end
    end
end
end

