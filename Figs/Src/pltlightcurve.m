% Script to plot light curves of peak fluxes of  selected bright sources from 
% calirbated images.
% pep/29Nov13

fname = '../Data/SB002_LBA_OUTER_SPREAD_1ch_6_convcal_7_el_fftimg.bin_save.mat.tseries';
tseries = load (fname);
srcname = {'3C10'; '3C452'; '3C390.3'; '3C380'; '3C295'; '3C338'};
nsrcs = size (tseries, 2) - 1;
num = mjdsec2datenum (tseries(1,1));
% col = {'b-', 'm-', 'r-', 'k-', 'g-', 'y-', 'w-', 'c-'};
col = {'k-'};
for ind = 1:nsrcs
        subplot (nsrcs, 1, ind);
        % For smoothening
%       dat0 = peakfl (ind, :);
%       dat = peakfl(ind, isnan(peakfl(ind,:)) == 0);
%       dat = conv (dat, 1/winsize*ones (1,winsize), 'same');
%       dat0 (isnan(peakfl(ind,:)) == 0) = dat;
%       plot (dat0); grid on; axis tight;
        plot (tseries (:, 1)/86400 + num, tseries (:, ind+1), char (col(1))); 
% 		hold on;
		grid on; axis tight;  
		ylim ([0 20]);
        legend (sprintf ('%s', srcname{ind}));
		datetick ('x', 13, 'keepticks'); % Print HH:MM:SS legend on the time axis.
end

	[pathstr, name, ext] = fileparts (fname);	
	print (gcf, strcat (strrep (strcat (name, ext), '.', '_'), '.png'), '-dpng'); 
% print (gcf, '../SB002_LBA_OUTER_SPREAD_1ch_6_convcal_7_el_fftimg.bin_save.mat.tseries.png', '-dpng');
