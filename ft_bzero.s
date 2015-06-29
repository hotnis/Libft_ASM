# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_bzero.s                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mzane <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/06/12 07:28:35 by mzane             #+#    #+#              #
#    Updated: 2015/06/12 07:28:38 by mzane            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

	;; void bzero(void *s, size_t n)
	;; s est la string à mettre à \0
	;; n est le nombre de \0
	;; rdi -> s
	;; rsi -> n
	;; 0x0 est le \0 du asm.

global _ft_bzero

section .text
_ft_bzero:
	mov r10, rsi ; Recupere le parametre n
	xor rcx, rcx ; Met a zero le compteur

next:
	cmp rcx, r10 ; on compare
	jge done	; superieur ou egal
	mov byte[rdi + rcx], 0 ; on stock byte 0
	inc rcx ; on incremente
	jmp next ; ca fait office d un whie

done:
	ret
