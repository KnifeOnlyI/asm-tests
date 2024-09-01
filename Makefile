NAME = hello-world

build: clean

main.o: source/main.asm
	nasm -f elf64 -g -F dwarf source/main.asm -o main.o

$(NAME): main.o
	ld -g -o $(NAME) main.o

clean: $(NAME)
	rm -f *.o
	mkdir -p out/bin
	mv $(NAME) out/bin