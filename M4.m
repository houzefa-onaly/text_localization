function im1=M4(im0)
im1=im0;
[n,m]=size(im0);
%on définit le seuil de longueur lt
if 0.75*m-ceil(0.75*m)==0
    lt=ceil(0.75*m)+1;
else
    lt=ceil(0.75*m);
end
for x=1:n
    for deb_y=1:(m-lt+1)
        for fin_y=deb_y+lt-1:m
            if im1(x,deb_y)==1 && im1(x,fin_y)==1
                im1(x,deb_y:fin_y)=zeros(1,fin_y-deb_y+1);
            end
        end
    end
end
end

        