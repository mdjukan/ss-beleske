TARGET = ex-var

${TARGET}.so : ${TARGET}.c
	gcc -fcf-protection=none -shared -fPIC $< -o $@ -O3

dis : ${TARGET}.so
	objdump --dynamic-reloc $<
	objdump -d -M intel --no-show-raw-insn $<

clean:
	rm ${TARGET}.so
