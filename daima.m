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
%% ��1���������ݼ��б�������������ԡ�
% ��Ϊ��66��67��68������ֵΪ0������66��67��68�о���������أ�1-65�������޹�
[vector, ~, value, ~] = pca(x_mean);

k = 0; 
while sum(value(1 : k)) / sum(value) < 0.85 
    k = k + 1; 
end

%% ��2���������ݼ��е����ɷ֡�
% PCΪ�����ݼ������ɷ֡�
PC=vector(:,1:k);
t_scores=x_mean* PC;

%% (3)�������ݼ������ݷ������
% ��ͼ��ʾ��ͼ�У���ɫ���ִ���normalԭʼ����,��ԭʼ���ݷ�Ϊ5�࣬Ϊ��������
% ������5�����е�ÿһ��Ҳ���ڶ�������
% ��ɫ���ִ���ά֮�������

%% (4)�б�test.mat��5���������ݵ����
% ��ɫ���ִ���text���ݣ�ÿ������Ҳ�Ƕ�������
figure
plot(x,'b.');
hold on
plot(t_scores,'k.');
hold on
plot(y,'r*');

 