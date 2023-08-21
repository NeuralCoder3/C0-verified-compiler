.PHONY: clean makefile coq

coq: makefile
	$(MAKE) -f CoqMakefile

makefile: 
	coq_makefile -f _CoqProject -o CoqMakefile

clean:
	rm -f CoqMakefile ./**/*.vo* ./**/*.glob ./**/*.ml ./**/*.mli ./**/.*.aux ./**/.*.d ./**/.*.cache ./**/*.conf

all: coq