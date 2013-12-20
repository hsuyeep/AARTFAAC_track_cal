% Script to plot the output of cmpcalsol in the form of cmpcalsol.txt
% pep/01Dec13

load ('../Data/cmpcalsol.txt');

t_first = cmpcalsol(1,1);
num = mjdsec2datenum (t_first);
sel = cmpcalsol (:,1) == 0; % Times with no data
plot (cmpcalsol (sel==0,1)/86400+num, cmpcalsol(sel==0,2), 'ro');
ylabel ('MSE Phase error (rad)');
hold on;
grid on;
axis tight;
title ('Temporal variation of phase error between calib. sols.');
datetick ('x', 13, 'keepticks'); % Print HH:MM:SS legend on the time axis.
set(gca,'FontSize', 16,'fontWeight','bold')
set(findall(gcf,'type','text'),'FontSize', 16, 'fontWeight','bold')
print (gcf, '../cmpcalsol.png', '-dpng', '-r300');
