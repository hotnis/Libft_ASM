# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_isascii.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mzane <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/06/12 07:28:35 by mzane             #+#    #+#              #
#    Updated: 2015/06/12 07:28:38 by mzane            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global _ft_isascii

section .text
_ft_isascii:
	cmp rdi, 0
	jl not_ascii
	cmp rdi, 127
	jg not_ascii

is_ascii:
	mov rax, 1
	jmp return

not_ascii:
	mov rax, 0
	jmp return

return:
	ret
