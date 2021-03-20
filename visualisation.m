function im1=visualisation(im0,L)
% cette fonction prend en entrée l'image et les coordonnées 
% des différentes zones effectives
[n,~]=size(L);
im1=im0;
for i=1:n % pour chaque zone effective
    crds=L(i,:);
    x=crds(1,1);
    fin_x=crds(1,2);
    y=crds(1,3);
    fin_y=crds(1,4);
    im1(x,y:fin_y)=255*ones(1,fin_y-y+1); % tracé des contours en rouge
    im1(fin_x,y:fin_y)=255*ones(1,fin_y-y+1);
    im1(x:fin_x,y)=255*ones(fin_x-x+1,1);
    im1(x:fin_x,fin_y)=255*ones(fin_x-x+1,1);
end
end

