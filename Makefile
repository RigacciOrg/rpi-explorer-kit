TARGET = rpi-explorer-kit
PREFIX = $(DESTDIR)/usr/local
BINDIR = $(PREFIX)/bin
LIBDIR = $(PREFIX)/lib/$(TARGET)

BIN_FILES := $(shell cd bin; echo gps-* ntpq2html skyview2svg)
LIB_FILES := $(shell cd lib; echo csvlog-* daemonize-* srv-* take-photo)

.PHONY: all
all: ;

.PHONY: install
install: install-bin install-lib

.PHONY: install-bin
install-bin:
	install -m 755 -o root -g root -D -t $(BINDIR) $(addprefix bin/, $(BIN_FILES))

.PHONY: install-lib
install-lib:
	install -m 755 -o root -g root -D -t $(LIBDIR) $(addprefix lib/, $(LIB_FILES))

.PHONY: uninstall
uninstall:
	-rm -f $(addprefix $(BINDIR)/, $(BIN_FILES))
	-rm -f $(addprefix $(LIBDIR)/, $(LIB_FILES))
	-rmdir $(LIBDIR)
