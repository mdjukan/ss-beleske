#include <stdio.h>
#include <stdlib.h>
#include <inttypes.h>

void worm() {
    printf("***worm***\n");
    exit(EXIT_FAILURE);
}

void fill_buffer(char *buffer, char *content, int size) {
    for (int i=0; i<size; i++) {
        buffer[i] = content[i];
    }
}

#define CONTENT (8 * 10)
void foo() {
    char buffer[16];

    void *content = malloc(CONTENT);

    uint64_t wormaddr = (uint64_t)&worm;
    uint8_t wormaddr_split[8];

    for (int i=0; i<8; i++) {
        wormaddr_split[i] = wormaddr & 0xff;
        wormaddr >>= 8;
    }

    uint8_t *cbuf = (uint8_t*)content;
    for (int i=0; i<CONTENT/8; i++) {
        for (int j=0; j<8; j++) {
            cbuf[8*i + j] = wormaddr_split[j];
        }
    }

    fill_buffer(buffer, content, CONTENT);
}

int main() {
    foo();
    printf("***returned from foo***\n");
    return 0;
}
