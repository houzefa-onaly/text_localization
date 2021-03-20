clear all;
close all;

% I - Digital image transformation

X = imread('9000.jpg');
I=rgb2gray(X); %conversion to gray level

[r,c]=size(I); %size of image

% II- Enhancement of text region patterns

J = imresize(I, 0.125,'nearest'); %multi resolution

BW=im2bw(J,0.7); %#ok<IM2BW> %binarisation

% 1-Negative form elimination

BW=M4(BW);

BW=bwmorph(BW,'clean'); %mask M5 (cf. help matlab)

% Potential text regions localization


BW=applymask123(BW); %apply masks M1, M2 and M3 until no change

BW=imresize(BW, [r,c], 'nearest'); %resize to origin size

coord=detect_rectangles(BW); %coordinates of all white rectangles

[I1,u]=back_pixels_separation(I); %apply background pixels separation


% Effective text localisation

coord_eff=effective_text_region(I1,coord); %effective coordinates of text regions

xlignes=lignes_representatives(I1,coord_eff); %representative lines

new_coords_v=vertical_delimitation(I1,coord_eff,xlignes); %vertical delimitation

new_coords_h=horizontal_delimitation(I1,new_coords_v,xlignes); %horizontal delimitation

I2=visualisation(X,new_coords_h); %visualise the result
figure(1)
imshow(X)
pause(1)
imshow(I2)


