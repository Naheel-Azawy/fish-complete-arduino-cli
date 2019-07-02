PREFIX = /usr/share/fish/completions/

install:
	mkdir -p $(DESTDIR)$(PREFIX)
	cp -f arduino-cli.fish $(DESTDIR)$(PREFIX)

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/arduino-cli.fish
