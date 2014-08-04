all: templates roms hierarchy 

.PHONY: roms hierarchy templates clean
roms:
	python src/generate_roms.py data/neuron_roms.csv

hierarchy:
	python src/generate_hierarchy.py

templates:
	cheetah compile --nobackup --idir=templates --odir=src -R

clean:
	rm -f src/*.pyc
	rm -rf output/*
