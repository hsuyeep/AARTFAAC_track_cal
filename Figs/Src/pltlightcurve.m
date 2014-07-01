% Script to plot light curves of peak fluxes of  selected bright sources from 
% calirbated images.
% pep/29Nov13

fname = '../Data/SB002_LBA_OUTER_SPREAD_1ch_6_convcal_7_el_fftimg.bin_save.mat.tseries';
tseries = load (fname);
srcname = {'3C10'; '3C452'; '3C390.3'; '3C380'; '3C295'; '3C338'};
nsrcs = size (tseries, 2) - 1;
t_first = tseries(1,1);
num = mjdsec2datenum (t_first);
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
        plot ((tseries (:, 1)-t_first)/86400. + num, tseries (:, ind+1), char (col(1))); 
%       plot (tseries (:, ind+1), char (col(1))); 
% 		hold on;
		grid on; axis tight;  
		ylim ([0 20]);
		set (gca, 'YTick', [5 10 15]);
		set (gca, 'YTickLabel', {'5', '', '15'});
        legend (sprintf ('%s', srcname{ind}));
		datetick ('x', 15, 'keepticks'); % Print HH:MM:SS legend on the time axis.
		set(gca,'FontSize', 16,'fontWeight','bold')
		set(findall(gcf,'type','text'),'FontSize', 16, 'fontWeight','bold')
end;

samexaxis ('join');
% p=mtit('Light curves of bright field sources',...
% 	   'xoff',-.07,'yoff',.015);
% suplabel ('Light curves of bright field sources', 't');
xlabel ('UTC past 12-Jul-2012, 00:00:00');
suplabel ('Flux (arbit.)', 'y');
set(gca,'FontSize', 16,'fontWeight','bold')
set(findall(gcf,'type','text'),'FontSize', 16, 'fontWeight','bold')
[pathstr, name, ext] = fileparts (fname);	
print (gcf, strcat (strrep (strcat (name, ext), '.', '_'), '.eps'), '-depsc', '-r300'); 

% printfig (strcat (strrep (strcat (name, ext), '.', '_')), 7, 7);

% Plot histograms of each light curve separately as subplots
figure;
for ind = 1:nsrcs
        subplot (1, nsrcs, ind);
		hist (tseries (:, ind+1), 20);
end;
		
%print (gcf, strcat (strrep (strcat (name, ext), '.', '_'), '.png'), '-dpng'); 
