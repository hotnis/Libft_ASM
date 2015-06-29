# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_tolower.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mzane <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/06/12 07:30:05 by mzane             #+#    #+#              #
#    Updated: 2015/06/12 07:30:09 by mzane            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

	;; int tolower(int c)
	;; tolower renvoie la valeur ascii de c modifiée si c est une majuscule.
	;; sinon il renvoie la valeur de c
	;; rdi -> c

global _ft_tolower

section .text
	extern _ft_isalpha

_ft_tolower:
	call	_ft_isalpha
	cmp		rax, 0
	je		.no_tolower
	cmp		rdi, 91
	jl		.tolower
	jmp		.no_tolower

.tolower:
	add		rdi, 32

.no_tolower:
	mov rax, rdi
	ret