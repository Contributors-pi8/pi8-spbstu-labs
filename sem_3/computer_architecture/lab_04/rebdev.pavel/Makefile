abuild:
	nasm -f elf64 "$n".asm -o "$n".o
	ld -o "$n" "$n".o
cbuild:
	grep -n -r "dell"
	g++ "$n".cpp -o "$n"
run:
	make cbuild n=""$n""
	./"$n"
	rm "$n"
vrun:
	make build n=""$n""
	valgrind ./"$n"
	rm "$n"
