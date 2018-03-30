function S=connecivity(G)  
n=size(G,1);
S=0;a=1;
C=zeros(n,1);
for i=1:n
    for j=(i+1):n 
        if G(i,j)==1%若两端之间有边连通
            if C(i)==C(j)%若两端之间有连通链，说明二者在同一连通分支
                if C(i)==0
                    C(i)=a;C(j)=a;
                    a=a+1;
                    S=S+1;
                end
            else
                if C(i)==0
                    C(i)=C(j);%若与i不连通，则与j在同一连通分支
                elseif C(j)==0
                    C(j)=C(i);%若与j不连通，则与i在同一连通分支
                else%若两端相连通，但标记在不同连通分支，合并两连通分支
                    for b=1:n
                        if C(b)==C(i)C(b)=C(j);%合并两连通分支
                        end
                    end
                    S=S-1;%?合并两连通分支???????????????
                end
            end
        end
    end
end
if S==1
    disp('Warshell算法：连通');
else
    disp(['Warshell算法：不连通，连通分支数=',num2str(S)]);
end
