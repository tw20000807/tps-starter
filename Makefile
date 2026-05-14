nothing:

# NEWPROBELM

merge-pdfs: problems.pdf

problems.pdf: */statement/index.pdf
	bash merge_pdfs.sh
