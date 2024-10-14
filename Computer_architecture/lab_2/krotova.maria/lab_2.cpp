#include <stdio.h>
#include <conio.h>

int main (void)
{
    int aa;
    clrscr();

    int A[10] = {2, 1, 2, 3, 4, 5, 6, 7, 8, 9};
    int B[10] = {1, 1, 0, 0, 0, 0, 0, 0, 0, 0};
    A[0] = 2;

    printf("---------- 1 ----------\n");
    int a = 10;
    int b = 10;
    int result = 0;

    printf("int a = %d\nint b = %d\n", a, b);

    // CMP
    asm {
        mov ax, a
        mov bx, b
        cmp ax, bx
        jne not_equal
        mov result, 0
    }
    
    not_equal: asm {
        ja greater
        jb less
    }
    
    greater: asm {
        mov result, 1
        jmp end_cmp
    }
    
    less: asm {
        mov result, -1
    }
    
    end_cmp: asm {
    }
    
    printf("cmp result: %d\n", result);

    // AND
    asm {
        mov ax, a
        and ax, b
        mov result, ax
    }

    printf("and result: %d\n", result);

    // LOOP
    int count = 5;
    asm {
        mov cx, count
    }

    loop_start: asm {
        dec a
        loop loop_start
    }

    printf("loop result: a = %d\n", a);

    // ROR
    asm {
        mov ax, a
        ror ax, 1
        mov result, ax
    }

    printf("ror result: %d\n", result);
    getch();

    printf("---------- 2 ----------\n");
    asm {
        lea bx, A[0]
        lea si, B[0]
        mov cx, 10
    }

    label: asm {
        mov ax, ss:[bx]
        mov ss:[si], ax
        add bx, 2
        add si, 2
        loop label
    }

    for (int k = 0; k < 10; k++) {
        printf("%d\n", B[k]);
    }
    getch();

    printf("---------- 3 ----------\n");
    printf("si = %x \n di = %x \n", _SI, _DI);

    asm {
        cld
        mov cx, 10
        les si, A[0]
        lea di, B[0]
        push ds
        mov ax, es
        mov ds, ax
        rep movsw
        pop ds
    }

    printf("si = %x \n di = %x \n", _SI, _DI);
    getch();

    printf("---------- 4 ----------\n");
    int far *pA = (int*) A;
    int far *pB = (int*) B;
    asm {
        push es
        push ds
        cld
        lds si, pA
        les di, pB
        mov cx, 10
        rep movsw
        pop ds
        pop es
    }

    for (int i = 0; i < 10; i++) {
        printf("%d\n", B[i])
    }
    getch();

    printf("---------- 5 ----------\n");
    int far *p1 = (int*) 0xb8000000;
    int far *p2 = (int*) 0xb8500000;

    asm {
        push es
        push ds

        lds si, p1
        les di, p2
        mov cx, 128

        rep movsw
        pop ds
        pop es
    }

    printf("B[]:\n");
    for (int j = 0; j < 10; j++) {
        printf("%d\n", B[j]);
    }
    getch();
    return 0;
}