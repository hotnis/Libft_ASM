# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strdup.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mzane <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/06/12 07:30:05 by mzane             #+#    #+#              #
#    Updated: 2015/06/12 07:30:09 by mzane            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

	;; char *strdup(const char *s1)
	;; rdi -> s1
	;; extern malloc
	;; call malloc
	;; malloc va chercher le nombre de bytes à allouer dans rdi.

global _ft_strdup

section .text
	extern	_malloc
	extern	_ft_memcpy
	extern	_ft_strlen

_ft_strdup:
 	push	rdi					;string à copier sauvée
	call	_ft_strlen			;on appelle strlen pour avoir la bonne taille
	inc		rax					;on donne +1 à la taille pour le \0
	mov		r12, rax			;la len
	push	r12					;len sauvée
	mov		rdi, rax			;malloc cherchera sa taille dans rdi
	push 	rdi					;pour aligner la stack, sinon SEGFAULT
	call	_malloc
	pop 	rdi					;on aligne la stack
	pop		r12					;len rappelée
	pop		rdi					;string rappelée
	mov		[rax + r12], byte 0	;le \0
	mov		rsi, rdi			;on met la string dans rsi pour memcpy
	mov		rdi, rax			;l adresse du malloc pour rdi
	mov		rdx, r12			;on met la len dans rdx
	call	_ft_memcpy
	ret