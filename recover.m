E1=ST1;
E1((find(E1>0))')=1;
E1=full(E1+E1');%T1�ı߼���������һ������
E2=ST;
E2((find(E2>0))')=1;
E2=full(E2+E2');%T2�ı߼���������һ������
intersect(E1,E2,'rows');

Ec=intersect(E1,E2,'rows');%����T1��T2��ͬ�ı�
E= cell(1,3);
E{1}=E1;E{2}=E2;E{3}=Ec;

[r,c]=find(intersect(G,E2,'rows'));

 