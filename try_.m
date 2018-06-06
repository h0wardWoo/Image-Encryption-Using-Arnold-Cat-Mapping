a=imread('test.jpg');         %取预输入图像
R=a(:,:,1);                           %取图像的R层像素
G=a(:,:,2);                           %取图像的G层像素
B=a(:,:,3);                            %取图像的B层像素
keyR=[5,5,2,7,3];keyG=[3,1,1,2,1];keyB=[6,3,2,4,3];       %分别为RGB三层设置不同密钥
aR=arnold(R,keyR);aG=arnold(G,keyG);aB=arnold(B,keyB);%对各层用不同的密钥加密
figure;
subplot(2,2,1);imshow(aR);title('aR');%加密后的图像
subplot(2,2,2);imshow(aG);title('aG');
subplot(2,2,3);imshow(aB);title('aB');
aa=cat(3,aR,aG,aB);                                       %将各层捏合成彩色图像
subplot(2,2,4); imshow(aa); title(' Permuted');%RGB图像加密后的图像
imwrite(aa,'itest.bmp'); 