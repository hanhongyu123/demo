clc
clear
close all

load normal.mat
load test.mat
x=x;

[x_row,x_col]=size(x);
for i=1:x_col
    x_mean(:,i)= ( x(:, i)-mean(x(:, i))) / std( x(:, i) + 1e-8);
end
%% （1）讨论数据集中变量的线性相关性。
% 因为第66、67、68个特征值为0，所以66、67、68列具有线性相关，1-65列线性无关
[vector, ~, value, ~] = pca(x_mean);

k = 0; 
while sum(value(1 : k)) / sum(value) < 0.85 
    k = k + 1; 
end

%% （2）计算数据集中的主成分。
% PC为该数据集的主成分。
PC=vector(:,1:k);
t_scores=x_mean* PC;

%% (3)讨论数据集中数据分类情况
% 如图所示，图中，蓝色部分代表normal原始数据,该原始数据分为5类，为定距数据
% 而其中5大类中的每一类也存在定距数据
% 黑色部分代表降维之后的数据

%% (4)判别test.mat中5个样本数据的类别
% 红色部分代表text数据，每个样本也是定距数据
figure
plot(x,'b.');
hold on
plot(t_scores,'k.');
hold on
plot(y,'r*');

 