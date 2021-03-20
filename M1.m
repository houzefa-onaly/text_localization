function im1=M1(im0)
im1=im0;
[n,m]=size(im0);
mask=[1 1 1 1 1 1 1 1]; % le masque à appliquer
for x=1:n
    for y=1:m-7 % on avance le curseur qui est le début de la fenêtre 1x8
        if im1(x,y)==1 && im1(x,y+7)==1 % condition pour appliquer le masque
            im1(x,y:y+7)=mask;
        end
    end
end
end
    
    
        
            
            
