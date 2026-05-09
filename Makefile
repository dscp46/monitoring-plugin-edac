# Installation directories (Debian-style)
PLUGIN_DIR ?= /usr/lib/nagios/plugins
NRPE_DIR   ?= /etc/nagios/nrpe.d

PLUGIN     = check_edac
NRPE_CFG   = nrpe.d/check_edac.cfg

all:
	@echo "Nothing to make, please run 'make install'."

.PHONY: install uninstall dist-clean
install:
	install -d $(DESTDIR)$(PLUGIN_DIR)
	install -m 0755 $(PLUGIN) $(DESTDIR)$(PLUGIN_DIR)/$(PLUGIN)

	install -d $(DESTDIR)$(NRPE_DIR)
	install -m 0644 $(NRPE_CFG) $(DESTDIR)$(NRPE_DIR)/check_edac.cfg

uninstall:
	rm -f $(DESTDIR)$(PLUGIN_DIR)/$(PLUGIN)
	rm -f $(DESTDIR)$(NRPE_DIR)/check_edac.cfg

dist-clean:
	rm -rf debian/debhelper-build-stamp debian/files debian/monitoring-plugin-edac debian/monitoring-plugin-edac.substvars



