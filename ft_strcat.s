# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcat.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mzane <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/06/12 07:30:05 by mzane             #+#    #+#              #
#    Updated: 2015/06/12 07:30:09 by mzane            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #
	
	;; char *strcat(char *s1, const char *s2)
	;; s1 est la string qui va avoir s2 en plus d elle
	;; s2 est la chaine à mettre dans s1
	;; rdi -> s1
	;; rsi -> s2
	;; 0x0 est le \0 du asm.

section .text

global _ft_strcat

_ft_strcat:
	mov rax, rdi

src:
	cmp [rdi], byte 0
	je dst
	inc rdi
	jmp src

dst:
    cmp [rsi], byte 0
    je end
    mov cl, [rsi]
    mov [rdi], cl
    inc rsi
    inc rdi
    jmp dst

end:
    mov [rdi], byte 0
	ret