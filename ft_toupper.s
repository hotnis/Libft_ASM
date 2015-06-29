# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_toupper.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mzane <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/06/12 07:30:05 by mzane             #+#    #+#              #
#    Updated: 2015/06/12 07:30:09 by mzane            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

	;; int toupper(int c)
	;; toupper renvoie la valeur ascii de c modifiée si c est une minuscule.
	;; sinon il renvoie la valeur de c
	;; rdi -> c

global _ft_toupper

section .text
	extern _ft_isalpha

_ft_toupper:
	call	_ft_isalpha
	cmp		rax, 0
	je		.no_toupper
	cmp		rdi, 96
	jg		.toupper
	jmp		.no_toupper

.toupper:
	sub		rdi, 32

.no_toupper:
	mov rax, rdi
	ret
