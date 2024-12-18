#include<iostream.h>
#include<conio.h>
#include<stdio.h>
#include<time.h>

int array[4][3];

void main()
{

	const long long loopCount = 100000000;

	clock_t start = clock();
	for (long long i = 0; i < loopCount; ++i);
	clock_t end = clock();
	cout << "time 0: " << end - start << " \n";


	asm mov bx,100
	start = clock();
	for (i = 0; i < loopCount; ++i)
	{
		asm {
			sub ax, bx
			sub ax, bx
			sub ax, bx
			sub ax, bx
			sub ax, bx
			sub ax, bx
			sub ax, bx
			sub ax, bx
			sub ax, bx
			sub ax, bx
		}
	}
	end = clock();
	cout << "time 1: " << end - start << " \n";
	asm {
		lea bx, array
	}
	start = clock();
	for (i = 0; i < loopCount; ++i)
	{
		asm {
			sub ax, [bx]
			sub ax, [bx]
			sub ax, [bx]
			sub ax, [bx]
			sub ax, [bx]
			sub ax, [bx]
			sub ax, [bx]
			sub ax, [bx]
			sub ax, [bx]
			sub ax, [bx]
		}
	}

	end = clock();
	cout << "time 2: " << end - start << " \n";

	asm {
		mov si, 4
	}

	start = clock();
	for (i = 0; i < loopCount; ++i)
	{
		asm {
			sub ax, [bx + si + 2]
			sub ax, [bx + si + 2]
			sub ax, [bx + si + 2]
			sub ax, [bx + si + 2]
			sub ax, [bx + si + 2]
			sub ax, [bx + si + 2]
			sub ax, [bx + si + 2]
			sub ax, [bx + si + 2]
			sub ax, [bx + si + 2]
			sub ax, [bx + si + 2]
		}
	}
	end = clock();
	cout << "time 3: " << end - start << " \n";

	start = clock();
	for (i = 0; i < loopCount; ++i)
	{
		asm {
			sub[bx], ax
			sub[bx], ax
			sub[bx], ax
			sub[bx], ax
			sub[bx], ax
			sub[bx], ax
			sub[bx], ax
			sub[bx], ax
			sub[bx], ax
			sub[bx], ax
		}
	}

	end = clock();
	cout << "time 4: " << end - start << " \n";
}
