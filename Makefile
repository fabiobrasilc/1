#####################################################
# TeX Makefile
# Author: Xu Cheng
#
# Modified by Manjari Narayan, 2015
#
# This Makefile is used to compile LaTeX documents
# Included is basic support for BibTeX bibliographies
#
# This Makefile is written based on below document:
# http://www.physics.wm.edu/~norman/thesis/Makefile
#####################################################

# Name of the main tex document(without .tex suffix)
TARGET = thesis

# Tex commands
LATEX=pdflatex
LATEXOPT=--shell-escape
NONSTOP=--interaction=nonstopmode

LATEXMK=latexmk
LATEXMKOPT=-pdf
CONTINUOUS=-pvc

# Source Paths
SRCDIR = .
BIBDIR = .
# Source Files
TEXSRC = $(foreach VAR,$(SRCDIR),$(wildcard $(VAR)/*.tex))
BIBSRC = $(foreach VAR,$(BIBDIR),$(wildcard $(VAR)/*.bib))
# FIGURES := $(shell find figures/* images/* -type f)

# If the BIBSRC is not empty
# then we need to generate the bbl database
ifneq ($(strip $(BIBSRC)),)
   BBLSRC = $(TARGET).bbl
endif

# OS detected
ifeq ($(OS),Windows_NT)
	ifneq ($(findstring .exe,$(SHELL)),)
    OS_TYPE := Windows
	else
    OS_TYPE := Cygwin
	endif
else
    OS_TYPE := $(shell uname -s)
endif

# Program Defintions

# TEX    = pdflatex -shell-escape -interaction nonstopmode
 TEX = $(LATEXMK) $(LATEXMKOPT) $(CONTINUOUS)
#TEX = $(LATEX) $(LATEXOPT) $(NONSTOP)
BIBTEX = bibtex
RM     = $(if $(filter $(OS_TYPE),Windows),del /f /q ,rm -f )
GS     = gs -q -dNOPAUSE -dBATCH -sDEVICE = pdfwrite

default all : $(TARGET).pdf


clean:
	-$(RM) *.acn *.acr *.alg *.aux *.bbl \
			*.blg *.dvi *.fdb_latexmk *.glg *.glo \
			*.gls *.idx *.ilg *.ind *.ist \
			*.lof *.log *.lot *.maf *.mtc \
			*.mtc0 *.nav *.nlo *.out *.pdfsync \
			*.pyg *.snm *.synctex.gz *.thm *.toc \
			*.vrb *.xdy *.tdo
	-@echo "clean project done."

reallyclean:
	-$(RM) *.acn *.acr *.alg *.aux *.bbl \
			*.blg *.dvi *.fdb_latexmk *.glg *.glo \
			*.gls *.idx *.ilg *.ind *.ist \
			*.lof *.log *.lot *.maf *.mtc \
			*.mtc0 *.nav *.nlo *.out *.pdfsync \
			*.pyg *.snm *.synctex.gz *.thm *.toc \
			*.vrb *.xdy *.tdo \
			$(TARGET).pdf
	-@echo "really clean project done."

open:
	-@echo "Open $(TARGET).pdf"
ifeq ($(OS_TYPE),Windows)
	-@start /b cmd /c "$(TARGET).pdf"
else
ifeq ($(OS_TYPE),Cygwin)
	-@cygstart $(TARGET).pdf
else
	-$(TARGET).pdf &
endif
endif


# To generate a .pdf file from a .tex file
# Note: LaTeX must be run multiple times to get the proper
#       cross referencing from the \ref and \cite commands
#       and to generate correct hyperref and contents.
%.pdf : %.tex
	@echo "======================== TEX -> PDF ============================"
	@$(TEX) $(*F)
	@$(TEX) $(*F)
	makeindex -s $(TARGET).ist -t $(TARGET).glg -o $(TARGET).gls $(TARGET).glo

# To generate a .bbl file from a .tex file
%.bbl : %.aux
ifneq ($(strip $(BIBSRC)),)
	@echo "======================== AUX -> BBL ============================"
	@$(BIBTEX) $(basename $(*F))
endif

# To generate a .aux file from a .tex file
%.aux :	%.tex
	@echo "======================== TEX -> AUX ============================"
	@$(TEX) $(*F)

publish:
	rm -rf PDFs
	mkdir PDFs
	for f in **/*.pdf; do \
		fnew=`echo $$f | sed 's|/|_|'`; \
		cp $$f PDFs/$$fnew; \
	done

# Dependencies
# DO NOT DELETE
$(TARGET).tex : $(TEXSRC)
$(TARGET).bbl : $(TEXSRC) $(BIBSRC)
$(TARGET).pdf : $(TEXSRC) $(BBLSRC)
#$(TARGET).gls : makeindex -s $(TARGET).ist -t $(TARGET).glg -o $(TARGET).gls $(TARGET).glo
#$(TARGET).pdf : $(TEXSRC) $(BBLSRC) $(TARGET).gls


.PHONY:default all clean reallyclean open
