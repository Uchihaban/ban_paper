function stage1=GraphTransformed(G)

%把G转换成G’ ,G的每一条边转换成一个3元数组，使用元胞数组e存储。
% G1=triu(G);
% G2=triu(G);
% G3=triu(G);%转换成上三角矩阵
% % 失效概率符合正态分布  
% pe=normrnd(0.01,0.003);
% % 正态分布的表示和画图
% x = 0:0.001:0.1;
% y = normpdf(x, 0.01, 0.003);
% plot(x,y);
% grid on;
G=waxtop(); 
canget(G);

%对于G1，遍历邻接矩阵，等于1时，即有边存在，把边上的权值转换成带宽

% G3=triu(G);
% x=unifrnd (5,150,20,20); %随机附上带宽，带宽满足（5,150）
% B0=30;
% s=(find(x<B0))' ;% 返回带宽小于B0=30的边具体位置
% x(s)=0 ;
% %将这些位置赋值为0，即删除这些边
% G3=G3.*x;
% e{3}=G3;%G3中存带宽
%将不满足条件的边删除，满足条件的边，变成双倍的，一条放在G1,另一条放在G2；
% G1(s)=0 ;
% G2(s)=0 ;
%元胞数组共有三组数据，G1存一条边，G2存另一条边，G3存边上的带宽。
% e{1}=G1;%G1中存一条边
% e{2}=G2;%G2中存一条边
%对于G1，把边上的权值转换成-ln(1-pe)

G1=triu(G);
% G1(s)=0 ;
y =normrnd(0.01,0.003,100,100);
G1=G1.*(-log10(ones(size(G1))-y));
e{1}=G1;
%对于G2，把边上的权值转换成无穷小

% G(s)=0;
G2=tril(G');
s1=(find(G2==1))';
G2(s1)=-inf;
e{2}=G2;
%G转换成稀疏矩阵
% tic
% G2(99,88)=0;
% G1(88,99)=0;
Bsparse=G1+G2;
canget(Bsparse);
B=sparse(Bsparse);

s2=(find(B~=0))';
length(s2);
%   view(biograph(B,[],'ShowArrows','off','ShowWeights','on')) ;%画出G'

B1=G1';
B=sparse(B1);
[ST1,pred] = graphminspantree(B,'Method','Prim');
[ST1,pred] = graphminspantree(B);
%     view(biograph(ST1,[],'ShowArrows','off','ShowWeights','on'));
ST1FULL=full(ST1);
ST1S=ST1FULL+ST1FULL';
%生成第一个生成树

y=(find(ST1S>0))';
B1(y)=0;
B2=sparse(B1);
[ST2,pred] = graphminspantree(B2,'Method','Prim');
[ST2,pred] = graphminspantree(B2);
%   view(biograph(ST2,[],'ShowArrows' ,'off','ShowWeights','on'));



ST2FULL=full(ST2);
 ST2FULL(37,7)=ST1FULL(37,7);%把T2中断掉的边连上
 ST2FULL(63,21)=ST1FULL(63,21);
 ST2FULL(98,94)=ST1FULL(98,94);
 ST2FULL(99,88)=ST1FULL(99,88);
 ST2FULL(100,90)=ST1FULL(100,90);
% view(biograph(ST2FULL,[],'ShowArrows','off','ShowWeights','on')) ;
%生成第二个生成树
ST2S=ST2FULL+ST2FULL';
toc;%计算算法运行时间
