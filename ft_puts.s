# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_puts.s                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mzane <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/06/12 07:28:57 by mzane             #+#    #+#              #
#    Updated: 2015/06/12 07:29:01 by mzane            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

	;; int puts(const char *s)
	;; s va devoir être écrite
	;; rdi -> s
	;; rax la valeur de retour, un int non négatif
	;; ,10 le \n...
	;; 4 le syscall write

%define MACH_SYSCALL(nb)		0x2000000 | nb
%define STDOUT				1
%define WRITE				4

global	_ft_puts
extern	_ft_strlen				;va s avérer utile

section	.text

_ft_puts:
	cmp	rdi, 0
	je	_null

	; write rdi

	push	rdi
	call	_ft_strlen
	mov	rdx, rax		;len
	pop	rsi
	mov	rdi, STDOUT
	mov	rax, MACH_SYSCALL(WRITE)
	syscall
	jmp	_newl

_null:
	
	; write "(null)"

	lea	rsi, [rel msg]	;impossible d afficher (null)
	mov	rdx, 6
	mov	rdi, STDOUT
	mov	rax, MACH_SYSCALL(WRITE)
	syscall

_newl:
	
	; write new-line character
	
	push	0xa
	mov	rsi, rsp
	mov	rdx, 1
	mov	rdi, STDOUT
	mov	rax, MACH_SYSCALL(WRITE)
	syscall
	pop	rax
	ret


section	.data

msg:
	db "(null)"
