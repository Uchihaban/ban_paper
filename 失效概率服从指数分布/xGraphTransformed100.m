%��Gת����G�� ,G��ÿһ����ת����һ��3Ԫ���飬ʹ��Ԫ������e�洢��
% G1=triu(G);
% G2=triu(G);
% G3=triu(G);%ת���������Ǿ���
% ʧЧ���ʷ�����̬�ֲ�  
% pe=normrnd(0.01,0.003);
% ��̬�ֲ��ı�ʾ�ͻ�ͼ
%  x = 0:0.001:0.1;
%  y = normpdf(x, 0.01, 0.003);
%  plot(x,y);
% grid on;
%  x = 0:0.001:0.1;
%  y = normpdf(x, 0.01, 0.001);
%  plot(x,y);
y =exprnd(0.01,10,10);
plot(y);




G=Powerlaw(); 
canget(G);
%����G1�������ڽӾ��󣬵���1ʱ�����бߴ��ڣ��ѱ��ϵ�Ȩֵת���ɴ���

G3=triu(G);
x=unifrnd (5,150,100,100); %������ϴ����������㣨5,150��
B0=30;
s=(find(x<B0))' ;% ���ش���С��B0=30�ı߾���λ��
x(s)=0 ;
%����Щλ�ø�ֵΪ0����ɾ����Щ��
G3=G3.*x;
e{3}=G3;%G3�д����
%�������������ı�ɾ�������������ıߣ����˫���ģ�һ������G1,��һ������G2��
% G1(s)=0 ;
% G2(s)=0 ;
%Ԫ�����鹲���������ݣ�G1��һ���ߣ�G2����һ���ߣ�G3����ϵĴ���
% e{1}=G1;%G1�д�һ����
% e{2}=G2;%G2�д�һ����
%����G1���ѱ��ϵ�Ȩֵת����-ln(1-pe)

G1=triu(G);
G1(s)=0 ;
y =exprnd(0.01,100,100);
G1=G1.*(-log10(ones(size(G1))-y));
e{1}=G1;
%����G2���ѱ��ϵ�Ȩֵת��������С

G(s)=0;
G2=tril(G');
s1=(find(G2==1))';
G2(s1)=-inf;
e{2}=G2;
%Gת����ϡ�����
tic
G2(50,38)=0;
G1(38,50)=0;
% G2(10,7)=0;
% G1(7,10)=0;
Bsparse=G1+G2;
canget(Bsparse);
B=sparse(Bsparse);

s2=(find(B~=0))';
length(s2);
%    view(biograph(B,[],'ShowArrows','off','ShowWeights','on')) ;%����G'

B1=G1';
B=sparse(B1);
[ST1,pred] = graphminspantree(B,'Method','Prim');
[ST1,pred] = graphminspantree(B);
%   view(biograph(ST1,[],'ShowArrows','off','ShowWeights','on'));
ST1FULL=full(ST1);
ST1S=ST1FULL+ST1FULL';
%���ɵ�һ��������

y=(find(ST1S>0))';
B1(y)=0;
B2=sparse(B1);
[ST2,pred] = graphminspantree(B2,'Method','Prim');
[ST2,pred] = graphminspantree(B2);
%   view(biograph(ST2,[],'ShowArrows' ,'off','ShowWeights','on'));



ST2FULL=full(ST2);
%��T2�жϵ��ı�����
 
ST2FULL(62,1)=ST1FULL(62,1);
ST2FULL(94,2)=ST1FULL(94,2);
ST2FULL(62,3)=ST1FULL(62,3);
ST2FULL(99,4)=ST1FULL(99,4);
ST2FULL(86,5)=ST1FULL(86,5);
ST2FULL(69,6)=ST1FULL(69,6);
ST2FULL(100,8)=ST1FULL(100,8);
ST2FULL(98,9)=ST1FULL(98,9);
ST2FULL(89,10)=ST1FULL(89,10);
ST2FULL(95,11)=ST1FULL(95,11);
ST2FULL(100,12)=ST1FULL(100,12);
ST2FULL(96,13)=ST1FULL(96,13);
ST2FULL(92,14)=ST1FULL(92,14);
ST2FULL(72,15)=ST1FULL(72,15);
ST2FULL(92,16)=ST1FULL(92,16);
ST2FULL(60,17)=ST1FULL(60,17);
ST2FULL(98,18)=ST1FULL(98,18);
ST2FULL(98,22)=ST1FULL(98,22);
ST2FULL(40,23)=ST1FULL(40,23);
ST2FULL(99,26)=ST1FULL(99,26);
ST2FULL(32,28)=ST1FULL(32,28);
ST2FULL(97,29)=ST1FULL(97,29);
ST2FULL(87,30)=ST1FULL(87,30);
ST2FULL(96,37)=ST1FULL(96,37);
ST2FULL(50,38)=ST1FULL(50,38);
ST2FULL(88,40)=ST1FULL(88,40);
% ST2FULL(10,6)=B(10,6);
%  view(biograph(ST2FULL,[],'ShowArrows','off','ShowWeights','on')) ;
%���ɵڶ���������
ST2S=ST2FULL+ST2FULL';
toc;%�����㷨����ʱ��
