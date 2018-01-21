PREFIX ?= /usr/local
BINDIR ?= $(PREFIX)/bin
MANDIR ?= $(PREFIX)/share/man
CPLDIR ?= $$(pkg-config --variable=completionsdir bash-completion)

install:
	@echo Installing the executable to $(DESTDIR)$(BINDIR)
	@mkdir -p $(DESTDIR)$(BINDIR)
	@cp -f burrow $(DESTDIR)$(BINDIR)/burrow
	@chmod 755 $(DESTDIR)$(BINDIR)/burrow
	@echo Installing the manual page to $(DESTDIR)$(MANDIR)/man1
	@mkdir -p $(DESTDIR)$(MANDIR)
	@cp -f burrow.1 $(DESTDIR)$(MANDIR)/man1/burrow.1
	@chmod 644 $(DESTDIR)$(MANDIR)/man1/burrow.1
	@echo Installing the command completion to $(DESTDIR)$(CPLDIR)
	@cp -f burrow.d $(DESTDIR)$(CPLDIR)/burrow
	@chmod 644 $(DESTDIR)$(CPLDIR)/burrow

uninstall:
	@echo Removing the executable from $(DESTDIR)$(BINDIR)
	@rm -f $(DESTDIR)$(BINDIR)/burrow
	@echo Removing the manual page from $(DESTDIR)$(MANDIR)/man1
	@rm -f $(DESTDIR)$(BINDIR)/man1/burrow.1
	@echo Removing the command completion from $(DESTDIR)$(CPLDIR)
	@rm -f $(DESTDIR)$(CPLDIR)/burrow

.PHONY: install uninstall
