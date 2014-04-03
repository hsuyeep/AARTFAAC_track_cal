% Generates plots of model source flux estimates as a function of time.
% pep/29Nov13

close all;
fname = '../Data/combined_SB002_2_convcalsol.bin.sigmas';
% fname = '../Data/SB000_ch30-35_5sec_3hr_9_convcalsol.bin.sigmas';
% fname = '../Data/SB000_LBA_OUTER_2222-2258_1ch_1_convcalsol.bin.sigmas';
% fname = '../Data/SB002_LBA_OUTER_SPREAD_1ch_8_convcalsol.bin.sigmas';
col = {'b*', 'mo', 'r>', 'kd', 'g+', 'y*', 'w*', 'c*'};

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
set (gca, 'XTick', [101, 201, 301, 401, 501, 601, 701]);
set (gca, 'XTickLabel', {'03:43', '03:52', '04:01', '04:06', '04:15', '04:28', '04:34'});

% Comment when plotting dawn data
% datetick ('x', 13, 'keepticks'); % Print HH:MM:SS legend on the time axis.
title ('Estimated A-team flux');
xlabel (sprintf ('UTC past %s, 00:00:00', datestr(num, 1))); ylabel ('Flux (arbit)');
legend ('3C461 (CasA)', '3C405 (CygA)', '3C144 (TauA)', '3C274 (VirA)', ...
   'Sun');
grid; 
axis tight;
ylim ([1 1700])
set(gca,'FontSize', 16,'fontWeight','bold')
set(findall(gcf,'type','text'),'FontSize', 16, 'fontWeight','bold')
[pathstr, name, ext] = fileparts (fname);	
print (gcf, strcat (strrep (strcat (name, ext), '.', '_'), '.eps'), '-depsc', '-r300'); 

% Now plotting position deviations
figure;
subplot (1,2,1);
colind=1;
ind=3;
while ind < size(flux_tseries, 2)
	plot ((flux_tseries(:,1)-t_first)/86400+num, 180/pi*(flux_tseries(:,ind)), char(col(colind)));
	colind = colind + 1;
	ind=ind+3;
	hold on;
end;
grid on;
axis tight;
title (sprintf ('Cat-WSF ele. resid(deg)'));
datetick ('x', 13, 'keepticks'); % Print HH:MM:SS legend on the time axis.
ylabel ('Deviation (deg)');
ylim([-0.5 0.5]);
    
subplot (1,2,2);
colind=1;
ind=4;
while ind <= size(flux_tseries, 2)
	plot ((flux_tseries(:,1)-t_first)/86400+num, 180/pi*(flux_tseries(:,ind)), char(col(colind)));
	colind = colind + 1;
	ind=ind+3;
	hold on;
end;
grid on;
axis tight;
title (sprintf ('Cat-WSF azi. resid(deg)'));
datetick ('x', 13, 'keepticks'); % Print HH:MM:SS legend on the time axis.
ylabel ('Deviation (deg)');
ylim([-0.5 0.5]);
legend ('3C461 (CasA)', '3C405 (CygA)', '3C144 (TauA)', '3C274 (VirA)', ...
   'Sun');
% print (gcf, '3hrsrcposoff.png', '-dpng');
