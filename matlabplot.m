% ===================================================
% 作者: jhshe
% 版本: 1.0
% 邮箱: jh_she@qq.com
% 创建时间: 2023/10/11 星期三
% 修改时间：2023/11/8 星期三
% ===================================================

clc, clear, close all;
%% 创建数据 start ===================================
step=1e-2;
x= (0:step:12*pi);
sinx=sin(x);
cosx=cos(x);
% 创建数据 end ======================================


%% 外部导入 start ===================================
% step=1e-2;
% x= (0:step:6*pi)';
% sinx=sin(x);
% cosx=cos(x);
% writematrix(x,   "testData.xls","Sheet",1,"Range","A1");
% writematrix(sinx,"testData.xls","Sheet",1,"Range","B1");
% writematrix(cosx,"testData.xls","Sheet",1,"Range","C1");
% data=readmatrix("testData.xls");
% x=data(:,1);sinx=data(:,2);cosx=data(:,3);
% 外部导入 end ======================================

%% 参数化设置属性 start ==============================
figureFontSize = 16; %图片中文字的大小
axesLineWidth = 1; %坐标轴的线宽
waveLineWidth = 3; %波形的线宽
% 参数化设置属性 end =================================

%% 画图 start ========================================
myFig = figure(1); %创建myFig对象
myFig.Name = "testFig";
myFig.Units = "centimeters";
myFig.Position = [20 18 20 10]; %坐标x,y,长，宽
% myFig.Colormap=lines;
% myFig.Color = myFig.Colormap(80,:); %背景色白色
myFig.Color = [1,1,1]; %背景色白色
% inspect(gcf); %打开属性检查器
% plotbrowser on;%打开绘图浏览器
% propertyeditor;%打开属性编辑器
L_sinx = plot(x, sinx); %创建sinx波形对象
hold on;
L_cosx = plot(x, cosx); %创建cosx波形对象

hold on;
% 画图 end =====================================

%% 修改坐标轴属性 start =========================
ax = gca; %获取当先坐标轴(get current axes)
ax.XLim = [0 6 * pi];
ax.YLim = [-1.2 1.2];
ax.FontSize = figureFontSize;
ax.FontName = "Times New Roman";
ax.GridLineStyle = "--";
ax.XGrid = "on";
ax.XMinorGrid = "on";
ax.XMinorTick = "on";
ax.YGrid = "on";
ax.YMinorGrid = "off";
ax.YMinorTick = "on";
ax.LineWidth = axesLineWidth;
% ax.YTickLabel=num2str(get(gca,'yTick')','%.1f');
ax.XLabel.FontSize = figureFontSize;
ax.XTick = (pi:pi:6*pi);
ax.XTickLabel=num2str(get(gca,'xTick')'/pi,"%d\x03C0");
% 方法1
% temp=num2str(get(gca,'xTick')'/pi,"%d");
% for i=1:1:length(temp)
% temp1(i,:)=[temp(i),'\pi'];
% end
% set(gca,'xTickLabel',temp1);
% 方法2
% ax.XTick = (0:pi:6*pi);
% ax.XTickLabel = ["0"; "\pi"; "2\pi"; "3\pi"; "4\pi"; "5\pi"; "6\pi"];
% 方法3
set(gca,'xTickLabel',num2str(get(gca,'xTick')'/pi,"%d\x03C0"));
% ax.XLabel.Interpreter="latex";
ax.XLabel.String = "{\bfangle} {\bf\theta }";
ax.YLabel.String = "{\bf{\it f }({\theta})} ";
ax.YLabel.Rotation = 0;
ax.Title.String = "{\bfsin {\itx} and cos {\itx}}";

% =============== 修改坐标轴属性 end =====================================

%% =============== 修改波形属性 start =====================================
L_sinx.Color = [0,0,0];
L_sinx.LineStyle = "--";
L_sinx.LineWidth = waveLineWidth;
L_sinx.Marker = "o";
L_sinx.MarkerIndices = (1:50:length(sin(x))); %曲线上的标记点(避免数据标记过于密集)
L_sinx.MarkerEdgeColor = [0,0,0];
L_sinx.MarkerFaceColor = "auto";
L_sinx.MarkerSize = waveLineWidth * 2;

L_cosx.Color = "red";
L_cosx.LineStyle = "--";
L_cosx.LineWidth = waveLineWidth;
L_cosx.Marker = "diamond";
L_cosx.MarkerIndices = (1:50:length(cos(x)));
L_cosx.MarkerFaceColor = "none";
L_cosx.MarkerEdgeColor = "red"; %调整曲线的RGB色
L_cosx.MarkerSize = waveLineWidth * 2;
% =============== 修改波形属性 end =====================================

%% =============== 加图例 start =====================================
lgd = legend(["sin(x)", "cos(x)"]);
lgd.Location = "northeast";
% lgd.Position=[0.792737242214184,0.812893100354656,0.101747172219413,0.091509431488109];
% =============== 加图例 end =====================================

%% 复制到剪切板，导出为文件
copygraphics(myFig, "Resolution", 600);
exportgraphics(myFig, "myFig.png", "Resolution", 600);
% print(myfig, 'myFig.svg', '-dsvg');
% print(myfig, 'myFig.pdf', '-dpdf', '-r300');