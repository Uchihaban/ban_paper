function Graphpro(DEF)
%这个函数可以产生任意个数DEF的随机拓扑图以及对应的连接矩阵，
%产生元胞数组Data用来存放表示两点之间权值的矩阵G，也就是邻接矩阵
% DEF=2;
Data=cell(DEF,DEF);
Data2=cell(DEF,DEF);
%设定个数 
k=1;
for i=1:DEF
   for j=1:DEF
%     G=waxtop(); 
%waxtop拓扑结构
      G=Powerlaw(); 
%power-law 拓扑结构
%       if connecivity(G)==1 
      Data{i,j} = G;
      xlswrite('d.xlsx',G,k);
      k=k+1;
      connecivity(G); 
      if connecivity(G)==1
          Data2{i,j}=G;
      end
          
   end
end
disp('输出表格个数:');
disp(k-1);
celldisp(Data);%显示元胞数组的内容


% E=Data;
