function [liste]=horizontal_delimitation(im0,L,xlignes)
[n,~]=size(L);
liste=[];
for i=1:n
    crds=L(i,:);
    y=crds(1,3);
    fin_y=crds(1,4);
    xh=xlignes(i);
    xb=xlignes(i);
    imch=im0(xh,y:fin_y);
    imcb=im0(xb,y:fin_y);
    imh=im0(xh-1,y:fin_y);
    imb=im0(xb+1,y:fin_y);
    posch=find(imch==255);
    poscb=find(imcb==255);
    posh=find(imh==255);
    posb=find(imb==255);
    Ch=intersect(posch,posh);
    Cb=intersect(poscb,posb);
    while length(Ch)~=0
       xh=xh-1;
       imch=im0(xh,y:fin_y);
       imh=im0(xh-1,y:fin_y);
       posch=find(imch==255);
       posh=find(imh==255);
       Ch=intersect(poscb,posh);
    end
    while length(Cb)~=0
        xb=xb+1;
        imcb=im0(xb,y:fin_y);
        imb=im0(xb+1,y:fin_y);
        poscb=find(imcb==255);
        posb=find(imb==255);
        Cb=intersect(poscb,posb);
    end
    liste=[liste;[xh xb y fin_y]];
end
end

   