nothing:

# NEWPROBELM

merge-pdfs: /attachments/problems.pdf

pA/attachments/problems.pdf: */statement/index.pdf
	bash merge_pdfs.sh
