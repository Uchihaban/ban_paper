function S=connecivity(G)  
n=size(G,1);
S=0;a=1;
C=zeros(n,1);
for i=1:n
    for j=(i+1):n 
        if G(i,j)==1%������֮���б���ͨ
            if C(i)==C(j)%������֮������ͨ����˵��������ͬһ��ͨ��֧
                if C(i)==0
                    C(i)=a;C(j)=a;
                    a=a+1;
                    S=S+1;
                end
            else
                if C(i)==0
                    C(i)=C(j);%����i����ͨ������j��ͬһ��ͨ��֧
                elseif C(j)==0
                    C(j)=C(i);%����j����ͨ������i��ͬһ��ͨ��֧
                else%����������ͨ��������ڲ�ͬ��ͨ��֧���ϲ�����ͨ��֧
                    for b=1:n
                        if C(b)==C(i)C(b)=C(j);%�ϲ�����ͨ��֧
                        end
                    end
                    S=S-1;%?�ϲ�����ͨ��֧???????????????
                end
            end
        end
    end
end
if S==1
    disp('Warshell�㷨����ͨ');
else
    disp(['Warshell�㷨������ͨ����ͨ��֧��=',num2str(S)]);
end
