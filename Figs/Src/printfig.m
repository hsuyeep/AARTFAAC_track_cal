% Script to generate formatted plots for papers etc.
% inputs from http://dgleich.wordpress.com/2013/06/04/creating-high-quality-graphics-in-matlab-for-papers-and-presentations/
% pep/10Dec13

function printfig (fname, width, height);
	% Defaults for this blog post
	if (isempty(width)) 
		width = 3;     % Width in inches
	end;
	if (isempty(height))
		height = 3;    % Height in inches
	end;
	alw = 0.75;    % AxesLineWidth
	% fsz = 16;      % Fontsize
	lw = 1.5;      % LineWidth
	msz = 8;       % MarkerSize
	
	pos = get(gcf, 'Position');
	set(gcf, 'Position', [pos(1) pos(2) width*100, height*100]); %<- Set size
	% set(gca, 'FontSize', fsz, 'LineWidth', alw); %<- Set properties
	set(gca, 'LineWidth', alw); %<- Set properties
	
	% Here we preserve the size of the image when we save it.
	set(gcf,'InvertHardcopy','on');
	set(gcf,'PaperUnits', 'inches');
	papersize = get(gcf, 'PaperSize');
	left = (papersize(1)- width)/2;
	bottom = (papersize(2)- height)/2;
	myfiguresize = [left, bottom, width, height];
	set(gcf,'PaperPosition', myfiguresize);
	
	% Save the file as PNG
	print(fname,'-dpng','-r300');
	
