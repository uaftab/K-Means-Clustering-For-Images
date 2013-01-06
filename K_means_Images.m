%% Umair Aftab 
%% behance.net/ua
%% github.com/umair-a
%% 09/11/12
%% K-Mean Clustering for Images 


clear all 
close all
clc



img=imread('rice.png');
n=5;
[row col]=size(img);
img2=img;
imgnew=zeros(row+((n-1)),col+((n-1)),'uint8');

[row_new col_new] = size(imgnew);

for i=1:row
   for j=1:col
      imgnew(i+((n-1)/2),j+((n-1)/2))=img(i,j);
   end
end

%Replicate
for i=1:((n-1)/2)
   imgnew(i,3:col_new-2)=img(1,:); 
end
for i=0:((n-1)/2)
   imgnew(row_new-i,3:col_new-2)=img(row,:); 
end
imgnew=transpose(imgnew);
img=transpose(img);
for i=1:((n-1)/2)
   imgnew(i,3:col_new-2)=img(1,:); 
end
for i=0:((n-1)/2)
   imgnew(row_new-i,3:col_new-2)=img(row,:); 
end
imgnew=transpose(imgnew);
img=transpose(img);

imgnew(1,1:2)=img(1,1);
imgnew(2,1:2)=img(1,1);
imgnew(row_new,(col_new-1):col_new)=img(row,col);
imgnew((row_new-1),(col_new-1):col_new)=img(row,col);
imgnew(1,(col_new-1):col_new)=img(1,col);
imgnew(2,(col_new-1):col_new)=img(1,col);
imgnew(row_new,1:2)=img(row,1);
imgnew((row_new-1),1:2)=img(row,1);

k=1;
x=((n-1)/2);

for i=1+x:row+x
    
   for j=1+x:col+x
       
      W=imgnew((i-x:i+x),(j-x:j+x));
      mean_W=mean(mean(W));
      stdd_W=sqrt(mean(mean((W-mean_W).^2)));
      thresh_W=mean_W+k*stdd_W;
      
      if( imgnew(i,j) >thresh_W)
          img2(i-x,j-x) =0;
      else
          img2(i-x,j-x) =1;
      end
       
   end
    
end

imshow(img2,[0 1])