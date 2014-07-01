% Script to plot the estimated gains from a format generated by pltcalsol.m
% pep/29Nov13

fname = '../Data/SB002_LBA_OUTER_SPREAD_1ch_8_convcalsol.bin.gains';
% fname = '../Data/combined_SB002_2_convcalsol.bin.gains';
gtseries = load (fname);
t_first = gtseries(1,1);
num = mjdsec2datenum (t_first);
%% col = {'b*-', 'mx:', 'r+-.', 'ks--', 'gd-', 'yv:', 'w^-.', 'c<--'};
col = {'b*', 'mx', 'r+', 'ks', 'gd', 'yv', 'w^', 'c<'};
 
subplot (211);
antoff=23;
colind = 1;
xrng = [1:3:size(gtseries, 1)];
% NOTE: Dawn data has one whole station missing! Hence the -96
for ant=2:96:576 % Plot only one antenna per station
	%%%% USE THIS plot command ONLY FOR DAWN DATA
	% plot (gtseries (:,(antoff+ant)), char(col(colind)));
	plot ((gtseries (xrng,1)-t_first)/86400.+num, gtseries (xrng,(antoff+ant)), char(col(colind)));
	hold on;
	colind = colind + 1;
	fprintf (1, 'Ant: %d, mean ph: %f, var phase: %f\n', ant, mean(gtseries(:,(antoff+ant))), std (gtseries (:, (antoff+ant))));
end;
xlabel (sprintf ('UTC past %s, 00:00:00', datestr(num, 1))); ylabel ('Phase (rad)');
axis tight; grid on;

% Comment for dawn time data.
% datetick ('x', 13, 'keepticks'); % Print HH:MM:SS legend on the time axis.
set(gca,'FontSize', 16,'fontWeight','bold')
set(findall(gcf,'type','text'),'FontSize', 16, 'fontWeight','bold')

subplot (212);
colind = 1;
% NOTE: Dawn data has one whole station missing! Hence the -96
for ant=3:96:576 % Plot only one antenna per station
	%%%% USE THIS plot command ONLY FOR DAWN DATA
	% plot (gtseries (:,(antoff+ant)), char(col(colind)));
	plot ((gtseries (xrng,1)-t_first)/86400.+num, gtseries (xrng,(antoff+ant)), char(col(colind)));
	hold on;
	fprintf (1, 'Ant: %d, mean gain: %f, var gain: %f\n', ant, mean(gtseries(:,(antoff+ant))), std (gtseries (:, (antoff+ant))));
	colind = colind + 1;
end;
xlabel (sprintf ('UTC past %s, 00:00:00', datestr(num, 1))); ylabel ('Amplitude (arbit)');
axis tight; grid on;

datetick ('x', 15, 'keepticks'); % Print HH:MM:SS legend on the time axis.

samexaxis ('join');
% p=mtit('Estimated gain phase and amplitude.  ',...
% 	   'xoff',-.07,'yoff',.015);
set(gca,'FontSize', 16,'fontWeight','bold')
set(findall(gcf,'type','text'),'FontSize', 16, 'fontWeight','bold')
[pathstr, name, ext] = fileparts (fname);	

set(gcf, 'PaperPositionMode', 'manual');
set(gcf, 'PaperUnits', 'inches');
set(gcf, 'PaperPosition', [2.5 2.5 10 10]); % last 2 are width/height.

% print('-depsc2', '-painters', plotfname_eps);

print (gcf, strcat (strrep (strcat (name, ext), '.', '_'), '.eps'), '-depsc', '-r300'); 
% print (gcf, '../SB002_LBA_OUTER_SPREAD_1ch_8_convcalsol.bin.gains.png', '-dpng');
