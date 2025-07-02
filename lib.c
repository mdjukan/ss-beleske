extern void foo();
extern int x;

void bar() {
    foo();
    x += 1;
    return;
}
