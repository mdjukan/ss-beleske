SECTIONS {
    SEC 0x1000 : ALIGN(0x100) {
        A.o (SEC1)
        B.o (SEC2)
    }

    .text : {
         *(.text)
    }
}
