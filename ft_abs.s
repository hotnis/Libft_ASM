# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_abs.s                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mzane <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/06/12 09:37:44 by mzane             #+#    #+#              #
#    Updated: 2015/06/12 11:32:15 by mzane            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

	;; void ft_abs(int n)

global	_ft_abs

section .text

_ft_abs:
	cmp rdi, 0
	jl yes
	mov rax, rdi
	jmp end

yes:
	neg rdi
	mov rax, rdi
	jmp end

end:
	ret
