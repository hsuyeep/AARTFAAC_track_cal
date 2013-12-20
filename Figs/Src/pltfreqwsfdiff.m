% Generates plots of model source position estimates as a function of time, and
% frequency.
% pep/29Nov13

col = {'b*', 'm*', 'r*', 'k*', 'g*', 'y*', 'w*', 'c*'};
SB0 = load ('../Data/SB000_LBA_OUTER_SPREAD_1ch_1_convcalsol.bin.sigmas');
SB4 = load ('../Data/SB004_LBA_OUTER_SPREAD_1ch_1_convcalsol.bin.sigmas');

% num = mjdsec2datenum (SB0(1,1)-1/86400.);
t_first = SB0(1,1);
t_last = SB0(end, 1);
num = mjdsec2datenum (t_first);

% Now plotting position deviations
figure;
subplot (211);
colind=1;
ind=3;
% while ind < size(SB0, 2)
	% Plotting only CasA position estimates
	plot ((SB0(:,1)-t_first)/86400+num, 180/pi*(SB0(:,ind)), char(col(colind)));
	hold on;
	colind = colind + 1;
	plot ((SB4(:,1)-t_first)/86400+num, 180/pi*(SB4(:,ind)), char(col(colind)));
	ind=ind+3;
% end;
hold off;
axis tight;
xlabel (sprintf ('UTC past %s', datestr(num, 1))); ylabel ('Azimuth offset');
% axis ([xlim -0.1 0.1]);
grid on;
% set (gca, 'XLim', [num, (t_last-t_first)/86400. + num], 'XTick', linspace (num, (t_last-t_first)/86400. + num, 4));
datetick ('x', 13, 'keepticks'); % Print HH:MM:SS legend on the time axis.
legend ('40 MHz', '70 MHz');
set(gca,'FontSize', 16,'fontWeight','bold')
set(findall(gcf,'type','text'),'FontSize', 16, 'fontWeight','bold')
    
subplot (2,1,2);
colind=1;
ind=4;
% while ind < size(SB0, 2)
	% Plotting only CasA position estimates
	plot ((SB0(:,1)-t_first)/86400+num, 180/pi*(SB0(:,ind)), char(col(colind)));
	colind = colind + 1;
	hold on;
	plot ((SB4(:,1)-t_first)/86400+num, 180/pi*(SB4(:,ind)), char(col(colind)));
	ind=ind+3;
% end;
xlabel (sprintf ('UTC past %s', datestr(num, 1))); ylabel ('Elevation offset  ');
grid on;
axis tight;
% ylim([-0.1 0.1]);
% set (gca, 'XLim', [num, (t_last-t_first)/86400. + num], 'XTick', linspace (num, (t_last-t_first)/86400. + num, 4));
datetick ('x', 13, 'keepticks'); % Print HH:MM:SS legend on the time axis.
legend ('40 MHz', '70 MHz');

samexaxis ('join');
p=mtit('Variation of estimated position of CasA from catalog position.     ',...
	   'xoff',-.07,'yoff',.015);
set(gca,'FontSize', 16,'fontWeight','bold')
set(findall(gcf,'type','text'),'FontSize', 16, 'fontWeight','bold')
print (gcf, '../CasAsrcposoff.png', '-dpng', '-r300');
