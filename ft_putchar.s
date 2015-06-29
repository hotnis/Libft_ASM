# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_putchar.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mzane <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/06/12 09:33:52 by mzane             #+#    #+#              #
#    Updated: 2015/06/12 09:33:58 by mzane            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #
	
	;; void ft_putchar(char c)
	;; c va devoir être écrite
	;; 4 le syscall write

%define MACH_SYSCALL(nb) 0x2000000 | nb
%define STDOUT 1
%define WRITE 4

global _ft_putchar

section .text
_ft_putchar:
	push rbp
	mov rbp, rsp

putchar:
	push rdi
	lea rsi, [rel rsp]
	mov rdi, STDOUT
	mov rdx, 1
	mov rax, MACH_SYSCALL(WRITE)
	syscall
	pop rdi

done:
	mov al, dil
	mov rsp, rbp
	pop rbp
	ret