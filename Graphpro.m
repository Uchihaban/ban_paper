function Graphpro(DEF)
%����������Բ����������DEF���������ͼ�Լ���Ӧ�����Ӿ���
%����Ԫ������Data������ű�ʾ����֮��Ȩֵ�ľ���G��Ҳ�����ڽӾ���
% DEF=2;
Data=cell(DEF,DEF);
Data2=cell(DEF,DEF);
%�趨���� 
k=1;
for i=1:DEF
   for j=1:DEF
%     G=waxtop(); 
%waxtop���˽ṹ
      G=Powerlaw(); 
%power-law ���˽ṹ
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
disp('���������:');
disp(k-1);
celldisp(Data);%��ʾԪ�����������


% E=Data;
