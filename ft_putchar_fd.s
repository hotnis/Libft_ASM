# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_putchar_fd.s                                    :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mzane <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/06/12 09:36:29 by mzane             #+#    #+#              #
#    Updated: 2015/06/12 09:36:30 by mzane            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

	;; void ft_putchar_fd(int fd, char c)
	;; c va devoir être écrite
	;; 4 le syscall write

%define MACH_SYSCALL(nb) 0x2000000 | nb
%define WRITE 4

global _ft_putchar_fd

section .text
_ft_putchar_fd:
	push rbp
	mov rbp, rsp

putchar_fd:
	push rdi
	mov rdi, rsi
	lea rsi, [rel rsp]
	mov rdx, 1
	mov rax, MACH_SYSCALL(WRITE)
	syscall
	pop rdi

done:
	mov al, dil
	mov rsp, rbp
	pop rbp
	ret