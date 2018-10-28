PREFIX ?= /usr/local
BINDIR ?= $(PREFIX)/bin
MANDIR ?= $(PREFIX)/share/man/man1

# Attempt to find bash completion dir in order of preference
ifneq ($(wildcard /etc/bash_completion.d/.),)
  CPLDIR ?= /etc/bash_completion.d
endif

HAS_BREW := $(shell command -v brew 2> /dev/null)
ifdef HAS_BREW
  CPLDIR ?= $$(brew --prefix)/etc/bash_completion.d
endif

HAS_PKGCONFIG := $(shell command -v pkg-config 2> /dev/null)
ifdef HAS_PKGCONFIG
  CPLDIR ?= $(shell pkg-config --variable=completionsdir bash-completion 2> /dev/null)
endif

install:
	@echo Installing the executable to $(BINDIR)
	@mkdir -p $(BINDIR)
	@install -m 755 burrow $(BINDIR)
	@echo Installing the manual page to $(MANDIR)/man1
	@mkdir -p $(MANDIR)
	@install -m 644 burrow.1 $(MANDIR)
ifdef CPLDIR
ifneq ($(CPLDIR),)
	@echo Installing the command completion to $(CPLDIR)
	@mkdir -p $(CPLDIR)
	@install -m 644 burrow.d $(CPLDIR)/burrow
endif
endif

uninstall:
	@echo Removing the executable from $(BINDIR)
	@rm -f $(BINDIR)/burrow
	@echo Removing the manual page from $(MANDIR)/man1
	@rm -f $(BINDIR)/man1/burrow.1
ifdef CPLDIR
ifneq ($(CPLDIR),)
	@echo Removing the command completion from $(CPLDIR)
	@rm -f $(CPLDIR)/burrow
endif
endif

.PHONY: install uninstall
