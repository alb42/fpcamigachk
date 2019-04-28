.PHONY: all
.DEFAULT_GOAL:=all
.PRECIOUS: %.x %.y

RESULTS=execchk.diff amigadoschk.diff agfxchk.diff intuitionchk.diff utilitychk.diff

CC=gcc
FPC=fpc
H2PAS=h2paschk
DIFF=diff

%.c: %.chk
	@echo
	@echo "#### Start checking $<"
	$(H2PAS) $<
%.pas: %.chk
	$(H2PAS) $<
%.x: %.c
	$(CC) -o $@x $<
	@./$@x >$@
	@rm -rf *.o *.xx
%.y: %.pas
	$(FPC) -B -o$@y $<
	@./$@y >$@
	@rm -rf *.o *.yy
%.diff: %.x %.y
	$(DIFF) $^ >$@
clean:
	@rm -rf *.o *.c *.pas *.x *.y *.xx *.yy *.diff
all: clean $(RESULTS)
	@ls -s *.diff
	@echo "### All done"
