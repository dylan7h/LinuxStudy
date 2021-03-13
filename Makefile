TARGET		:= 00_select

all:
	@make -C $(TARGET) --no-print-directory

clean:
	@make -C $(TARGET) clean --no-print-directory

run:
	@make -C $(TARGET) run --no-print-directory