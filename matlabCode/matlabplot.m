% *************************************************************************
% 	* @File Name: matlabplot.m
% 	* @Author: jhshe
%   * @Version: 1.0
% 	* @ Mail: *****@foxmail.com
% 	* @ Created Time: 2023/10/11 星期三
%  ************************************************************************

clc, clear, close all;
%% =============== 参数化设置属性 start =====================================
figureFontSize = 16; %图片中文字的大小
axesLineWidth = 1; %坐标轴的线宽
waveLineWidth = 3; %波形的线宽
% =============== 参数化设置属性 end =====================================

%% =============== 画图 start =====================================
myFig = figure(1); %创建myFig对象
myFig.Name = "testFig";
myFig.Units = "centimeters";
myFig.Position = [20 18 20 10]; %坐标x,y,长，宽
myFig.Color = [1 1 1]; %背景色白色
inspect(gcf); %打开属性检查器
% plotbrowser on;%打开绘图浏览器
% propertyeditor;%打开属性编辑器
x = (0:0.01:6 * pi);
wave_sinx = plot(x, sin(x)); %创建sinx波形对象
hold on;
wave_cosx = plot(x, cos(x)); %创建cosx波形对象
hold on;
% =============== 画图 end =====================================

%% =============== 修改坐标轴属性 start =====================================
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
ax.XLabel.FontSize = figureFontSize;
ax.XTick = [0 pi 2 * pi 3 * pi 4 * pi 5 * pi 6 * pi];
ax.XTickLabel = ["0"; "\pi"; "2\pi"; "3\pi"; "4\pi"; "5\pi"; "6\pi"];
ax.XLabel.String = "{\bfangle} {\bf\it\theta } {\bf({\circ})}";
ax.YLabel.String = "{\bf{\it f }({\itx})} ";
ax.YLabel.Rotation = 0;
ax.Title.String = "{\bfsin {\itx} and cos {\itx}}";
% =============== 修改坐标轴属性 end =====================================

%% =============== 修改波形属性 start =====================================
wave_sinx.Color = [0, 0, 0];
wave_sinx.LineStyle = "-";
wave_sinx.LineWidth = waveLineWidth;
wave_sinx.Marker = "o";
wave_sinx.MarkerIndices = (1:50:length(sin(x))); %曲线上的标记点(避免数据标记过于密集)
wave_sinx.MarkerFaceColor = [0.60, 0.20, 0.00];
wave_sinx.MarkerEdgeColor = [0.60, 0.20, 0.00];
wave_sinx.MarkerSize = waveLineWidth * 2;

wave_cosx.Color = "red";
wave_cosx.LineStyle = "--";
wave_cosx.LineWidth = waveLineWidth;
wave_cosx.Marker = ">";
wave_cosx.MarkerIndices = (1:50:length(cos(x)));
wave_cosx.MarkerFaceColor = "none";
wave_cosx.MarkerEdgeColor = [0.90, 0.56, 0.04]; %调整曲线的RGB色
wave_cosx.MarkerSize = waveLineWidth * 2;
% =============== 修改波形属性 end =====================================

%% =============== 加图例 start =====================================
lgd = legend(["sin(x)", "cos(x)"]);
lgd.Location = "northeast";
% lgd.Position=[0.792737242214184,0.812893100354656,0.101747172219413,0.091509431488109];
% =============== 加图例 end =====================================

%% 复制到剪切板，导出为tiff文件
copygraphics(myFig, "Resolution", 600);
exportgraphics(myFig, "myFig.tiff", "Resolution", 600);
