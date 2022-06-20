TARGET=autobib.tex

BIBS=$(shell find . -name "*.bib")

all: autobib

autobib: $(BIBS)
	rm -f $(TARGET)
	echo "\\\bibliography{" >> $(TARGET)
	for bib in $^; do \
		echo "$(shell pwd)/$$bib," >> $(TARGET); \
	done
	truncate -s-2 $(TARGET)
	echo "\n}" >> $(TARGET)

clean:
	rm -f $(TARGET)
