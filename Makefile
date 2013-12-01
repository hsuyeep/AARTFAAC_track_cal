pdf:aartfaac_RT_calib_v1.tex ref.bib
	pdflatex aartfaac_RT_calib_v1
	bibtex aartfaac_RT_calib_v1
	pdflatex aartfaac_RT_calib_v1
	pdflatex aartfaac_RT_calib_v1
	open aartfaac_RT_calib_v1.pdf
	
clean: 
	rm aartfaac_RT_calib_v1.pdf
	rm aartfaac_RT_calib_v1.log
	rm aartfaac_RT_calib_v1.llt
	rm aartfaac_RT_calib_v1.aux
	rm aartfaac_RT_calib_v1.blg
	rm aartfaac_RT_calib_v1.bbl

figs: *.m
	matlab -nodesktop -noFigureWindows -nosplash plt*.m
