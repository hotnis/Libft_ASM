# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_isalpha.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mzane <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/06/12 07:28:35 by mzane             #+#    #+#              #
#    Updated: 2015/06/12 07:28:38 by mzane            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global _ft_isalpha

section .text
_ft_isalpha:
	cmp rdi, 65		; Comparaison avec A
	jl not_alpha	; Saut si inferrieur à A

	cmp rdi, 122	; Comparaison avec z
	jg not_alpha	; Saut a Faux si superieur à Z

	cmp rdi, 90		; Comparaison avec Z
	jle is_alpha	; Saut a vrai si inferieur ou egal a Z

	cmp rdi, 97		; Comparaison avec a
	jge is_alpha	; Saut a vrai si superieur ou egal a a

	jmp not_alpha

is_alpha:
	mov rax, 1
	jmp return

not_alpha:
	mov rax, 0
	jmp return

return:
	ret
