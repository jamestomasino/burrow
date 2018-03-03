PREFIX ?= /usr/local
BINDIR ?= $(PREFIX)/bin
MANDIR ?= $(PREFIX)/share/man
ifneq ($(wildcard /etc/bash_completion.d/.),)
	CPLDIR ?= /etc/bash_completion.d
else
ifneq ($(shell command -v pkg-config 2> /dev/null))
	CPLDIR ?= $$(pkg-config --variable=completionsdir bash-completion)
endif
endif

install:
	@echo Installing the executable to $(BINDIR)
	@mkdir -p $(BINDIR)
	@cp -f burrow $(BINDIR)/burrow
	@chmod 755 $(BINDIR)/burrow
	@echo Installing the manual page to $(MANDIR)/man1
	@mkdir -p $(MANDIR)
	@cp -f burrow.1 $(MANDIR)/man1/burrow.1
	@chmod 644 $(MANDIR)/man1/burrow.1
	@echo Installing the command completion to $(CPLDIR)
	@cp -f burrow.d $(CPLDIR)/burrow
	@chmod 644 $(CPLDIR)/burrow

uninstall:
	@echo Removing the executable from $(BINDIR)
	@rm -f $(BINDIR)/burrow
	@echo Removing the manual page from $(MANDIR)/man1
	@rm -f $(BINDIR)/man1/burrow.1
	@echo Removing the command completion from $(CPLDIR)
	@rm -f $(CPLDIR)/burrow

.PHONY: install uninstall
