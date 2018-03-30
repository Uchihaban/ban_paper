function canget(G)
%测试网络G的连通度
A=G;
% input('Enter an Adjacency Matrix:'); 
n=length(A); 
P=A; 
for i=2:n     
    P=P+A^i; 
end
P=(P~=0);  
Q=P|P'|eye(size(P)); 
M=A|A'; 
if P==1      
    sprintf('This is a strongly-connected graph.') 
elseif Q==1          
    sprintf('This is an unilaterally-connected graph.') 
else
    W=canget(M);     
    if W==1          
        sprintf('This is a weakly-connected graph.')     
    else
         sprintf('This is an  unconnected graph.');     
    end
end