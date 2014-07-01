% Script to plot the difference image statistics
% pep/29Nov13
diffstat = load ('../Data/SB001_LBA_OUTER_SPREAD_1ch_1_convcal.bin.diffimg');

%% Column descriptions
%% Integtime rawpairmean rawpairstd diffpairmean diffpairstd sqrt(BT) accrawimgmean accrawimgstd accdiffimgmean accdiffimgstd
% NOTE: Normalizing with largest variance to match theoretical curve.
loglog (2*diffstat(:,1), diffstat(:,6), 'k-'); % Theoretical curve
hold on;
loglog (2*diffstat(:,1), diffstat(:,8), 'r*-'); % Raw image integrated std.
hold on;
loglog (2*diffstat(:,1), diffstat(:,10), 'bs-'); % Difference integrated image
% title ('Noise region std Vs. integration time');
xlabel ('Integration time(secs)');
ylabel ('Normalized noise std.');
set (gca, 'YTick', [0.1:0.1:1]);
grid on;
legend ('Theoretical thermal', 'Raw image', 'Difference Image');
set(gca,'FontSize', 16,'fontWeight','bold')
set(findall(gcf,'type','text'),'FontSize', 16, 'fontWeight','bold')
print (gcf, '../diffimg.eps', '-depsc', '-r300');
