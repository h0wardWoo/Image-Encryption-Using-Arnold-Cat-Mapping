function [outImg]=arnold(inImg,key)  %arnold加密函数，inImg为输入图像，key为密钥。
%key=[Times,a,b,c,d];    %定义密钥元素含义
[j,k]=size(inImg);    %获取输入图像的大小
outImg=uint8(zeros(j,k));    %初始化输出图像
tempImg=inImg;           %定义中间变量
for i=1:key(1)                            %执行变换的次数
    for u=1:j                               %对各像素坐标遍历变换
        for v=1:k                           %对各像素坐标遍历变换
            temp=tempImg(u,v);     %获取坐标(u,v)处的像素值
            ax=mod((key(2)*(u-1)+key(3)*(v-1)),k)+1;
            ay=mod((key(4)*(u-1)+key(5)*(v-1)),k)+1;
            outImg(ax,ay)=temp;  %在新的坐标中赋上原来的像素值
        end
    end
    tempImg=outImg;
end
outImg=tempImg;            %输出图像