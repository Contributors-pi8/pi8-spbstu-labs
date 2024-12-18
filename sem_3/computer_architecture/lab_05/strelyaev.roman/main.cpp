#include <iostream>

void addStack(long long int, long long int, long long int&)
{
	// bp указывается на sp (начало стека)
	// a - 8 байт, b - 8 байт и sum - 8 байт. Кладется в порядке sum -> b -> a
	// ip - то, к чему вернется стек после окончания всего
	__asm
	{
		mov esi, [ebp + 24] // &sum -> esi
		mov eax, [ebp + 8] // a[4 нижних байта] -> eax
		mov ebx, [ebp + 16] // b[4 нижних байта] -> ebx
		add eax, ebx // здесь может случится так называемое переполнение

		mov [esi], eax

		mov eax, [ebp + 12] // a[4 вернхних байта] - > eax
		mov ebx, [ebp + 20] // b[4 верх байта] -> ebx

		adc eax, ebx // сложение, учитывая смещение. eax <- eax + ebx + cf (флаг смещение, если есть)
		mov [esi + 4], eax
		// Все эти выкрутасы нужны, потому, что eax - 32 бита, а складываем мы 64 битные числа

	}
}

void addRegs()
{
	__asm
	{
		mov eax, [ebx] // мы используем ebx и edx как указатель на наши операнды
		mov ecx, [edx]
		add eax, ecx

		mov [esi], eax

		mov eax, [ebx + 4]
		mov ecx, [edx + 4]
		adc eax, ecx

		mov [esi + 4], eax
	}
}

long long int a_gl = 0;
long long int b_gl = 0;
long long int sum_gl = 0;

void addGlobal()
{
	__asm
	{
		lea ebx, a_gl
		lea edx, b_gl
		lea esi, sum_gl

		mov eax, [ebx]
		mov ecx, [edx]

		add eax, ecx

		mov [esi], eax
		mov eax, [ebx + 4]
		mov ecx, [edx + 4]

		adc eax, ecx
		mov [esi + 4], eax
	}
}

int main()
{
	setlocale(LC_ALL, "rus");
	long long int a = 0x0000000000003E9;
	std::cout << "a: " << a << '\n';
	long long int b = 0x0000000000f4243;
	std::cout << "b: " << b << "\n";
	long long int sum = 0;
	addStack(a, b, sum);
	std::cout << "Сумма при стеке: " << sum << "\n";

	sum = 0; // обновляем сумму
	__asm
	{
		lea ebx, a
		lea edx, b
		lea esi, sum
	}
	addRegs();
	std::cout << "Сумма при регистрах: " << sum << "\n";

	a_gl = a;
	b_gl = b;
	sum_gl = 0;
	addGlobal();
	std::cout << "Сумма при глобалах: " << sum_gl << "\n";
	return 0;
}