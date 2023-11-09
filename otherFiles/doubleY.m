%matlab
x = linspace(0, 8);
y1 = sin(3*x);
y2 = sin(3*x) .* exp(0.5*x);

yyaxis left; % 激活左边的轴
l_y1=plot(x,y1,"LineWidth",2);
title('Title');
xlabel('X-axis');
ylabel('left Y-axis'); % 给左y轴添加轴标签
ax=gca;
ax.XLim=[0,8];

yyaxis right; % 激活右边的轴
plot(x,y2,"LineWidth",2);
ylim([-150,150]); % 设置右y轴的界限
ylabel('right Y-axis'); % 给右y轴添加轴标签
ax=gca;
ax.XLim=[0,8];
%导出有bug，x轴8以后仍然有图像
exportgraphics(gcf,'15.jpg','Resolution',600);