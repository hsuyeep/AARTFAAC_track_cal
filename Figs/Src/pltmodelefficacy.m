% Plot residual visibility norm against increasing model complexity
% Data from Time:  4.848774150503317e+09 Freq:      5.487365722656250e+07
model_efficacy = load ('../Data/model_efficacy.txt');
plot (model_efficacy(:,3), '-*');
% semilogy(model_efficacy(:,3), '-*');
grid on;
xlabel ('Number of model sources  ');
set (gca, 'XTick', [1, 2, 3, 4]);
% ylabel ('$\|Model residue\|_Frob', 'Interpreter','Latex');
ylabel ('$\|$Model residue$\|_{Frob}$ ', 'Interpreter','Latex');
title ('Model residue Vs. model complexity ');
set(gca,'FontSize', 16,'fontWeight','bold')
set(findall(gcf,'type','text'),'FontSize', 16, 'fontWeight','bold')
print (gcf, '../model_efficacy.png', '-dpng', '-r300');
