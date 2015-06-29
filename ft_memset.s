# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_memset.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mzane <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/06/12 07:16:17 by mzane             #+#    #+#              #
#    Updated: 2015/06/12 11:48:59 by mzane            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

	;; void *memset(void *b, int c, size_t len)
	;; memset va écrire 'c' dans les 'len' premiers bytes de 'b'
	;; memset retourne b
	;; rdi -> b
	;; rsi -> c
	;; rdx -> len

global	_ft_memset

section	.text

_ft_memset:
	push	rdi
	mov	rcx, rdx		;avec les string operator, c est rcx qui est changé
	mov	rax, rsi		;rax va servir au S.O pour trouver le caractère à remplacer
	cld
	rep	stosb			;memset
	pop	rax	
	ret
