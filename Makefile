PREFIX ?= /usr
BINDIR ?= $(PREFIX)/bin
MANDIR ?= $(PREFIX)/share/man

install:
	@echo Installing the executable to $(DESTDIR)$(BINDIR)
	@mkdir -p    $(DESTDIR)$(BINDIR)
	@cp -f burrow   $(DESTDIR)$(BINDIR)/burrow
	@chmod 755   $(DESTDIR)$(BINDIR)/burrow
	@echo Installing the manual page to $(DESTDIR)$(MANDIR)/man1
	@mkdir -p    $(DESTDIR)$(MANDIR)
	@cp -f burrow.1 $(DESTDIR)$(MANDIR)/man1/burrow.1
	@chmod 644   $(DESTDIR)$(MANDIR)/man1/burrow.1

uninstall:
	@echo Removing the executable from $(DESTDIR)$(BINDIR)
	@rm -f $(DESTDIR)$(BINDIR)/burrow
	@echo Removing the manual page from $(DESTDIR)$(MANDIR)/man1
	@rm -f $(DESTDIR)$(BINDIR)/man1/burrow.1

.PHONY: install uninstall
