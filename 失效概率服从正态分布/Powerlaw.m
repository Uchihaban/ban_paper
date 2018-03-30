function G=Powerlaw() 
%生成一个Powerlaw拓扑结构的网络
NumberOfNodes =30; % Number of nodes节点的个数
Alpha = -0.61;   % Alpha of the scale-free graph无标度网络的幂律指数
%define node degree distribution:定义节点度分布
XAxis  = unique(round(logspace(0,log10(NumberOfNodes),25)));
YAxis  = 100*unique(round(logspace(0,log10(NumberOfNodes),25))).^(Alpha);
% create the graph with the required node degree distribution:根据所需节点度分布创建图
Graph = mexGraphCreateRandomGraph(NumberOfNodes,XAxis,YAxis,0);
Graph = GraphMakeUndirected(Graph ); 
%将文件转化为稀疏矩阵
Graph1=spconvert(Graph.Data);
%将Graph1转换成邻接矩阵
G=full(Graph1); 

%% % Nodes=Powerlaw(200,5,1) 
% %This program generates a power law degree distribution graph with expected gama 
% %Ref[Universal behavior of load distribution in Scale free networks,PRL V87,2001,12] 
% %Input: 
% %N--the number of nodes 
% %m--the mean degree <k>=2m 
% %gama--the expected exponent,blong to (2,infinit),whose corelation with the control 
% %      parameter alfa is: gama=1+1/alfa,where alfa is [0,1) 
% %node_attribution--if node_attribution==1,Nodes is adjacent matrix; if 
% %                   node_attribution=2,Nodes is adjacent list. 
% %Output 
% %Nodes--return the adjacent matrix if node_attribution=1.the adjacent list 
% %       if node_attribution=2 
% % 
%  
%  
%  
% if node_attribution==1 
%     Nodes=zeros(N,N); 
%     p=zeros(N,1); 
%     pp=zeros(N,1); 
%     node_1_Len=zeros(N,1); 
%     node_2_Len=zeros(N,1); 
% %     alfa=1/(gama-1); 
%     alfa=0.61;
%     edge_num=N*m; 
%      
%     %1.get nodes' weigh 
%     for i=1:N 
%         p(i)=100/(i^alfa);         
%     end 
%     %2.normalized node weights 
%     sum_p=sum(p); 
%     pp(1)=p(1)/sum_p; 
%     for i=2:N 
%         pp(i)=pp(i-1)+p(i)/sum_p;         
%     end 
%     
%     %3.add edge 
%     for i=1:edge_num
%        %i 
%        ADD_ONE_EDGE=0; 
%        while ADD_ONE_EDGE==0 
%             node_1_Len=find(pp>rand(1));  
%             node_1=node_1_Len(1); 
%             node_2_Len=find(pp>rand(1)); 
%             node_2=node_2_Len(1); 
%             while node_2==node_1%avoid self-loop 
%                 node_2_Len=find(pp>rand(1)); 
%                 node_2=node_2_Len(1); 
%             end 
%             if Nodes(node_1,node_2)==0 
%                 Nodes(node_1,node_2)=1; 
%                 Nodes(node_2,node_1)=1; 
%                 ADD_ONE_EDGE=1; 
%             else 
%                 ADD_ONE_EDGE=0; 
%             end%Nodes(node_1,node_2) 
%        end%while ADD_ONE_EDGE==0 
%     end% for i=1:edge_num     
% end%node_attribution 
%  
%  
% % if TEST==1 
% %     t=toc 
% %     for i=1:N 
% %         Degree(i)=nnz(Nodes(i,:)); 
% %     end 
% %     plot_distribution(Degree,Line_color,1); 
% %     fname=['PLRG',num2str(N),'k',num2str(m),'gama',num2str(gama)]; 
% %     Write_Sparse_Matrix(Nodes,[fname,'.adj']); 
% %     Write_into_Pajek(Nodes,[fname,'.net']); 
% % end 
% return
% 
% % ND_netplot(Nodes);
% % 计算边数；
% 
% s=0;
% for i=1:200
%     for j=1:i
%         if Nodes(i,j)>0
%             s=s+1;
%         end
%     end
% end
% disp('边是：'); 
% disp(s);    
%    
