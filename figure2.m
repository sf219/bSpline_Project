function figure2

X = 400;
Y = 300;
figure
fig = gcf;
set(groot,'defaulttextinterpreter','default');
set(groot, 'defaultAxesTickLabelInterpreter','default');
set(groot, 'defaultLegendInterpreter','default');
set(fig, 'Position', [0, 0, X, Y]);
set(0, 'DefaultLineLineWidth', 2.5);
fig = gcf;
set(fig, 'Position', [0, 0, X, Y].*2.5)
fig.PaperUnits = 'inches';
fig.PaperPosition = [0 0 X/100 Y/100].*2.5;
%set(gca, 'FontName', 'Trebuchet MS')
set(gca, 'ColorOrder', [1 0 0; 0 0 0; 0 0 1; 0 1 0; 0.75, 0, 0.75], 'NextPlot', 'replacechildren');
set(gca, 'linewidth', 2)
set(gca, 'fontsize', 24)
box off
axis tight
return