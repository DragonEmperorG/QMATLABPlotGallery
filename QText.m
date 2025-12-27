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

% TODO: S1.2: 输出
cSaveFolderPath = fullfile(".");
cSaveFileName = "Text";

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
% 交互性 — Interactivity
% Visible — 可见性状态
% 'on' (默认) | on/off 逻辑值
set(tAxesObject,'Visible','off');

tTextObject = text(0,0,'初号');
set(tTextObject,'FontName','宋体');
set(tTextObject,'FontSize',42.1575);


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
