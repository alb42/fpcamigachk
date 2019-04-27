.PHONY: all
.DEFAULT_GOAL:=all
CC=gcc
FPC=fpc
H2PAS=h2paschk
DIFF=diff

%.c: %.chk
	$(H2PAS) $<
%.pas: %.chk
	$(H2PAS) $<
%.o: %.c
	$(CC) -c -o $@ $<
%.x: %.o
	$(CC) -o $@ $<
	rm *.o
%.y: %.pas
	$(FPC) -B -o$@ $<
	rm *.o
execchk.diff: execchk.x execchk.y
	./execchk.x >c.out
	./execchk.y >pas.out
	$(DIFF) pas.out c.out >execchk.diff
amigadoschk.diff: amigadoschk.x amigadoschk.y
	./amigadoschk.x >c.out
	./amigadoschk.y >pas.out
	$(DIFF) pas.out c.out >amigadoschk.diff
agfxchk.diff: agfxchk.x agfxchk.y
	./agfxchk.x >c.out
	./agfxchk.y >pas.out
	$(DIFF) pas.out c.out >agfxchk.diff
clean:
	rm -rf *.out *.o *.c *.pas *.x *.y *.diff
all: clean execchk.diff amigadoschk.diff agfxchk.diff
	ls -s *.diff
