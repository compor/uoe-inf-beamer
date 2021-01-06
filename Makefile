#

BUILD_DIR=build
OUTPUT_DIR=out
MAIN=main
OUTPUT_MAIN=$(MAIN).pdf

.PHONY: all clean

all: $(OUTPUT_DIR)/$(OUTPUT_MAIN)

$(OUTPUT_DIR)/$(OUTPUT_MAIN): $(MAIN).tex *.tex *.bib
	latexmk \
		-output-directory=$(BUILD_DIR) \
		-pdf \
		-pdflatex="pdflatex -interactive=nonstopmode --shell-escape %O %S" \
		$(MAIN).tex
	mkdir -p $(OUTPUT_DIR)
	mv $(BUILD_DIR)/$(OUTPUT_MAIN) $(OUTPUT_DIR)

clean:
	latexmk -C $(MAIN)
	rm -f $(MAIN).pdfsync
	rm -rf _minted-*
	rm -rf comment.cut
	rm -rf *~ *.tmp
	rm -f *.bbl *.blg *.aux *.end *.fls *.log *.out *.fdb_latexmk
	rm -rf $@ $(OUTPUT_DIR)
