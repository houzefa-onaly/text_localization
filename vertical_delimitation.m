function [liste]=vertical_delimitation(im0,L,xlignes)
[~,m]=size(im0);
[n,~]=size(L);
liste=[];
for i=1:n
    xr=xlignes(i);
    crds=L(i,:);
    x=crds(1,1);
    fin_x=crds(1,2);
    y=crds(1,3);
    fin_y=crds(1,4);
    while y-1>=0 && im0(xr,y-1)==255 
        y=y-1;
    end
    while fin_y+1<=m && im0(xr,fin_y+1)==255
        fin_y=fin_y+1;
    end
    liste=[liste;[x fin_x y fin_y]];
end
end