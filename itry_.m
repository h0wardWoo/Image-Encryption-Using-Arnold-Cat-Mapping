b=imread('itest.bmp');                         %取加密后的图像
aR=b(:,:,1);                                           %取图像R层的像素
aG=b(:,:,2);                                          %取图像R层的像素
aB=b(:,:,3);                                           %取图像R层的像素
subplot(2,2,1);imshow(b);title('original');
keyR=[5,5,2,7,3];keyG=[3,1,1,2,1];keyB=[6,3,2,4,3];%由加密方提供的密钥
iaR=iarnold(aR,keyR);iaG=iarnold(aG,keyG);iaB=iarnold(aB,keyB);%对各层进行解密
subplot(2,2,2);imshow(iaR);title('iaR');
subplot(2,2,3);imshow(iaG);title('iaG');
subplot(2,2,4);imshow(iaB);title('iaB');
iaa=cat(3,iaR,iaG,iaB);                              %将RGB三层捏合成彩色图像
figure; imshow(iaa); title(' Decrypted');      %显示解密后的图像