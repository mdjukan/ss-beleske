#include <stdio.h>

struct __attribute__((packed)) A {
//struct A {
    char x;
    int y;
    char z;
};

// rdi, rsi
struct A foo() {
    struct A res = {'a', 1, 'b'};
    return res; //rax, rdx
}

int main() {
    printf("[struct A]\n");

    printf("sizeof(struct A)=%zu\n", sizeof(struct A)); //12
    printf("alignof(struct A)=%zu\n", __alignof__(struct A)); //4

    printf("offset(struct A, x)=%zu\n", __builtin_offsetof(struct A, x)); //0
    printf("offset(struct A, y)=%zu\n", __builtin_offsetof(struct A, y)); //4
    printf("offset(struct A, z)=%zu\n", __builtin_offsetof(struct A, z)); //8

    /* printf("offset(struct A, i)=%zu\n", __builtin_offsetof(struct A, i)); */
    /* printf("offset(struct A, j)=%zu\n", __builtin_offsetof(struct A, j)); */
    /* printf("offset(struct A, k)=%zu\n", __builtin_offsetof(struct A, k)); */
}

