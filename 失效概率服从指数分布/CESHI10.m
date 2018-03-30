%随机选择一条边出故障


%%%%1、故障边是T1 T2的非共有边

T1FULL=ST1FULL; %只有下三角
T2FULL=ST2FULL;

%T1和T2 是tree1 和tree2 的边集
T1FULL(10,6)=0; %边属于T1,不属于T2
view(biograph(T1FULL,[],'ShowArrows','off','ShowWeights','on')) ;

tic
T1=T1FULL+T1FULL'; 
T2=T2FULL+T2FULL'; 
%找出点集v1和v2
j=1;
for i=1:10
    if T1(6,i)>0 
        v1(j)=i;
        j=j+1;
        for k=1:10
            if T1(i,k)>0
            v1(j)=k;
            j=j+1;
            end
        end
    end
end
v1=unique(v1);    %v1为去除v1中重复的元素
v=(1:10);
v2=setdiff(v,v1); %v1的补集

E=B;%网络图G的边集E
E(10,6)=0;%     把网络图G中的故障边e去除
% view(biograph(E,[],'ShowArrows','off','ShowWeights','on'));
% Eexistheiw为辅助位置的矩阵,Eexist为v1和v2之间还存在的边的集合
E=E+E';
Eexist=full(E);
Eexisthei=Eexist;
%检测v1中的点到v2中的点，之间是否有连接的边，存在则存入E1
for i=1:length(v1)
    for j=1:length(v2)
        if  Eexist(v1(i),v2(j))>0
            Eexisthei(v1(i),v2(j))=1;
            Eexisthei(v2(j),v1(i))=1;
        end
    end
end
%iEexisthei为v1和v2之间还存在的边的位置
iEexisthei=find(Eexisthei~=1);
Eexist(iEexisthei)=0;
%将Eexist中属于T2的边剔除,称为Eexist1;
iT2=find(T2>0);
Eexist1=Eexist;
Eexist1(iT2)=0;
iEexist1=find(Eexist1>0);
if  iEexist1~=0
    T1S=T1+Eexist1;
    T1replace=triu(T1S);
%     view(biograph(T1replace,[],'ShowArrows','off','ShowWeights','on'));
else
    %将Eexist中属于T2，称为Eexist2;
    Eexist2=Eexist;
    iEexist1=find(Eexist1>0);
    Eexist2(iEexist1)=0;
    T1S=T1+Eexist2;
    T1replace=triu(T1S);
%  view(biograph(T1replace,[],'ShowArrows','off','ShowWeights','on'));
end
toc;
--------------------------------------------------------------------------
%%%%2、故障边是T1 T2的共有边

T1FULL=ST1FULL; %只有下三角
T2FULL=ST2FULL;

T1FULL(10,9)=0; %边属于T1,T1FULL为tree1断边后的邻接下三角矩阵
 view(biograph(T1FULL,[],'ShowArrows','off','ShowWeights','on')) ;
T2FULL(10,9)=0; %边属于T2,T2FULL为tree2断边后的邻接下三角矩阵
 view(biograph(T2FULL,[],'ShowArrows','off','ShowWeights','on')) ;

T1=T1FULL+T1FULL'; 
T2=T2FULL+T2FULL';
%对T1找出点集T1v1和T1v2
tic
j1=1;
for i1=1:10
    if T1(i1,9)>0 
        T1v1(j1)=i1;
        j1=j1+1;
        for k1=1:10
            if T1(i1,k1)>0
            T1v1(j1)=k1;
            j1=j1+1;
            end
        end
    end
end
T1v1=unique(T1v1);  %T1v1为去除v1中重复的元素
T1v1=(9);
v=(1:10);
T1v2=setdiff(v,T1v1); %T1v1的补集

%对T2找出点集T2v1和T2v2
j2=1;
for i2=1:10
    if  T2(i2,10)>0 
        T2v1(j2)=i2;
        j2=j2+1;
        for k2=1:10
            if  T2(i2,k2)>0
            T2v1(j2)=k2;
            j2=j2+1;
            end
        end
    end
end
T2v1=unique(T2v1);    %去除T2v1中重复的元素
v=(1:10);
T2v2=setdiff(v,T2v1); %T2v1的补集

E=B;%网络图G的边集E
E(10,9)=0;%     把网络图G中的故障边e去除
% view(biograph(E,[],'ShowArrows','off','ShowWeights','on'));
E=E+E';

%对T1找T1v1和T1v2之间还存在的边的集合T1Eexist
% T1Eexisthei为辅助位置的矩阵,T1Eexist为T1v1和T1v2之间还存在的边的集合
T1Eexist=full(E);
T1Eexisthei=T1Eexist;
%检测T1v1中的点到T1v2中的点，之间是否有连接的边，存在则存入T1Eexist
for i=1:length(T1v1)
    for j=1:length(T1v2)
        if  T1Eexist(T1v1(i),T1v2(j))>0
            T1Eexisthei(T1v1(i),T1v2(j))=1;
            T1Eexisthei(T1v2(j),T1v1(i))=1;
        end
    end
end
%iT1Eexisthei为T1v1和T1v2之间还存在的边的位置
iT1Eexisthei= T1Eexisthei~=1;
T1Eexist(iT1Eexisthei)=0;
%对T1找T1v1和T1v2之间还存在的边的集合T1Eexist
% T2Eexisthei为辅助位置的矩阵,T2Eexist为T2v1和T2v2之间还存在的边的集合
T2Eexist=full(E);
T2Eexisthei=T2Eexist;
%检测T2v1中的点到T2v2中的点，之间是否有连接的边，存在则存入T2Eexist
for i=1:length(T2v1)
    for j=1:length(T2v2)
        if  T2Eexist(T2v1(i),T2v2(j))>0
            T2Eexisthei(T2v1(i),T2v2(j))=1;
            T2Eexisthei(T2v2(j),T2v1(i))=1;
        end
    end
end
%iT2Eexisthei为T2v1和T2v2之间还存在的边的位置
iT2Eexisthei=find(T2Eexisthei~=1);
T2Eexist(iT2Eexisthei)=0;


%T1Eexist和T2Eexist之间是否有交集
iT1Eexist=find(T1Eexist>0);
iT2Eexist=find(T2Eexist>0);
iTEexist=intersect(iT1Eexist,iT2Eexist);
if  isempty(iTEexist)%若无交集
     %取T1Eexist中失效概率最小的边带入T1
     minT1Eexist=min(T1Eexist(T1Eexist~=0));
     [T1x,T1y]=find(T1Eexist==minT1Eexist);
     T1S=T1;
     T1S(T1x,T1y)=minT1Eexist;
     T1S(T1y,T1x)=minT1Eexist;
     T1replace=triu(T1S);
%    view(biograph(T1replace,[],'ShowArrows','off','ShowWeights','on'));
     %取T2Eexist中失效概率最小的边带入T2；
     minT2Eexist=min(T2Eexist(T2Eexist~=0));
     [T2x,T2y]=find(T2Eexist==minT2Eexist);
     T2S=T2;
     T2S(T2x,T2y)=minT2Eexist;
     T2S(T2y,T2x)=minT2Eexist;
     T2replace=triu(T2S);
%    view(biograph(T2replace,[],'ShowArrows','off','ShowWeights','on'));

else%若有交集
   %取T1Eexist和T2Eexist的交集中失效概率最小的边带入T1和T2，得到T1’,T2’
     iTEexists=intersect(iT1Eexist,iT2Eexist);
     [Tx,Ty]=find(T1Eexist==min(T1Eexist(iTEexists)));
     T1S=T1;
     T1S(Tx,Ty)=min(T1Eexist(iTEexists));
     T1S(Ty,Tx)=min(T1Eexist(iTEexists));
     T1replace=triu(T1S);
%      view(biograph(T1replace,[],'ShowArrows','off','ShowWeights','on'));
     T2S=T2;
     T2S(Tx,Ty)=min(T1Eexist(iTEexists));
     T2S(Ty,Tx)=min(T1Eexist(iTEexists));
     T2replace=triu(T2S);
%    view(biograph(T2replace,[],'ShowArrows','off','ShowWeights','on'));
end
toc;

