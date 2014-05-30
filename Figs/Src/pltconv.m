% plot the convergence curves of major and minor cycles on a single timeslice.
% Time : 4.848774159563013e+09
% Freq : 5.487365722656250e+07

load ('../Data/minor_cycle_conv.txt')
semilogy (minor_cycle_conv(:,1), minor_cycle_conv(:,2), '*--');
hold on;
semilogy (minor_cycle_conv(:,1), minor_cycle_conv(:,4), 'r*-');
grid on;
xlabel ('Iteration number');
ylabel ('Change in gain estimates');
%title ('Convergence of minor cycle per timeslice');
%legend ('Convergent cal', 'Tracking cal');
%set(gca,'FontSize', 16,'fontWeight','bold')
%set(findall(gcf,'type','text'),'FontSize', 16, 'fontWeight','bold')
%print (gcf, '../minor_cycle_conv.png', '-dpng');

load ('../Data/major_cycle_conv.txt')
% hold off;
semilogy (major_cycle_conv(:,1), major_cycle_conv(:,2), 'd--');
hold on;
semilogy (major_cycle_conv(:,1), major_cycle_conv(:,4), 'rd-');
grid on;
xlabel ('Iteration number');
ylabel ('Change in parameter estimates');
title ('Convergence of major cycle per time slice');
legend ('Convergent cal. minor cycle ', 'Tracking cal. minor cycle ', ...
        'Convergent cal. major cycle ', 'Tracking cal. major cycle ');
set(gca,'FontSize', 16,'fontWeight','bold')
set(findall(gcf,'type','text'),'FontSize', 16, 'fontWeight','bold')
% print (gcf, '../major_cycle_conv.png', '-dpng');
print (gcf, '../major_minor_cycle_conv.eps', '-depsc', '-r300');
