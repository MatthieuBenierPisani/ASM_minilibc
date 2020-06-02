##
## EPITECH PROJECT, 2018
## Makefile
## File description:
## Makefile
##

SRC =			src/strlen.asm 	\
				src/strchr.asm 	\
				src/memset.asm 	\
				src/memcpy.asm 	\
				src/memmove.asm 	\
				src/strcmp.asm 	\
				src/strncmp.asm 	\
				src/strcasecmp.asm 	\
				src/rindex.asm 	\
				src/strstr.asm 	\
				src/strpbrk.asm 	\
				src/strcspn.asm

CC =			ld

ASM =			nasm

RM =			rm -f

NAME =			libasm.so

OBJ =			$(SRC:.asm=.o)

CFLAGS	=		-shared -fPIC
ASMFLAGS =		-f elf64

%.o: %.asm
			$(ASM) -o $@ $< $(ASMFLAGS)

all:			$(NAME)

$(NAME):		$(OBJ)
			$(CC) $(CFLAGS) -o $(NAME) $(OBJ)

clean:
			$(RM) $(OBJ)

fclean:			clean
			$(RM) $(NAME)

re:			fclean all

.PHONY:		all clean fclean re