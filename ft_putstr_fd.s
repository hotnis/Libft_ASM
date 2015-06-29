# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_putstr_fd.s                                     :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mzane <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/06/12 09:33:06 by mzane             #+#    #+#              #
#    Updated: 2015/06/12 09:33:08 by mzane            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

	;; void ft_putstr_fd(const char *s)
	;; s va devoir être écrite
	;; rdi -> s
	;; rsi -> fd
	;; 4 le syscall write

%define MACH_SYSCALL(nb)		0x2000000 | nb
%define WRITE				4

global _ft_putstr_fd

section .text
	extern 	_ft_strlen			;va s avérer utile

_ft_putstr_fd:
	push	rsi
	mov		r8, rsi
	cmp 	rdi, 0
	je 		.nul
	call 	_ft_strlen
	mov 	rdx, rax				 ;len
	mov 	rcx, rdi				 ;on mov l adresse de la string
	mov 	rax, MACH_SYSCALL(WRITE) ;on va appeler write
	mov 	rdi, r8					 ;là où il a été décidé
	lea 	rsi, [rcx]			 	 ;on load effectiv adress là où on veut écrire
	syscall						 	 ;tout va s écrire
	pop		rsi
	xor		rax, rax
	ret

.nul:
	mov		rdi, r8
	lea 	rsi, [rel null_msg]
	mov 	rdx, 7
	mov 	rax, MACH_SYSCALL(WRITE)
	syscall
	pop		rsi
	xor		rax, rax
	ret

section .data
	null_msg db "(null)", 10
