function G=waxtop()   
%生成一个waxman 拓扑结构的网络
alpha=0.25;beta=1.1;
m=4;n=5;s=10;
u=0:s:(m-1)*s;
v=0:s:(n-1)*s;
[u,v]=meshgrid(u,v);
u=u(:);v=v(:);
hold on,plot(u,v,'*')
uv=[u';v'];
d=dist(uv);
L=max(max(d));
gailv=alpha*exp(-d/(beta*L));
gailv=tril(gailv);
gailv(1:m*n+1:end)=0;
randnum=rand(m*n);
[i,j]=find(randnum<=gailv);
a=zeros(m*n);
for k=1:length(i)
    a(i(k),j(k))=1;
    a(j(k),i(k))=1;
    plot([u(i(k)),u(j(k))],[v(i(k)),v(j(k))]);
end
s=0;
N=m*n;
 for i=1:N
    for j=1:i
        if a(i,j)>0
            s=s+1;
        end
    end
    disp('边是：'); 
    disp(s);
 end
 G=a;


% function a=waxtop()  
% alpha=1;beta=0.058;
% m=1;n=1;s=0.1;
% x=0:s:m-0.1;
% y=0:s:n-0.1;
% [x,y]=meshgrid(x,y);
% A=[0 1;1 0];
% N=100;
% A(3:N,:)=rand(N-2,2); 
% u=A(:,1); 
% v=A(:,2);
% hold on,plot(u,v,'*');
% uv=[u';v'];
% d=dist(uv);
% L=max(max(d));
% gailv=alpha*exp(-d/(beta*L));
% gailv=tril(gailv);
% gailv(1:N+1:end)=0;
% randnum=rand(N);
% [i,j]=find(randnum<=gailv);
% % b=[i,j];
% a=zeros(N);
% for k=1:length(i)
%     a(i(k),j(k))=1;
%     a(j(k),i(k))=1;
%     plot([u(i(k)),u(j(k))],[v(i(k)),v(j(k))]);
% end
% %计算边数；
% s=0;
%  for i=1:N
%     for j=1:N
%         if a(i,j)>0
%             s=s+1;
%         end
%     end
%     disp('边是：'); 
%     disp(s);
%  end
% 
%     