clf;
step=1e-2;
x= (0:step:12*pi);
sinx=sin(x);
cosx=cos(x);
L_sinx = plot(x, sinx); %创建sinx波形对象
hold on;
L_cosx = plot(x, cosx); %创建cosx波形对象
hold on;
arrText=annotation('textarrow',[0.418,0.5],[0.72,0.79],'String','cos(x) = sin(x)');
arrText.FontName="Times New Roman";
arrText.FontSize=14;
arrText.LineWidth=2;
arrText.String="test"