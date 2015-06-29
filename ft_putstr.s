# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_putstr.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mzane <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/06/12 09:32:17 by mzane             #+#    #+#              #
#    Updated: 2015/06/12 10:46:55 by mzane            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #
	
	;; void ft_putstr(const char *s)
	;; s va devoir être écrite
	;; rdi -> s
	;; 4 le syscall write

%define MACH_SYSCALL(nb)		0x2000000 | nb
%define STDOUT				1
%define WRITE				4

global _ft_putstr

section .text
	extern 	_ft_strlen			;va s avérer utile

_ft_putstr:
	cmp 	rdi, 0
	je 		.nul
	call 	_ft_strlen
	mov 	rdx, rax				 ;len
	mov 	rcx, rdi				 ;on mov l adresse de la string
	mov 	rax, MACH_SYSCALL(WRITE) ;on va appeler write
	mov 	rdi, STDOUT				 ;dans l entrée standard
	lea 	rsi, [rcx]			 	 ;on load effectiv adress là où on veut écrire
	syscall						 	 ;tout va s écrire
	xor		rax, rax
	ret

.nul:
	mov		rdi, STDOUT
	lea 	rsi, [rel null_msg]
	mov 	rdx, 7
	mov 	rax, MACH_SYSCALL(WRITE)
	syscall
	xor		rax, rax
	ret

section .data
	null_msg db "(null)", 10