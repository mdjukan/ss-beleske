struct A {
    int x;
    long y;
    int z;
};

struct A foo(int n) {

    if (n <= 1) {
        struct A return_value = {1, 1, 1};
        return return_value;
    }

    struct A ret = foo(n - 1);

    struct A return_value = {ret.x + 1, ret.y + 2, ret.z + 3};
    return return_value;
}
