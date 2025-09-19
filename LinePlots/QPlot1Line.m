%%% 重置工作区环境
% 清除内存中的变量
% https://ww2.mathworks.cn/help/matlab/ref/clearvars.html
clearvars;
% 关闭一个或多个图窗
% https://ww2.mathworks.cn/help/matlab/ref/close.html?s_tid=doc_ta
close all;
% 设置断点用于调试
% https://ww2.mathworks.cn/help/matlab/ref/dbstop.html?s_tid=doc_ta
dbstop error;

% TODO: S1.1: 输入
cSampleDatasFolderPath = fullfile("..","SampleDatas");
cNovAtelSPANGyroscopeFileName = "NovAtelSPANGyroscope.txt";

tNovAtelSPANGyroscopeFilePath = fullfile(cSampleDatasFolderPath,cNovAtelSPANGyroscopeFileName);
tNovAtelSPANGyroscopeRawData = readmatrix(tNovAtelSPANGyroscopeFilePath);

tNovAtelSPANGyroscopePlotTime = tNovAtelSPANGyroscopeRawData(:,1) - tNovAtelSPANGyroscopeRawData(1,1);
tNovAtelSPANGyroscopePlotZValue = tNovAtelSPANGyroscopeRawData(:,4);

% TODO: S1.2: 输出
cSaveFolderPath = fullfile("..","SampleDatas");
cSaveFileName = "NovAtelSPANGyroscopeZAxis";

% 创建图窗窗口
% https://ww2.mathworks.cn/help/matlab/ref/figure.html?searchHighlight=figure&s_tid=srchtitle_support_results_1_figure
tFigureObject = figure();
% Figure 属性
% https://ww2.mathworks.cn/help/matlab/ref/matlab.ui.figure.html
% 位置和大小 类
% Position and Size
% Root 属性
% https://ww2.mathworks.cn/help/matlab/ref/matlab.ui.root-properties.html
% 显示屏分辨率
tRootPropertiesScreenPixelsPerInch  = get(groot,"ScreenPixelsPerInch");
% 主显示画面的大小
cInchToCentimeter = 127/50;
tRootPropertiesScreenSizePixels = get(groot,"ScreenSize");
tRootPropertiesScreenSizeInches = tRootPropertiesScreenSizePixels / tRootPropertiesScreenPixelsPerInch;
tRootPropertiesScreenSizeCentimeters = tRootPropertiesScreenSizeInches * cInchToCentimeter;
tRootPropertiesScreenCenterPositionLeft = tRootPropertiesScreenSizeCentimeters(3) / 2;
tRootPropertiesScreenCenterPositionBottom = tRootPropertiesScreenSizeCentimeters(4) / 2;
% 位置单位
% Units — Units of measurement
set(tFigureObject,'Units','centimeters');
% https://www.nature.com/nature/for-authors/formatting-guide
% For guidance, Nature’s standard figure sizes are 90 mm (single column) and 180 mm (double column) and the full depth of the page is 170 mm.
cFigurePropertiesPositionWidthCentimeters = 18;
cFigurePropertiesPositionHeightCentimeters = 9;
tFigurePropertiesPositionLeft = tRootPropertiesScreenCenterPositionLeft - cFigurePropertiesPositionWidthCentimeters / 2;
tFigurePropertiesPositionBottom = tRootPropertiesScreenCenterPositionBottom - cFigurePropertiesPositionHeightCentimeters / 2;
tFigurePropertiesPosition = [ ...
    tFigurePropertiesPositionLeft ...
    tFigurePropertiesPositionBottom ...
    cFigurePropertiesPositionWidthCentimeters ...
    cFigurePropertiesPositionHeightCentimeters ...
    ];
% 大小和位置，不包括标签边距
% Position — Location and size of figure, excluding borders, figure tools, and title bar
% [left bottom width height]
set(tFigureObject,'Position',tFigurePropertiesPosition);
% 打印和导出 类
% Printing and Exporting
% 纸张单位
% PaperUnits — Units used for PaperSize and PaperPosition
% set(tFigureObject,'PaperUnits','centimeters');
% 纸张方向
% PaperOrientation — Orientation of page
% 'portrait' (default) | 'landscape'
% set(tFigureObject,'PaperOrientation','portrait');
% 纸张类型
% PaperType — Standard page sizes
% 'a4' | 21-by-29.7 cm (default in Europe and Asia)
% set(tFigureObject,'PaperType','a4');
% 纸张大小
% PaperSize — Custom page size
tFigurePropertiesPaperSize = [cFigurePropertiesPositionWidthCentimeters cFigurePropertiesPositionHeightCentimeters];
% set(tFigureObject,'PaperSize',tFigurePropertiesPaperSize);
% 纸张位置
% PaperPosition — Figure size and location on page when printing or saving
% set(tFigureObject,'PaperPosition',tFigurePropertiesPosition);

% 创建笛卡尔坐标区
% https://ww2.mathworks.cn/help/matlab/ref/axes.html
tAxesObject = axes;
% Axes 属性 
% https://ww2.mathworks.cn/help/matlab/ref/matlab.graphics.axis.axes-properties.html
% 字体 — Font
% FontName — 字体名称
% 支持的字体名称 | "FixedWidth"
cAxesObjectFontNameProperty = 'Times new roman';
set(tAxesObject,'FontName',cAxesObjectFontNameProperty);
% FontSize — 字体大小
% 数值标量
cAxesObjectFontSizeProperty = 8;
set(tAxesObject,'FontSize',cAxesObjectFontSizeProperty);
% 刻度 — Ticks
% XTick, YTick, ZTick — 刻度值
% [] (默认) | 由递增值组成的向量
cAxesObjectXTickProperty = 0:10:130;
set(tAxesObject,'XTick',cAxesObjectXTickProperty);
cAxesObjectYTickProperty = -0.3:0.1:0.6;
set(tAxesObject,'YTick',cAxesObjectYTickProperty);
% XTickLabel, YTickLabel, ZTickLabel — 刻度标签
% '' (默认) | 字符向量元胞数组 | 字符串数组 | 分类数组
% set(axesObject5,'XTickLabel',{});
% 标尺 — Rules
% XLim, YLim, ZLim — 最小和最大坐标轴范围
% [0 1] (默认) | [min max] 形式的二元素向量
cAxesObjectXLimProperty = [0, 130];
set(tAxesObject,'XLim',cAxesObjectXLimProperty);
cAxesObjectYLimProperty = [-0.3, 0.6];
set(tAxesObject,'YLim',cAxesObjectYLimProperty);
% 网格 — Grids
% XGrid, YGrid, ZGrid — 网格线
% 'off' (默认) | on/off 逻辑值
set(tAxesObject,'XGrid','on');
set(tAxesObject,'YGrid','on');
% Layer — 网格线和刻度线的位置
% 'bottom' (默认) | 'top'
set(tAxesObject,'Layer','top');
% GridLineStyle — 网格线的线型
% '-' (默认) | '--' | ':' | '-.' | 'none'
set(tAxesObject,'GridLineStyle','--');
% 标签 - Labels
% XLabel, YLabel, ZLabel — 坐标轴标签的文本对象
% Text 对象
% Text 属性
% 坐标区文本的外观和行为
% 文本 — Text
% String — 要显示的文本
% '' (默认) | 字符向量 | 字符向量元胞数组 | 字符串数组 | 分类数组 | 数值
set(get(tAxesObject,'XLabel'),'String','\fontname{宋体}采样时间\fontname{宋体}（\fontname{Times new roman}s\fontname{宋体}）');
set(get(tAxesObject,'YLabel'),'String','\fontname{宋体}角速度\fontname{宋体}（\fontname{Times new roman}rad/s\fontname{宋体}）');
% 字体 — Font
% FontName — 字体名称
% 支持的字体名称 | "FixedWidth"
set(get(tAxesObject,'XLabel'),'FontName',cAxesObjectFontNameProperty);
set(get(tAxesObject,'YLabel'),'FontName',cAxesObjectFontNameProperty);
% FontSize — 字体大小
% 大于 0 的标量值
set(get(tAxesObject,'XLabel'),'FontSize',cAxesObjectFontSizeProperty);
set(get(tAxesObject,'YLabel'),'FontSize',cAxesObjectFontSizeProperty);
% 框样式 — Box Styling
% Box — 框轮廓
set(tAxesObject,'Box',"on");
% 位置 — Position
% TightInset — 文本标签的边距
% 只读: [left bottom right top] 形式的四元素向量
set(tAxesObject,'LooseInset', get(tAxesObject,'TightInset'))

% 二维线图
% https://ww2.mathworks.cn/help/matlab/ref/plot.html?searchHighlight=plot&s_tid=srchtitle_support_results_1_plot
pX = tNovAtelSPANGyroscopePlotTime;
pY = tNovAtelSPANGyroscopePlotZValue;
hold on;
tLineObject = plot(tAxesObject,pX,pY);
hold off;
% Line 属性 
% https://ww2.mathworks.cn/help/matlab/ref/matlab.graphics.chart.primitive.line-properties.html
% 线条 — Line
% Color — 线条颜色
% RGB 三元组 | 十六进制颜色代码 | "r" | "g" | "b" | ...
set(tLineObject,'Color','k');
% LineStyle — 线型
% "-" (默认) | "--" | ":" | "-." | "none"
% set(tLineObject,'LineStyle','-');
% 标记 — Markers
% Marker — 标记符号
% "none" (默认) | "o" | "+" | "*" | "." | ...
% set(tLineObject,'Marker','none');
% MarkerSize — 标记大小
% 6 (默认) | 正值
% set(tLineObject,'MarkerSize',6);
% 图例 — Legend
% DisplayName — 图例标签
set(tLineObject,'DisplayName','\fontname{宋体}角速度 Z 轴');

% legend
% 在坐标区上添加图例
tLegendObject = legend(tAxesObject);
% Legend 属性 https://ww2.mathworks.cn/help/matlab/ref/matlab.graphics.illustration.legend-properties.html
% 位置和布局 — Position and Layout
% Location — 相对于坐标区的位置
% 'north' | 'south' | 'east' | 'west' | 'northeast' | ...
set(tLegendObject,'Location','northeastoutside');
% Orientation — 方向
% 'vertical' (默认) | 'horizontal'
set(tLegendObject,'Orientation','vertical');
% 字体 — Font
% FontName — 字体名称
% 支持的字体名称 | "FixedWidth"
set(tLegendObject,'FontName',cAxesObjectFontNameProperty);
% FontSize — 字体大小
% 大于 0 的标量值
set(tLegendObject,'FontSize',cAxesObjectFontSizeProperty);


% 将图窗另存为 FIG 文件
tSaveFIGFileName = strcat(cSaveFileName,".fig");
tSaveFIGFilePath = fullfile(cSaveFolderPath,tSaveFIGFileName);
savefig(tFigureObject,tSaveFIGFilePath)

% 导出图窗或图
% https://ww2.mathworks.cn/help/matlab/ref/exportgraphics.html
% tFigurePropertiesPositionWidthInches = cFigurePropertiesPositionWidthCentimeters / cInchToCentimeter;
% tFigurePropertiesPositionHeightInches = cFigurePropertiesPositionHeightCentimeters / cInchToCentimeter;
cExportgraphicsResolution = 600;
% tFigurePropertiesPositionWidthPixels = tFigurePropertiesPositionWidthInches * cExportgraphicsResolution;
% tFigurePropertiesPositionHeightPixels = tFigurePropertiesPositionHeightInches * cExportgraphicsResolution;
% https://ww2.mathworks.cn/help/matlab/creating_plots/save-figure-at-specific-size-and-resolution.html
tExportPNGFileName = strcat(cSaveFileName,".png");
tExportPNGFilePath = fullfile(cSaveFolderPath,tExportPNGFileName);
exportgraphics(tFigureObject,tExportPNGFilePath,'Resolution',cExportgraphicsResolution)

close(tFigureObject);
