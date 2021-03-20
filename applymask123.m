function im2=applymask123(im0)
im2=M3(M2(M1(im0))); %image à laquelle on applique tous les masques une fois
im1=im0; % image d'origine
while sum(sum(im2-im1))~=0 %tant que la différence entre 2 itérations est non nulle
    im2=M3(M2(M1(im2))); %on applique de nouveau les masques ...
    im1=M3(M2(M1(im1))); % ... aux 2
end
end

    
