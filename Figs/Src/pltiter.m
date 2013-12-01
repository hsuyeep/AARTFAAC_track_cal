% Script to plot the Major and minor cycle iterations and residuals after calib.
% pep/29Nov13
fname = '../Data/SB000_ch30-35_5sec_3hr_9_convcalsol.bin.iter';
iter = load (fname); 
% t_first = 4848762191.58;
t_first = iter (1,1);
num = mjdsec2datenum (t_first); % Convert time of first rec. to datenum

figure;
    subplot (2,2,1)
    plot (iter(:,1)/86400.+num, iter(:,2), 'ob');
    title ('Major cycle iterations over time');
    axis tight; grid on;
    datetick ('x', 13, 'keepticks'); % Print HH:MM:SS legend on the time axis.
    xlabel (sprintf ('UTC past %s', datestr(num, 1))); % For datetick
%   hist (caliter(1,:));
%   title ('Histogram of cal_ext iterations');
    subplot (2,2,2)
    plot (iter(:,1)/86400.+num, iter(:,3), 'ob');
    title ('Major cycle residuals');
    axis tight; grid on;
    datetick ('x', 13, 'keepticks'); % Print HH:MM:SS legend on the time axis.
    xlabel (sprintf ('UTC past %s', datestr(num, 1))); % For datetick
%   hist (stefiter(1,:));
%   title ('Histogram of stefcal iterations');
        
    subplot (2,2,3) 
    plot (iter(:,1)/86400.+num, iter(:,4), 'ob');
    title ('Minor cycle iterations over time');
    axis tight; grid on;
    datetick ('x', 13, 'keepticks'); % Print HH:MM:SS legend on the time axis.
    xlabel (sprintf ('UTC past %s', datestr(num, 1))); % For datetick

    subplot (2,2,4)
    plot (iter(:,1)/86400.+num, iter(:,5), 'ob');
    title ('Minor cycle residuals');
    axis tight; grid on;
    datetick ('x', 13, 'keepticks'); % Print HH:MM:SS legend on the time axis.
    xlabel (sprintf ('UTC past %s', datestr(num, 1))); % For datetick

	set(findall(gcf,'type','text'),'FontSize', 16, 'fontWeight','bold')
	[pathstr, name, ext] = fileparts (fname);	
	print (gcf, strcat (strrep (strcat (name, ext), '.', '_'), '.png'), '-dpng'); 
