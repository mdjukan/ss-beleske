#include <stdio.h>
struct A {
    long x;
    long y;
    long k;
};

int main() {
    printf("%zu\n", __alignof(struct A));
}
