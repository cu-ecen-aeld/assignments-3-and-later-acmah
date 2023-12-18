ifdef CROSS_COMPILE
	GCC=aarch64-none-linux-gnu-gcc
else
	GCC=gcc
endif

default: writer

writer.o: writer.c
	$(GCC) -c writer.c -o writer.o

writer: writer.o
	$(GCC) writer.o -o writer

clean:
	-rm -f writer.o
	-rm -f writer