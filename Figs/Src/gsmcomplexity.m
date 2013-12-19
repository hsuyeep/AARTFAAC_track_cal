% Script to evaluate the suitability of a sparse point source model containing only
% the first few brightest sources, based on the 3CR catalog.
% NOTES: 
% - Diffuse emission from sky background and the Galaxy is absent, as the sky model
% efficacy is decided only by structured flux. 
% - The top N (=10) bright sources are taken, while the contribution from the rest
% of the catalog is taken to be the rms over their flux, assuming that the vectors
% corresponding to their visibilities do not add up in phase.
% pep/17Dec13

% load ('~/WORK/AARTFAAC/Afaac_matlab_calib/srclist3CR.mat');
% catalog = '3CR';
% fl = [srclist3CR(:).flux];
load ('~/WORK/AARTFAAC/Afaac_matlab_calib/srclistVLSS_20_B1950.mat');
catalog = 'VLSS, all srcs above 20Jy';
fl = [srclistVLSS_20_B1950(:).flux];

fl_sort = sort (fl, 2, 'descend');

nsrc = 10;
% Contribution of top nsrc sources on total flux, assuming all weaker sources add 
% up in phase on the visibility from a given baseline. 
for ind = 1:nsrc
	coh_flux_frac(ind) = fl_sort(ind)/sum(fl_sort);
end;
fprintf (1, 'Catalog used: %s.\n', catalog);
fprintf (1, 'Flux frac. for %d brightest srcs with weak srcs coherently added:\n', nsrc);
fprintf (1, '%s\n', num2str(coh_flux_frac));

% Contribution of remaining weaker sources, when added up out of phase.
weak_rms_fl = var (fl_sort (nsrc:end));
for ind = 1:nsrc 
	incoh_flux_frac(ind) = fl_sort(ind)/(weak_rms_fl + sum(fl_sort(1:nsrc)));
end;
fprintf (1, 'Flux frac. for %d brightest srcs with weak srcs INcoherently added:\n', nsrc);
fprintf (1, '%s\n', num2str(incoh_flux_frac));
