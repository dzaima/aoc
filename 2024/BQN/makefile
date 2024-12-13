default:
	@echo "Argument of day to build required"

lib12.so: 12_ffi.c
	$(CC) -O3 -shared -o $@ $<

12: lib12.so