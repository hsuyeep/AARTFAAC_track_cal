% Script to plot the Major and minor cycle iterations and residuals after calib.
% pep/29Nov13
fname = '../Data/SB000_ch30-35_5sec_3hr_9_convcalsol.bin.iter';
iter = load (fname); 
% t_first = 4848762191.58;
t_first = iter (1,1);
num = mjdsec2datenum (t_first); % Convert time of first rec. to datenum

figure;
%    subplot (2,2,1)
    plot ((iter(:,1)-t_first)/86400.+num, iter(:,2), 'ob');
    title ('Major cycle iterations   ');
    axis tight; grid on;
    datetick ('x', 13, 'keepticks'); % Print HH:MM:SS legend on the time axis.
    xlabel (sprintf ('UTC past %s, 00:00:00', datestr(num, 1))); % For datetick
	ylabel ('Number of iterations  ');
	set(gca,'FontSize', 16,'fontWeight','bold')
	set(findall(gcf,'type','text'),'FontSize', 16, 'fontWeight','bold')
	[pathstr, name, ext] = fileparts (fname);	
    % printfig (strcat (strrep (strcat (name, ext), '.', '_')), 8, 4);
    print (strcat (strrep (strcat (name, ext), '.', '_'), '_major.eps'), '-depsc', '-r300');

%   hist (caliter(1,:));
%   title ('Histogram of cal_ext iterations');
%    subplot (2,2,2)
%    plot (iter(:,1)/86400.+num, iter(:,3), 'ob');
%    title ('Major cycle residuals');
%    axis tight; grid on;
%    datetick ('x', 13, 'keepticks'); % Print HH:MM:SS legend on the time axis.
%    xlabel (sprintf ('UTC past %s', datestr(num, 1))); % For datetick
%   hist (stefiter(1,:));
%   title ('Histogram of stefcal iterations');
        
%    subplot (2,2,3) 
    plot ((iter(:,1)-t_first)/86400.+num, iter(:,4), 'ob');
    title ('Minor cycle iterations   ');
    axis tight; grid on;
    datetick ('x', 13, 'keepticks'); % Print HH:MM:SS legend on the time axis.
    xlabel (sprintf ('UTC past %s, 00:00:00', datestr(num, 1))); % For datetick
	ylabel ('Number of iterations  ');
	set(gca,'FontSize', 16,'fontWeight','bold')
	set(findall(gcf,'type','text'),'FontSize', 16, 'fontWeight','bold')
    print (strcat (strrep (strcat (name, ext), '.', '_'), '_minor.eps'), '-depsc', '-r300');

%    subplot (2,2,4)
%    plot (iter(:,1)/86400.+num, iter(:,5), 'ob');
%    title ('Minor cycle residuals');
%    axis tight; grid on;
%    datetick ('x', 13, 'keepticks'); % Print HH:MM:SS legend on the time axis.
%    xlabel (sprintf ('UTC past %s', datestr(num, 1))); % For datetick

%	set(findall(gcf,'type','text'),'FontSize', 16, 'fontWeight','bold')
%	[pathstr, name, ext] = fileparts (fname);	
%    printfig (strcat (strrep (strcat (name, ext), '.', '_')), 8, 4);
	% print (gcf, strcat (strrep (strcat (name, ext), '.', '_'), '.png'), '-dpng'); 
	
% Single plot containing both major and minor cycles, for reduction in page count.
subplot (211);
plot ((iter(:,1)-t_first)/86400.+num, iter(:,2), 'ob');
axis tight; grid on;
ylim([2 6]);
datetick ('x', 13, 'keepticks'); % Print HH:MM:SS legend on the time axis.
xlabel (sprintf ('UTC past %s, 00:00:00', datestr(num, 1))); % For datetick
ylabel ('Major iterations');
set(gca,'FontSize', 16,'fontWeight','bold')
set(findall(gcf,'type','text'),'FontSize', 16, 'fontWeight','bold')

subplot (212);
plot ((iter(:,1)-t_first)/86400.+num, iter(:,4), 'ob');
axis tight; grid on;
ylim([0 65]);
set (gca, 'YTick', [15 30 45 60]); 
set (gca, 'YTickLabel', {'15','30','45','60'}); 
datetick ('x', 15, 'keepticks'); % Print HH:MM:SS legend on the time axis.
xlabel (sprintf ('UTC past %s, 00:00:00', datestr(num, 1))); % For datetick
ylabel ('Minor iterations');
samexaxis ('ytac', 1, 'join');
% p=mtit('Major and Minor cycle iterations',...
% 	   'xoff',-.07,'yoff',.015);
set(gca,'FontSize', 16,'fontWeight','bold')
set(findall(gcf,'type','text'),'FontSize', 16, 'fontWeight','bold')
print (strcat (strrep (strcat (name, ext), '.', '_'), '_majmin.eps'), '-depsc', '-r300');
