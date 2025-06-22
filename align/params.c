struct A {
    char x;
    long y;
};

struct __attribute__((packed)) B {
    char x;
    long y;
};

long foo(struct A a) { //a je u registrima rdi i rsi
    return (long)a.x + a.y;
}

long bar(struct B b) { //b je prosledjen preko steka
    return (long)b.x + b.y;
}

int main() {
    struct A a = {'a', 1};
    struct B b = {'b', 1};

    int ra = foo(a);
    int rb = bar(b);

    return ra + rb;
}
