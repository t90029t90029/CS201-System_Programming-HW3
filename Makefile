# NOTE: All indented lines are indented with a tab character.

.PHONY: clean
CFLAGS = -ansi -pedantic -O0 -Wall -no-pie
DFLAGS = -g

all: hw3

hw3: hw3.o crc.o
	gcc -g -o hw3 $(CFLAGS) $(DFLAGS) hw3.o crc.o

test: hw3.o hw3crc.o
	gcc -g -o hw3test $(CFLAGS) $(DFLAGS) hw3.o hw3crc.o
	
hw3.o: hw3.c
	gcc -c -g -o hw3.o $(CFLAGS) $(DFLAGS) hw3.c

hw3crc.o: hw3crc.s
	as --64 hw3crc.s -o hw3crc.o

crc.o: crc.c
	gcc -c -g -o crc.o $(CFLAGS) $(DFLAGS) crc.c

clean:
	rm -f *.o hw3

zip:
	zip ${USER}_a1.zip Makefile hw3.c crc.c hw3crc.s hw4crc.s

##########################################
#  Add your Make targets below this line #
##########################################

