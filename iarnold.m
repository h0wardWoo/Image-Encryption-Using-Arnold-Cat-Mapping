function [outImg]=iarnold(inImg,key)       %解密函数，inImg为已加密图像，key为密钥
%key=[Times,a,b,c,d];  %定义密钥元素含义
ik=round(inv([key(2),key(3);key(4),key(5)]));%转换为逆矩阵并取整
ikey(2)=ik(1,1);ikey(3)=ik(1,2);ikey(4)=ik(2,1);ikey(5)=ik(2,2);
[j,k]=size(inImg);  %获取输入图像的大小
outImg=uint8(zeros(j,k));   %初始化输出图像
tempImg=inImg;  %定义中间变量
for i=1:key(1)  %执行变换的次数
    for u=1:j   %对各像素坐标遍历变换
        for v=1:k  %对各像素坐标遍历变换
            temp=tempImg(u,v);  %获取坐标(u,v)处的像素值
            ax=mod((ikey(2)*(u-1)+ikey(3)*(v-1)),k)+1;
            ay=mod((ikey(4)*(u-1)+ikey(5)*(v-1)),k)+1;
            outImg(ax,ay)=temp;  %在新的坐标中赋上原来的像素值
        end
    end
    tempImg=outImg;
end
outImg=tempImg;  %输出图像