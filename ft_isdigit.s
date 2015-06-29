# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_isdigit.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mzane <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/06/12 07:28:35 by mzane             #+#    #+#              #
#    Updated: 2015/06/12 07:28:38 by mzane            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global _ft_isdigit

section .text
_ft_isdigit:
	cmp rdi, 48
	jl not_digit

	cmp rdi, 57
	jg not_digit

is_digit:
	mov rax, 1
	jmp return

not_digit:
	mov rax, 0
	jmp return

return:
	ret
