# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcpy.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mzane <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/06/12 11:24:26 by mzane             #+#    #+#              #
#    Updated: 2015/06/12 11:24:27 by mzane            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

	;; void *strcpy(void *dst, const void *src, size_t n)
	;; memcpy ecrit les n premiers caractères de dst dans src
	;; rdi -> dst
	;; rsi -> src
	;; rdx -> len

global _ft_strcpy

section .text
_ft_strcpy:
	mov rax, rdi
	test rdi, rdi
	jz done
	test rsi, rsi
	jz done

	mov r8, rdi
	mov r9, rsi
	xor rcx, rcx

next:
	cmp byte[rsi + rcx], 0x0
	mov al, byte[rsi + rcx]
	mov byte[rdi + rcx], al
	je end
	inc rcx
	jmp next

end:
	mov rdi, r8
	mov rsi, r9
	mov rax, rdi

done:
	ret