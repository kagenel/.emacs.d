#! /bin/sh

TARGET = main

TEX = $1
PDF = $(TEX:.tex=.pdf)

TILS = $(shell find * -name *~)
ETCS = $(TARGET).aux $(TARGET).dvi $(TARGET).lof $(TARGET).log $(TARGET).lot $(TARGET).out $(TARGET).toc

all: main

main: $(TEX)
	platex $(TEX)

	pbibtex $(TARGET)

	platex $(TEX)
	platex $(TEX)
#ptex2pdf -l $(TEX)
	dvipdfmx $(TARGET).dvi

	evince $(PDF)
	rm -f $(TILS) $(ETCS)

clean:
	rm -f $(TILS) $(ETCS) $(PDF)
