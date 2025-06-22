asm: buffer-overflow-basic.c
	gcc -Og -S -masm=intel -fno-stack-protector -fcf-protection=none $<

gdb: buffer-overflow-basic.c
	gcc -Og -masm=intel -fno-stack-protector -fcf-protection=none $< -o basic
	gdb basic
