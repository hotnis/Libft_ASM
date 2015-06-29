# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_memcpy.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mzane <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/06/12 07:28:35 by mzane             #+#    #+#              #
#    Updated: 2015/06/12 07:28:38 by mzane            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

	;; void *memcpy(void *dst, const void *src, size_t n)
	;; memcpy ecrit les n premiers caractères de dst dans src
	;; rdi -> dst
	;; rsi -> src
	;; rdx -> len
	
global	_ft_memcpy

section	.text

_ft_memcpy:
	mov	rax, rdi
	mov	rcx, rdx			;string operation -> rcx fait office de compteur
	push	rsi
	cmp 	rsi, 0
	je 	end		
	rep	movsb				;le S.O à effectuer pour copier les premiers caractères.

end:
	pop	rsi
	ret