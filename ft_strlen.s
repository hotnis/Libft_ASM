# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strlen.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mzane <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/06/12 07:30:05 by mzane             #+#    #+#              #
#    Updated: 2015/06/12 11:48:14 by mzane            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global	_ft_strlen

section	.text

_ft_strlen:
	xor	rcx, rcx
	not	rcx
	xor	al, al
	cld			;on clear les flags pour utiliser repne
	repne	scasb	;rcx va se decrementer
	not	rcx
	dec	rcx
	mov	rax, rcx
	ret
