# `Autobib` Makefile by Jihong Min(hurryman2212 @gmail.com)

TARGET=autobib.tex

BIB_DIR=../biblio

BIBS=$(shell find $(BIB_DIR) -type f -name "*.bib")

all: autobib

autobib: clean
autobib: $(BIBS)
	echo "\\\bibliography{" >> $(TARGET)
	for bib in $(BIBS); do \
		echo "\t$(shell pwd)/$$bib," >> $(TARGET); \
	done
	truncate -s-2 $(TARGET)
	echo "\n}" >> $(TARGET)
	if [ -z "$(BIBS)" ]; then \
		rm -f $(TARGET); \
		touch $(TARGET); \
	fi

clean:
	rm -f $(TARGET)
