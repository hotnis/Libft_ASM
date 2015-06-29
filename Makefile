# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mzane <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/06/12 11:31:59 by mzane             #+#    #+#              #
#    Updated: 2015/06/12 11:41:04 by mzane            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME       = libfts.a

ALL_CFLAGS = -f macho64 -g
CC         = ~/.brew/bin/nasm

INC_LIBFT  = libft

OBJS_DIR   = objs

SRCS       = ft_isascii.s\
			ft_isdigit.s\
			ft_isalpha.s\
			ft_isalnum.s\
			ft_isprint.s\
			ft_bzero.s\
			ft_strcat.s\
			ft_strlen.s\
			ft_puts.s\
			ft_toupper.s\
			ft_tolower.s\
			ft_memset.s\
			ft_memcpy.s\
			ft_strdup.s\
			ft_cat.s\
			ft_putchar_fd.s\
			ft_putchar.s\
			ft_putstr.s\
			ft_putstr_fd.s\
			ft_abs.s\
			ft_strcpy.s

S          = $(addprefix , $(SRCS:.s=.s~))

OBJS       = $(addprefix $(OBJS_DIR)/, $(notdir $(SRCS:.s=.o)))

.PHONY: all clean fclean re

all: $(NAME)

$(NAME): $(OBJS)
	@echo "\033[4;1;34m***   Création de la LIBFT   ***\033[0m"
	ar rc $(NAME) $(OBJS)
	ranlib $(NAME)
	@echo "\033[1;32m>>> libftASM ok <<<\033[0m"

$(OBJS_DIR)/%.o: %.s
	$(CC) $(ALL_CFLAGS) $< -o $@

test :
	gcc -Wall -Wextra -Werror main.c -L ./ -lfts -o test
clean:
	$(RM) $(OBJS)	
	$(RM) $(S)
	$(RM) Makefile~
	@echo "\033[4;1;34mClean OBJS    >>\033[0m     \033[1;32mok.\033[0m"

fclean: clean
	$(RM) $(NAME)
	@echo "\033[4;1;34mClean Libft   >>\033[0m     \033[1;32mok.\033[0m"

re: fclean all

$(OBJS): | $(OBJS_DIR)

$(OBJS_DIR):
	mkdir $(OBJS_DIR)
