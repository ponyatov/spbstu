
PI = $(HOME)/Picat/picat

nod: $(PI) nod.pi
	$^

hello: $(PI) hello.pi
	$^

install: doc $(PI)

PI_VER = 27b12
PI_GZ  = picat$(PI_VER)_linux64.tar.gz
PI_SRC = picat$(PI_VER)_src.tar.gz

GZ ?= $(HOME)/gz

$(PI): $(GZ)/$(PI_GZ)
	tar zx < $< && touch $@
$(GZ)/$(PI_GZ):
	wget -c -O $@ http://picat-lang.org/download/$(PI_GZ)

doc: doc/book.pdf doc/manual.pdf
doc/book.pdf:
	wget -c -O $@ http://picat-lang.org/picatbook2015/constraint_solving_and_planning_with_picat.pdf
doc/manual.pdf:
	wget -c -O $@ http://picat-lang.org/download/picat_guide.pdf
