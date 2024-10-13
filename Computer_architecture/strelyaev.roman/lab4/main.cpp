// main file(module) of cpp project in visual studio
#include <iostream>
#include <chrono>

int main()
{
	const long long loopCount = 1E+8;

	std::chrono::steady_clock timer1;
	auto start = timer1.now();
	for (long long i = 0; i < loopCount; ++i);
	auto end = timer1.now();
	std::cout << "empty loop time in ms: "
		<< std::chrono::duration_cast<std::chrono::milliseconds>(end - start).count() << '\n';

	start = timer1.now();
	for (long long i = 0; i < loopCount; ++i)
	{
		__asm {   // непосредственная адресация
			add eax, 10
		}
	}
	end = timer1.now();
	std::cout << "1 loop time in ms: "
		<< std::chrono::duration_cast<std::chrono::milliseconds>(end - start).count() << '\n';

	start = timer1.now();
	for (long long i = 0; i < loopCount; ++i)
	{
		__asm { // Регистровая адресация
			add eax, ebx
		}
	}
	end = timer1.now();
	std::cout << "2 loop time in ms: "
		<< std::chrono::duration_cast<std::chrono::milliseconds>(end - start).count() << '\n';

	start = timer1.now();
	for (long long i = 0; i < loopCount; ++i)
	{
		__asm { // Косвенно-регистровая адресация. Предполагает, что в регистре находится не сам операнд, а его адрес в памяти
			add eax, [ebx]
		}
	}
	end = timer1.now();
	std::cout << "3 loop time in ms: "
		<< std::chrono::duration_cast<std::chrono::milliseconds>(end - start).count() << '\n';
	
	start = timer1.now();
	{
		int arr[4][3] = {	1, 2, 3,
							4, 5, 6,
							7, 8, 9,
							10, 11, 12 };
		__asm
		{
			lea ebx, arr
			xor ecx, ecx
			xor eax, eax
			mov edx, 12
		}
		for (long long i = 0; i < loopCount; ++i)
		{
			__asm { // Косвенно-регистровая адресация. Предполагает, что в регистре находится не сам операнд, а его адрес в памяти

				add eax, [ebx + ecx * 4]
			}
		}
		end = timer1.now();
		std::cout << "4 loop time in ms: "
			<< std::chrono::duration_cast<std::chrono::milliseconds>(end - start).count() << '\n';
		// Базово-индексная адресация со смещением.  Адрес = базовый регистр + индексный регистр + смещение: mov eax, [rbx + rcx*4 + 8]
	}
	int arr[4][3] = {1, 2, 3,
					 4, 5, 6,
					 7, 8, 9,
					 10, 11, 12};
	int digit = 3; // число, которое будем заменять йоу
	std::cout << "before:\n";
	for (int i = 0; i < 4; i++)
	{
		for (int j = 0; j < 3; j++)
		{
			std::cout << arr[i][j] << " ";
		}
		std::cout << '\n';
	}

	__asm {
		cld
		mov ebx, 2 // 2 - колво четныз строк
		lea edi, [arr + 12] // значение первого элемента первой четной строчки. Каждый элемент занимает 4 байта

		loop1:
			mov eax, digit
			mov ecx, 3 // счетчик элементов в строке. Их 3.
			rep stosd // аналог repmovsb. Кладет из eax -> edi
			add edi, 12
			dec ebx
			cmp ebx, 0
			jne loop1

	}
	std::cout << "after:\n" << "\n";
	for (int i = 0; i < 4; i++)
	{
		for (int j = 0; j < 3; j++)
		{
			std::cout << arr[i][j] << " ";
		}
		std::cout << '\n';
	}
	return 0;
}