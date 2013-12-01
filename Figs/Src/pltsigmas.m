% Generates plots of model source flux estimates as a function of time.
% pep/29Nov13

fname = '../Data/combined_SB002_2_convcalsol.bin.sigmas';
col = {'b*', 'm*', 'r*', 'k*', 'g*', 'y*', 'w*', 'c*'};
% flux_tseries = load ('../Data/SB000_LBA_OUTER_2222-2258_1ch_1_convcalsol.bin.sigmas');
%  flux_tseries = load ('../Data/SB002_LBA_OUTER_SPREAD_1ch_8_convcalsol.bin.sigmas');

%%%% NOTE SPECIAL TICK LOCATIONS FOR THE COMBINED DAWN DATA!!! %%%%
flux_tseries = load (fname);

% num = mjdsec2datenum (flux_tseries(1,1)-1/86400.);
t_first = flux_tseries(1,1);
num = mjdsec2datenum (t_first);
colind = 1;
ind = 2;
while ind < size(flux_tseries, 2)
	% plot ((flux_tseries(:,1)-t_first)/86400+num, flux_tseries(:,ind), char(col(colind)));

	%%%% USE THIS plot command ONLY FOR DAWN DATA
	plot (flux_tseries(:,ind), char(col(colind)));
	colind = colind + 1;
	ind = ind + 3;
	hold on;
end;
%%%% USE THIS axis setting ONLY FOR DAWN DATA
set (gca, 'XTick', [101, 201, 301, 401, 501, 601, 701, 801]);
set (gca, 'XTickLabel', {'03:34:16', '03:43:11', '03:52:10', '04:01:13', '04:06:29', '04:15:30', '04:28:58', '04:34:21'});

% datetick ('x', 13, 'keepticks'); % Print HH:MM:SS legend on the time axis.
title ('Estimated A-team flux');
xlabel (sprintf ('UTC past %s', datestr(num, 1))); ylabel ('Flux (arbit)');
legend ('3C461 (CasA)', '3C405 (CygA)', '3C144 (TauA)', '3C274 (VirA)', ...
   'Sun');
grid; 
axis tight;
ylim ([1 1700])
[pathstr, name, ext] = fileparts (fname);	
print (gcf, strcat (strrep (strcat (name, ext), '.', '_'), '.png'), '-dpng'); 
% print (gcf, '../SB002_LBA_OUTER_SPREAD_1ch_8_convcalsol.bin.sigmas.png', '-dpng');
% print (gcf, '../SB000_LBA_OUTER_2222-2258_1ch_1_convcalsol.bin.sigmas.png', '-dpng');
% print (gcf, '../combined_SB002_2_convcalsol.bin.sigmas.png', '-dpng');

% Now plotting position deviations
figure;
subplot (1,2,1);
colind=1;
ind=3;
while ind < size(flux_tseries, 2)
	plot ((flux_tseries(:,1)-t_first)/86400+num, 180/pi*(flux_tseries(:,ind)), char(col(colind)));
	hold on;
	ind=ind+3;
	colind = colind + 1;
end;
grid on;
axis tight;
title (sprintf ('Cat-WSF ele. resid(deg)'));
datetick ('x', 13, 'keepticks'); % Print HH:MM:SS legend on the time axis.
    
subplot (1,2,2);
colind=1;
ind=4;
while ind < size(flux_tseries, 2)
	plot ((flux_tseries(:,1)-t_first)/86400+num, 180/pi*(flux_tseries(:,ind)), char(col(colind)));
	hold on;
	ind=ind+3;
	colind = colind + 1;
end;
grid on;
axis tight;
title (sprintf ('Cat-WSF azi. resid(deg)'));
datetick ('x', 13, 'keepticks'); % Print HH:MM:SS legend on the time axis.
% print (gcf, 'srcposoff.png', '-dpng');
