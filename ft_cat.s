# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_cat.s                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mzane <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/06/12 07:28:35 by mzane             #+#    #+#              #
#    Updated: 2015/06/12 07:28:38 by mzane            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

	;; ft_cat(int fd);
	;; Le but est de boucler tant que read ne trouve pas la fin du fichier.
	;; À la suite de ça, on write ce qu on a obtenu.

%define MACH_SYSCALL(nb)		0x2000000 | nb
%define STDOUT				1
%define READ				3
%define WRITE				4
%define OPEN				5
%define CLOSE				6

section .data
	buff_size	db 1
	buffsize equ $ - buff_size			;pour envoyer 100 plus facilement (100 - 0 = 100)

section .text
	global _ft_cat

_ft_cat:
 	cmp		rdi, 0						;on regarde si il n y a pas d erreur
 	jl		.ret						;si oui on quitte

.while:
	mov		rax, MACH_SYSCALL(READ)
	push	rdi							;pour aligner la stack
	lea		rsi, [rel buff_size]
	mov		rdx, buffsize
	syscall								;on read
	jc		.ret						;si on trouve des erreur
	cmp		rax, 0						;on quitte
	je		.ret
	mov		rax, MACH_SYSCALL(WRITE) 	;on prépare à WRITE ce qu on a read
	mov		rdi, STDOUT					;on choisit l entrée standard
	mov		rdx, buffsize
	syscall
	pop		rdi							;alligner la stack
	jmp		.while						;on recommence

.ret:
	pop		rdi							;allignage de stack
	ret