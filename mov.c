#include <stdio.h>
extern void mov();
extern long x;

int main() {
    mov();

    printf("x=%ld\n", x);

    return 0;
}
