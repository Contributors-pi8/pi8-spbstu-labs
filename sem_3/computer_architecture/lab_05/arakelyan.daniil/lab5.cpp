#include <iostream>

// made in vs, win 11, x86 architecture

void shlStack(long int, long int&, long)
{
	__asm
	{
		mov edx, [ebp + 8] // value 
		mov ebx, [ebp + 12] // adres resultata
		mov ecx, [ebp + 16] // counter (shifts)

	shift_loop:
		shl edx, 1 // sdvig mlad 32 bit na odin vlevo
		dec ecx // counter--
		jnz shift_loop

		mov[ebx], edx // save res
	}
}

void shlReg()
{
	__asm
	{
		mov edx, [esi]
		mov ecx, 2

	shift_loop:
		shl edx, 1
		dec ecx
		jnz shift_loop

		mov[ebx], edx
	}
}


long int OP;
long int SHIFTS;
long long int RES;

void shlGlobal()
{
	__asm
	{
		lea esi, OP
		mov edx, [esi]
		mov ecx, SHIFTS

	shift_loop:
		shl edx, 1
		rcl edi, 1
		dec ecx
		jnz shift_loop

		lea ebx, RES
		mov[ebx], edx
	}
}


int main()
{
	long int value = 10;
	long int shifts = 3;
	long res = 0;

	shlStack(value, res, shifts);
	std::cout << "Through the stack: " << res << '\n';


	res = 0;
	__asm
	{
		lea esi, value
		lea ebx, res
	}
	shlReg();
	std::cout << "Through the register: " << res << '\n';


	OP = 10;
	SHIFTS = 1;
	RES = 0;
	shlGlobal();
	std::cout << "With global var's: " << RES << '\n';

	return 0;
}
