clc;%清除命令行窗口命令
clear all;%清除工作区变量
close all;%关闭图形窗口
%% 数据准备
x= linspace(0,1,24);
y1 = 2.*x;
y2 = 3*x.^2;
y3 = 0.5*x.^3;
y4 = 5*x;
y5 = 6.*x.^2+3;
y6 = x.^3;
data = [y1;y2;y3;y4;y5;y6];
t = 1:24;
h = figure;%获取图形句柄
%% Matlab绘图中用到的直线属性包括：


% 字体种类FontName 字体大小FontSize 字体粗细FontWeight
%线型 实线'-'，双划线'--'，虚线':'，点划线'-.'
%标记 +.ox* 正方形s 菱形d 六边形h 五角形p 上三角形^ 下三角形v 右三角形> 左三角形<
plot(t,data(1,:),'Color','b','LineStyle','-',...
    'Marker','o','MarkerFaceColor','b','MarkerEdgeColor',[0.5,0.5,0.5],...
    'MarkerIndices',1:2:length(data(1,:)),'LineWidth',2, 'MarkerSize',10);
hold on;
plot(t,data(2,:),'Color','r','LineStyle','--',...
    'Marker','s','MarkerFaceColor','r','MarkerEdgeColor','r',...
    'MarkerIndices',1:2:length(data(2,:)),'LineWidth',2, 'MarkerSize',10);


plot(t,data(3,:),'Color','k','LineStyle',':',...
    'Marker','<','MarkerFaceColor','k','MarkerEdgeColor','k',...
    'MarkerIndices',1:2:length(data(3,:)),'LineWidth',2, 'MarkerSize',10);
box on;%显示四周网格
grid on;%添加网格
xlim([1 24]);%设置x轴范围
ylim([0 5]);%设置y轴范围
xlabel('x','FontSize',20,'FontWeight','bold');%设置x轴坐标名称
ylabel('y','FontSize',20,'FontWeight','bold');%设置y轴坐标名称


xticks([1:24])%定义横轴标尺
xticklabels({'1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24'})
yticks([1:5])%定义纵轴标尺
% axis equal %刻度等长  x轴y轴比例尺同等长度
axis on %打开坐标轴
% axis square%坐标轴设置为正方形
set(gca,'FontName','Times New Roman','FontSize',12);%修改字体为古罗马
title('\fontname{宋体}函数对比');%设置标题
%gca表示当前的坐标轴对象   gcf表示当前的图形窗口
legend({'y = 2x','y = 3x^2','y = 0.5x^3'},'Location','northwest','NumColumns',3,'FontSize',12,'Orientation','horizon','box','off');


% print 自动保存图片文件
width = 5;  % 图片宽度
height = 5;  % 图片高度
set(h,'PaperUnits','inches'); % 尺寸所用单位
set(h,'PaperPosition',[0 0 width height]);





h1 = figure;%获取图形句柄
hold on;
plot(t,data(4,:),'Color','g','LineStyle',':',...
    'Marker','p','MarkerFaceColor','g','MarkerEdgeColor','g',...
    'MarkerIndices',1:2:length(data(4,:)),'LineWidth',2, 'MarkerSize',10);
plot(t,data(5,:),'Color','y','LineStyle','-.',...
    'Marker','+','MarkerFaceColor','y','MarkerEdgeColor','y',...
    'MarkerIndices',1:2:length(data(5,:)),'LineWidth',2, 'MarkerSize',10);
plot(t,data(6,:),'Color','c','LineStyle','-.',...
    'Marker','h','MarkerFaceColor','c','MarkerEdgeColor','c',...
    'MarkerIndices',1:2:length(data(6,:)),'LineWidth',2, 'MarkerSize',10);
box on;%显示四周网格
grid minor;%添加更小的网格
% axis off%关闭坐标轴
xlabel('\fontname{Times new roman}x \fontname{宋体}变量');%设置x轴坐标名称
ylabel('y');%设置y轴坐标名称
title('函数对比','position',[12,1]);%设置标题  title(,'af','position',[x,y]);
% set(gca,'XTick', []);% 清除X轴的记号点
set(gca,'XTick', [1:24]);% 清除X轴的记号点
set(gca,'XLim',[1 24]);% X轴的数据显示范围
set(gca,'XTicklabels',{'1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24'});% X轴的记号
set(gca,'XGrid','on');% X轴的网格
set(gca,'XDir','reverse');% 逆转X轴
set(gca,'XColor','red');% X轴的颜色
set(gca,'YColor','b');% Y轴的颜色
legend({'y = 5x','y = 6x^2+3','y_1 = x^3'},'Location','northeast','NumColumns',2,'FontSize',12,'Orientation','horizon','box','off');


% 裁掉图片的白边 (方便插图，省去手动裁剪的时间)
set(gca, 'LooseInset', [0,0,0,0])
% % 以厘米为单位，在屏幕上(10,5)的位置画24cm×12cm的图
% set(gcf,'unit','centimeters','position',[10 5 24 12])
width = 5;  % 图片宽度
height = 5;  % 图片高度
set(h,'PaperUnits','centimeter'); % 尺寸所用单位 厘米
set(h,'PaperPosition',[0 0 width height]);

%MATLAB2020a推出了新的exportgraphics函数,该函数可以智能识别图形边界, 导出的图像没有白边.在图形超出打印边界的情况下也可以直接出图
exportgraphics(gcf,'Dargon.png'); %'jpg' 'jpeg' 'png' 'tif' 'tiff''pdf' 'emf' 'eps'