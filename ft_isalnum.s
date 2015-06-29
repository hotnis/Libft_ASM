# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_isalnum.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mzane <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/06/12 07:28:35 by mzane             #+#    #+#              #
#    Updated: 2015/06/12 07:28:38 by mzane            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global _ft_isalnum
extern _ft_isalpha
extern _ft_isdigit

section .text
_ft_isalnum:
	call _ft_isalpha	; apl isalpha
	mov r12, rax		; r12 <- rax

	push r12			; ajout r12
	call _ft_isdigit 	; apl isdigit
	pop r12				; del r12

	mov r13, rax		;r13 <- rax
	or r12, r13			; r12 || r13
	cmp r12, 0	
	je not_alnum		; is not_alnum
	mov rax, 1 			; retour vaut 1
	jmp return

not_alnum:
	mov rax, 0			;retour 0
	jmp return

return:
	ret
