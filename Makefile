TARGET		:= 01_select

all:
	@$(MAKE) -C $(TARGET) --no-print-directory

clean:
	@$(MAKE) -C $(TARGET) clean --no-print-directory

distclean:
	rm -rf build/*

run:
	@$(MAKE) -C $(TARGET) run --no-print-directory
	