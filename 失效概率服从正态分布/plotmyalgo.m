X=[10,20,30,50,70,100];
Y1=[0.0609313,0.0626258,0.0690418,0.0933748,0.1058709,0.1342114];
plot(X,Y1,'k-o','linewidth',1,'markersize',6);
ylabel('ʱ��/s','fontname','�꿬��','fontweight','bold','fontsize',12);
xlabel('����ڵ���','fontname','�꿬��','fontweight','bold','fontsize',12);
set(gca,'xtick',[10,20,30,40,50,60,70,80,90,100]);

hold on 
Z1=[0.0508219,0.0513134,0.0535872,0.0564476,0.0599809,0.062283];
plot(X,Z1,'p--g','linewidth',1,'markersize',6);  
hold on 
Y2=[0.0594071,0.0617201,0.0620082,0.0778454,0.0949658,0.1333408];
plot(X,Y2,'k-*','linewidth',1,'markersize',6);  
hold on 
Z2=[0.0441878,0.0463855,0.0482588,0.0552277,0.0579209,0.0592714];
plot(X,Z2,'s--g','linewidth',1,'markersize',6);  

title('�ǹ��б�');
legend CBMS����̬�ֲ��� USLMS����̬�ֲ��� CBMS��ָ���ֲ��� SLMS��ָ���ֲ��� 
box off 
legend('boxoff')
set(legend,'fontname','�꿬��')
set(legend,'fontweight','bold')
hold off
------------------------------------------------------------------------------------------------

X=[10,20,30,50,70,100];
Y1=[0.0779252,0.0794705,0.083145,0.0940952,0.110853,0.1342114];
plot(X,Y1,'k-o','linewidth',1,'markersize',6);
ylabel('ʱ��/s','fontname','�꿬��','fontweight','bold','fontsize',12);
xlabel('����ڵ���','fontname','�꿬��','fontweight','bold','fontsize',12);
set(gca,'xtick',[10,20,30,40,50,60,70,80,90,100]);
hold on 
Z1=[0.07333,0.07641,0.0789062,0.085596,0.08784,0.0914978];
plot(X,Z1,'o--g','linewidth',1,'markersize',6);  
hold on 
Y2=[0.0696264,0.070182,0.079164,0.0850424,0.1043481,0.1404334];
plot(X,Y2,'k-*','linewidth',1,'markersize',6);  
hold on 
Z2=[0.0664931,0.0695757,0.0775971,0.0837446	,0.0863839,0.0889069];
plot(X,Z2,'g--*','linewidth',1,'markersize',6);  
title('���б�');
legend ԭ�㷨ʱ�䣨��̬�ֲ��� ���㷨ʱ�䣨��̬�ֲ��� ԭ�㷨ʱ�䣨ָ���ֲ��� ���㷨ʱ�䣨ָ���ֲ���
box off 
legend('boxoff')
set(legend,'fontname','�꿬��')
set(legend,'fontweight','bold')
hold off

-------------------------------------------------------------------------------------------------

X=[20,30,50,70,100];
Y1=[0.0626258,0.0690418,0.0933748,0.1058709,0.1342114];
plot(X,Y1,'k-o','linewidth',1,'markersize',6);
ylabel('ʱ��/s','fontname','�꿬��','fontweight','bold','fontsize',12);
xlabel('����ڵ���','fontname','�꿬��','fontweight','bold','fontsize',12);
set(gca,'xtick',[10,20,30,40,50,60,70,80,90,100]);
hold on 
Z1=[0.0513134,0.0535872,0.0564476,0.0599809,0.062283];
plot(X,Z1,'o--g','linewidth',1,'markersize',6);  
hold on 
Y2=[0.0794705,0.083145,0.0940952,0.110853,0.1382227];
plot(X,Y2,'k-*','linewidth',1,'markersize',6);  
hold on 
Z2=[0.07641,0.0789062,0.085596,0.08784,0.0914978];
plot(X,Z2,'*--g','linewidth',1,'markersize',6);  

title('powelaw��̬�ֲ�');
legend CBMS���ǹ��бߣ� USLMS���ǹ��бߣ� CBMD�����бߣ� SLMS�����бߣ� 
box off 
legend('boxoff')
set(legend,'fontname','�꿬��')
set(legend,'fontweight','bold')
hold off
----------------------------------------------------------------------------------------------------------------

X=[20,30,50,70,100];
Y1=[0.064225,0.0759567,0.0858737,0.0871797,0.1020447];
plot(X,Y1,'k-o','linewidth',1,'markersize',6);
ylabel('ʱ��/s','fontname','�꿬��','fontweight','bold','fontsize',12);
xlabel('����ڵ���','fontname','�꿬��','fontweight','bold','fontsize',12);
set(gca,'xtick',[10,20,30,40,50,60,70,80,90,100]);
hold on 
Z1=[0.052779,0.0546899,0.0567114,0.0584987,0.0608583];
plot(X,Z1,'o--g','linewidth',1,'markersize',6);  
hold on 
Y2=[0.077665,0.0875953,0.0943358,0.1013705,0.111565];
plot(X,Y2,'k-*','linewidth',1,'markersize',6);  
hold on 
Z2=[0.0762142,0.082947,0.085497,0.087817,0.0891085];
plot(X,Z2,'*--g','linewidth',1,'markersize',6);  

title('waxman��̬�ֲ�');
legend CBMS���ǹ��бߣ� USLMS���ǹ��бߣ� CBMD�����бߣ� SLMS�����бߣ� 
box off 
legend('boxoff')
set(legend,'fontname','�꿬��')
set(legend,'fontweight','bold')
hold off

-----------------------------------------------------------------------------
% X=[20,30,50,70,100];
% Y1=[0.0594071,0.0617201,0.0620082,0.0778454,0.0949658,0.1333408];
% plot(X,Y1,'k-o','linewidth',1,'markersize',6);
% ylabel('ʱ��/s','fontname','�꿬��','fontweight','bold','fontsize',12);
% xlabel('����ڵ���','fontname','�꿬��','fontweight','bold','fontsize',12);
% set(gca,'xtick',[10,20,30,40,50,60,70,80,90,100]);
% hold on 
% Z1=[0.0441878,0.0463855,0.0482588,0.0552277,0.0579209,0.0592714];
% plot(X,Z1,'o--g','linewidth',1,'markersize',6);  
% hold on 
% Y2=[0.0696264,0.070182,0.079164,0.0850424,0.1043481,0.1404334];
% plot(X,Y2,'k-*','linewidth',1,'markersize',6);  
% hold on 
% Z2=[0.0664931,0.0695757,0.0775971,0.0837446	,0.0863839,0.0889069];
% plot(X,Z2,'*--g','linewidth',1,'markersize',6);  
% 
% title('ָ���ֲ�');
% legend ԭ�㷨ʱ�䣨�ǹ��бߣ� ���㷨ʱ�䣨�ǹ��бߣ� ԭ�㷨ʱ�䣨���бߣ� ���㷨ʱ�䣨���бߣ� 
% box off 
% legend('boxoff')
% set(legend,'fontname','�꿬��')
% set(legend,'fontweight','bold')
% hold off
% ------------------------------------------------------------------------------