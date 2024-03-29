% 矩阵为matlab的基本变量类型
% 一位数组即，一行的矩阵，也称作标量
%  本文件为普通脚本遵照固定格式，先清空工作区，后运行脚本命令
clear;
%% 矩阵的创建
A = [1 2 3 4;5 6 7 8;9 10 11 12];
%分号分割每一行
X = zeros(5); %5x5全零矩阵
X = zeros(3,4);%3x4全零矩阵
X = zeros([3 4]);%3x4全零阵
X = zeros(size(A));%生成与矩阵A相同大小的全零阵
X = ones(5);
X = ones(3,4);%与全零阵相似，ones代表生成全一阵
X = eye(5);%与全零阵相似，eye代表生成单位阵
%生成对角阵
Y = blkdiag(1,2,3,4,5,6,7,8,9,10);%括号中用逗号区分对角的元素
v =[1 2 3 4 5 6 7 8 9 10];
Z = diag(v);%以向量v作为对角元素
Z = diag(v,1);%以向量v作为对角元素，并对矩阵上移1位
%    0     1     0     0     0     0     0     0     0     0     0
%    0     0     2     0     0     0     0     0     0     0     0
%    0     0     0     3     0     0     0     0     0     0     0
%    0     0     0     0     4     0     0     0     0     0     0
%    0     0     0     0     0     5     0     0     0     0     0
%    0     0     0     0     0     0     6     0     0     0     0
%    0     0     0     0     0     0     0     7     0     0     0
%    0     0     0     0     0     0     0     0     8     0     0
%    0     0     0     0     0     0     0     0     0     9     0
%    0     0     0     0     0     0     0     0     0     0    10
%    0     0     0     0     0     0     0     0     0     0     0
Z = diag(v,-1);%以向量v作为对角元素，并对矩阵下移1位
%    0     0     0     0     0     0     0     0     0     0     0
%    1     0     0     0     0     0     0     0     0     0     0
%    0     2     0     0     0     0     0     0     0     0     0
%    0     0     3     0     0     0     0     0     0     0     0
%    0     0     0     4     0     0     0     0     0     0     0
%    0     0     0     0     5     0     0     0     0     0     0
%    0     0     0     0     0     6     0     0     0     0     0
%    0     0     0     0     0     0     7     0     0     0     0
%    0     0     0     0     0     0     0     8     0     0     0
%    0     0     0     0     0     0     0     0     9     0     0
%    0     0     0     0     0     0     0     0     0    10     0
M = magic(3);%产生魔方矩阵
%M =
%    8     1     6
%    3     5     7
%    4     9     2
%% 矩阵的元素操作
A(1,:);%提取A中第一行
A(:,2);%提取A中第二列
A(:);%提取A中每一列并整合成列向量
A(1:2,3:4);%提取A中1到2行，3到4列的子矩阵
%A(4:-1:2,:);
%A(:,3:-1:2);%索引超出矩阵维度。
B = A;
A(:,3:4)=[];%删除3到4列，构成新的矩阵
[A B];%连接矩阵，横向
A = B;
A(1:2,:)=[];%删除1到2行，构成新矩阵
[A;B];%连接矩阵，纵向
s = size(A);
[m,n] = size(A);
%返回一个行向量（矩阵行数，矩阵列数）
%% 元素赋值与矩阵的扩展
B(2,3) =10;%将矩阵中对应位置元素赋值
B(5,5) = 10;%元素超出矩阵范围时，扩展矩阵并将对应位置元素赋值，其余位置用0补充
%% 矩阵的排列
% 矩阵再存储时，默认案列存储
B (3);
B (3,1);
B (7);
B (2,2);
% 这两种表达方式表达的是同样的元素
% 当向量的元素个数能够表示成m x n的形式时可以使用重拍函数
C = reshape(v,2,5);
% 复制
C = repmat(v,3,1)
C = repmat(v,6,2)
% 稀疏矩阵
S = sparse(B); %将B的非零元素按列排成向量，并记录其位置
full(S);%将稀疏矩阵转化回原矩阵
nnz(S);%稀疏矩阵中元素的个数
[i,j,r] = find(B);%查找非零数所在的行数i、列数j、及其对应的值r