%���ѡ��һ���߳�����


%%%%1�����ϱ���T1 T2�ķǹ��б�

T1FULL=ST1FULL; %ֻ��������
T2FULL=ST2FULL;

%T1��T2 ��tree1 ��tree2 �ı߼�
T1FULL(10,6)=0; %������T1,������T2
view(biograph(T1FULL,[],'ShowArrows','off','ShowWeights','on')) ;

tic
T1=T1FULL+T1FULL'; 
T2=T2FULL+T2FULL'; 
%�ҳ��㼯v1��v2
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
v1=unique(v1);    %v1Ϊȥ��v1���ظ���Ԫ��
v=(1:10);
v2=setdiff(v,v1); %v1�Ĳ���

E=B;%����ͼG�ı߼�E
E(10,6)=0;%     ������ͼG�еĹ��ϱ�eȥ��
% view(biograph(E,[],'ShowArrows','off','ShowWeights','on'));
% EexistheiwΪ����λ�õľ���,EexistΪv1��v2֮�仹���ڵıߵļ���
E=E+E';
Eexist=full(E);
Eexisthei=Eexist;
%���v1�еĵ㵽v2�еĵ㣬֮���Ƿ������ӵıߣ����������E1
for i=1:length(v1)
    for j=1:length(v2)
        if  Eexist(v1(i),v2(j))>0
            Eexisthei(v1(i),v2(j))=1;
            Eexisthei(v2(j),v1(i))=1;
        end
    end
end
%iEexistheiΪv1��v2֮�仹���ڵıߵ�λ��
iEexisthei=find(Eexisthei~=1);
Eexist(iEexisthei)=0;
%��Eexist������T2�ı��޳�,��ΪEexist1;
iT2=find(T2>0);
Eexist1=Eexist;
Eexist1(iT2)=0;
iEexist1=find(Eexist1>0);
if  iEexist1~=0
    T1S=T1+Eexist1;
    T1replace=triu(T1S);
%     view(biograph(T1replace,[],'ShowArrows','off','ShowWeights','on'));
else
    %��Eexist������T2����ΪEexist2;
    Eexist2=Eexist;
    iEexist1=find(Eexist1>0);
    Eexist2(iEexist1)=0;
    T1S=T1+Eexist2;
    T1replace=triu(T1S);
%  view(biograph(T1replace,[],'ShowArrows','off','ShowWeights','on'));
end
toc;
--------------------------------------------------------------------------
%%%%2�����ϱ���T1 T2�Ĺ��б�

T1FULL=ST1FULL; %ֻ��������
T2FULL=ST2FULL;

T1FULL(10,9)=0; %������T1,T1FULLΪtree1�ϱߺ���ڽ������Ǿ���
 view(biograph(T1FULL,[],'ShowArrows','off','ShowWeights','on')) ;
T2FULL(10,9)=0; %������T2,T2FULLΪtree2�ϱߺ���ڽ������Ǿ���
 view(biograph(T2FULL,[],'ShowArrows','off','ShowWeights','on')) ;

T1=T1FULL+T1FULL'; 
T2=T2FULL+T2FULL';
%��T1�ҳ��㼯T1v1��T1v2
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
T1v1=unique(T1v1);  %T1v1Ϊȥ��v1���ظ���Ԫ��
T1v1=(9);
v=(1:10);
T1v2=setdiff(v,T1v1); %T1v1�Ĳ���

%��T2�ҳ��㼯T2v1��T2v2
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
T2v1=unique(T2v1);    %ȥ��T2v1���ظ���Ԫ��
v=(1:10);
T2v2=setdiff(v,T2v1); %T2v1�Ĳ���

E=B;%����ͼG�ı߼�E
E(10,9)=0;%     ������ͼG�еĹ��ϱ�eȥ��
% view(biograph(E,[],'ShowArrows','off','ShowWeights','on'));
E=E+E';

%��T1��T1v1��T1v2֮�仹���ڵıߵļ���T1Eexist
% T1EexistheiΪ����λ�õľ���,T1EexistΪT1v1��T1v2֮�仹���ڵıߵļ���
T1Eexist=full(E);
T1Eexisthei=T1Eexist;
%���T1v1�еĵ㵽T1v2�еĵ㣬֮���Ƿ������ӵıߣ����������T1Eexist
for i=1:length(T1v1)
    for j=1:length(T1v2)
        if  T1Eexist(T1v1(i),T1v2(j))>0
            T1Eexisthei(T1v1(i),T1v2(j))=1;
            T1Eexisthei(T1v2(j),T1v1(i))=1;
        end
    end
end
%iT1EexistheiΪT1v1��T1v2֮�仹���ڵıߵ�λ��
iT1Eexisthei= T1Eexisthei~=1;
T1Eexist(iT1Eexisthei)=0;
%��T1��T1v1��T1v2֮�仹���ڵıߵļ���T1Eexist
% T2EexistheiΪ����λ�õľ���,T2EexistΪT2v1��T2v2֮�仹���ڵıߵļ���
T2Eexist=full(E);
T2Eexisthei=T2Eexist;
%���T2v1�еĵ㵽T2v2�еĵ㣬֮���Ƿ������ӵıߣ����������T2Eexist
for i=1:length(T2v1)
    for j=1:length(T2v2)
        if  T2Eexist(T2v1(i),T2v2(j))>0
            T2Eexisthei(T2v1(i),T2v2(j))=1;
            T2Eexisthei(T2v2(j),T2v1(i))=1;
        end
    end
end
%iT2EexistheiΪT2v1��T2v2֮�仹���ڵıߵ�λ��
iT2Eexisthei=find(T2Eexisthei~=1);
T2Eexist(iT2Eexisthei)=0;


%T1Eexist��T2Eexist֮���Ƿ��н���
iT1Eexist=find(T1Eexist>0);
iT2Eexist=find(T2Eexist>0);
iTEexist=intersect(iT1Eexist,iT2Eexist);
if  isempty(iTEexist)%���޽���
     %ȡT1Eexist��ʧЧ������С�ıߴ���T1
     minT1Eexist=min(T1Eexist(T1Eexist~=0));
     [T1x,T1y]=find(T1Eexist==minT1Eexist);
     T1S=T1;
     T1S(T1x,T1y)=minT1Eexist;
     T1S(T1y,T1x)=minT1Eexist;
     T1replace=triu(T1S);
%    view(biograph(T1replace,[],'ShowArrows','off','ShowWeights','on'));
     %ȡT2Eexist��ʧЧ������С�ıߴ���T2��
     minT2Eexist=min(T2Eexist(T2Eexist~=0));
     [T2x,T2y]=find(T2Eexist==minT2Eexist);
     T2S=T2;
     T2S(T2x,T2y)=minT2Eexist;
     T2S(T2y,T2x)=minT2Eexist;
     T2replace=triu(T2S);
%    view(biograph(T2replace,[],'ShowArrows','off','ShowWeights','on'));

else%���н���
   %ȡT1Eexist��T2Eexist�Ľ�����ʧЧ������С�ıߴ���T1��T2���õ�T1��,T2��
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

