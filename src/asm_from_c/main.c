#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

/* define function prototype */
extern uint64_t power(uint64_t a, uint64_t n);
extern uint64_t fast_power(uint64_t a, uint64_t n);

int main(int argc, char *argv[]){
    int i;
    uint64_t a = atoi(argv[1]);
    uint64_t n = atoi(argv[2]);

    if( argc <= 2){
        printf("To few arguments given.\n");
        return 0;
    }

    printf(
        "The value of %s^%s is %llu.\n",
        argv[1],
        argv[2],
        fast_power(a,n)
    );

    printf(
        "The value of %s^%s is %llu.\n",
        argv[1],
        argv[2],
        power(a,n)
    );

    return 0;
}
