function im1=M2(im0)
im1=im0;
[n,m]=size(im0);
mask=[1 1 1 
      1 1 1]; % le masque à appliquer
for x=1:n-1 % on avance le curseur qui est le coin supérieur gauche ... 
    for y=1:m-2 % ... de la fenêtre 2x3
        if im1(x,y)==1 && im1(x+1,y+2)==1 %si on est dans la 1ère situation
            im1(x:x+1,y:y+2)=mask;
        end
        if im1(x+1,y)==1 && im1(x,y+2)==1 % si on est dans la 2ème situation
            im1(x:x+1,y:y+2)=mask;
        end
    end
end
end