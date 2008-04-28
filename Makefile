BUILD=build/html
BSTY=$(BUILD)/styles
all: rest2web $(BSTY)/default.css $(BSTY)/favicon.ico \
     $(BSTY)/augeas.css $(BSTY)/generic.css \
     $(BSTY)/default-debug.css $(BSTY)/debug.css \
     $(BSTY)/et_logo.png $(BSTY)/augeas-logo.png \
     $(BSTY)/footer_corner.png $(BSTY)/footer_pattern.png

rest2web:
	python /homes/lutter/packages/rest2web-0.5.1/r2w.py

$(BUILD)/styles/%: pages/styles/%
	mkdir -p $(BUILD)/styles
	cp -a $< $@

sync:
	rsync -rav $(RSYNC_OPTS) $(BUILD)/ et:/var/www/sites/augeas.et.redhat.com/
clean:
	rm -rf $(BUILD)

.PHONY: rest2web sync clean
