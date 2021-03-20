function [xlignes]=lignes_representatives(im0,L)
[n,~]=size(L);
xlignes=[];
for i=1:n
    crds=L(i,:);
    x=crds(1,1);
    fin_x=crds(1,2);
    y=crds(1,3);
    fin_y=crds(1,4);
    im=im0(x:fin_x,y:fin_y); %l'image restreinte à la zone considérée
    vals=[]; % liste des nombres de pixels valant 255
    for xk=1:(fin_x-x+1)
        val=sum(im(xk,:)==255);
        vals=[vals val];
    end
    [~,ind]=maxk(vals,1); % indice de la ligne ayant le max de pixels à 255
    xf=x+ind-1; % sa position sur l'axe des x
    xlignes=[xlignes xf];
end
end