SINGELI = singeli

help:
	@echo 'Usage: make 1.out CBQNDIR=path/to/CBQN SINGELI=path/to/singeli/singeli [CC=custom-cc]'


gen/1.c: 1.singeli
	$(SINGELI) -l cbqn=$(CBQNDIR) -o gen/1.c 1.singeli

gen/table16.c: 1_prep.bqn
	./1_prep.bqn

1.out: test.c gen/1.c gen/table16.c
	$(CC) -fno-strict-aliasing -g -o 1.out -O3 -march=native test.c

clean:
	rm 1.out gen/1.c gen/table16.c
