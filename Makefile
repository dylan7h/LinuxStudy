TARGET		:= 01_select

all:
	@make -C $(TARGET) --no-print-directory

clean:
	@make -C $(TARGET) clean --no-print-directory

distclean:
	rm -rf build/*

run:
	@make -C $(TARGET) run --no-print-directory