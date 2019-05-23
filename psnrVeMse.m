 resim=imread('C:\Users\ben burak\Desktop\uws0150 (2).JPG');
 griResim=rgb2gray(resim);
 J = histeq(griResim);

 
% int64 kullanmamýzýn sebebi resimler uint8 veri tipinde olduðundan max 255
% deðerini alabiliyorlar biz daha büyük sayýlarla oynuyacaðýmýzdan bu
% dönüþüm yapýldý

% Ayrýca sonuc deðeri double'a cast edildi aksi halde en yakýn tam sayýya
% yuvarlama yapýyordu ve doðru sonuç üretmiyordu.
 

% % % % % % % % % % % MSE DEÐERÝ HESAPLAMA % % % % % % % % % % 
sonuc=0;
for i=1:size(resim,1)
    for j=1:size(resim,2)
        temp=int64(J(i,j))-int64(griResim(i,j));
        temp=temp*temp;
        sonuc=sonuc+temp;
        
    end
end

fprintf('Sonuc degeri: %d\n',sonuc);

boyut=size(resim,1)*size(resim,2);

dSonuc=cast(sonuc,'double');
mse=dSonuc/boyut;

fprintf('MSE degeri: %f\n',mse);


% % % % % % % % % % PSNR DEÐERÝ HESAPLAMA % % % % % % % % % %     

maxDeger=255;

maxDeger=maxDeger*maxDeger;
tut=maxDeger/mse;

psnr=10*log10(tut);

fprintf('PSNR degeri: %f\n',psnr);






