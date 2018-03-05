PREFIX ?= /usr/local
BINDIR ?= $(PREFIX)/bin
MANDIR ?= $(PREFIX)/share/man

# Attempt to find bash completion dir in order of preference
ifneq ($(wildcard /etc/bash_completion.d/.),)
  CPLDIR ?= /etc/bash_completion.d
endif

HAS_BREW := $(shell command -v brew 2> /dev/null)
ifdef HAS_BREW
ifneq ($(wildcard $$(brew --prefix)/etc/bash_completion.d/),)
  CPLDIR ?= $$(brew --prefix)/etc/bash_completion.d
endif
endif

HAS_PKGCONFIG := $(shell command -v pkg-config 2> /dev/null)
ifdef HAS_PKGCONFIG
  CPLDIR ?= $$(pkg-config --variable=completionsdir bash-completion)
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
ifdef CPLDIR
	@echo Installing the command completion to $(CPLDIR)
	@cp -f burrow.d $(CPLDIR)/burrow
	@chmod 644 $(CPLDIR)/burrow
endif

uninstall:
	@echo Removing the executable from $(BINDIR)
	@rm -f $(BINDIR)/burrow
	@echo Removing the manual page from $(MANDIR)/man1
	@rm -f $(BINDIR)/man1/burrow.1
ifdef CPLDIR
	@echo Installing the command completion to $(CPLDIR)
	@echo Removing the command completion from $(CPLDIR)
	@rm -f $(CPLDIR)/burrow
endif

.PHONY: install uninstall
