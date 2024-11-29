abuild:
	nasm -f elf64 "$n".asm -o "$n".o
	ld -o "$n" "$n".o
cbuild:
	grep -n -r "dell"
	g++ "$n".cpp -o "$n"
crun:
	make cbuild n=""$n""
	./"$n"
	rm "$n"
cvrun:
	make cbuild n=""$n""
	valgrind ./"$n"
	rm "$n"
arun:
	make abuild n=""$n""
	./"$n"
	rm "$n"
	rm "$n".o
