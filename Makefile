SOURCE=./src/alsa
TARGET=$(HOME)/.config/awesome/alsa


all: install

install:
	mkdir -p $(TARGET)
	cp -r $(SOURCE)/init.lua $(TARGET)/init.lua

uninstall:
	rm -rf $(TARGET)
