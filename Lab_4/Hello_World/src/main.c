#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"

int main()
{
    init_platform();

    print("Hello, World!\n");

    cleanup_platform();
    return 0;
}