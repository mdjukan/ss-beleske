#include <stdio.h>

int x = 0;

extern void inc();

int main() {
    x += 1;
    inc();

    printf("%d\n", x); //ocekivana vrednost je 2
}
