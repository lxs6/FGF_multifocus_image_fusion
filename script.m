%   2019 IEEE Access paper code for gray/color source images 
%   Authors: Zhou Fuqiang, Li Xiaosong et al.   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  If you use the code, please cite the paper as follows:
%         Fuqiang Zhou, Xiaosong Li, Juan Li, Rui Wang, Haishu Tan. Multifocus Image Fusion Based on Fast Guided Filter and 
%         Focus Pixels Detection [J]. IEEE Access, 2019, 07, 50980-50796.
% Beihang university, Last update:18-03-2019
%%
clear all; close all; clc;
addpath functions;
ima1=imread('source_01.tif');  ima2=imread('source_02.tif');     % input source images
figure;imshow(ima1); figure;imshow(ima2);
A=double(ima1); B=double(ima2);
tic
%% image fusion
if size(A,3)==1    %for gray images
      F = main_fusion(A, B);     
else               %for color images 
    F=zeros(size(A));
    for i=1:3
      F(:,:,i) = main_fusion(A(:,:,i), B(:,:,i));       
    end
end
toc

figure, imshow(uint8(F)); title('fused result')
imwrite(uint8(F),'fused results\result.tif');    


