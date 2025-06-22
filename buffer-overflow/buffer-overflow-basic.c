#include <stdio.h>
void memwrite(char *buffer, int size) {
    for (int i=0; i<size; i++) {
        buffer[i] = '\xff';
    }

}

void foo() {
    char buffer[10];
    memwrite(buffer, 20);
    printf("returing to main\n");
}

int main() {
    foo();
    printf("returned to main\n");
}
