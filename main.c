/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mzane <marvin@42.fr>                       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2015/06/03 09:39:59 by mzane             #+#    #+#             */
/*   Updated: 2015/06/12 11:40:16 by mzane            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

/* THIS MAIN IS USED TO TEST MY ASM FUNCTIONS */

#include <stdio.h>
#include <ctype.h>
#include <strings.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>
#include <math.h>

int		ft_isascii(int i);
int		ft_isdigit(int i);
int		ft_isalpha(int i);
int		ft_isalnum(int i);
int		ft_isprint(int i);
void	ft_bzero(void *s, size_t n);
char	*ft_strcat(char *s1, const char *s2);
int		ft_strlen(const char *s1);
int		ft_puts(const char *s);
int		ft_toupper(int c);
int		ft_tolower(int c);
void	*ft_memset(void *b, int c, size_t len);
void 	*ft_memcpy(void *dst, const void *src, size_t n);
char	*ft_strdup(const char *s1);
void	ft_cat(int fd);
void	ft_putstr(const char *s);
void	ft_putstr_fd(const char *s, int fd);
int	    ft_putchar(char c);
int	    ft_putchar_fd(char c, int fd);
int 	ft_abs(int a);
char	*ft_strcpy(void *dst, const void *src, size_t n);

void	test_puts(void)
{
	char str[5] = "PUTS";


	printf("\033[1;33m%s\033[0m\n", str); /*c'est printf il bufferise*/
	ft_puts("COUCOU LES GENS");
	ft_puts("J'aime le saucisson, il est ma raison de vivre. Il faut manger pour vivre mais pas l'inverse.");
	ft_puts("");
	ft_puts("Au dessus, c'était une chaine vide");
	ft_puts(NULL);
	ft_puts(NULL);
	ft_puts("Au dessus, c'était deux chaines null");
	printf("\033[1;32m%s passed.\033[0m\n\n", str);
}


void	test_isascii(void)
{
	char *str="ISASCII";
	printf("\033[1;33m%s\033[0m\n", str);
	printf("Mon isascii pour '-1' ->%d\n", ft_isascii(-1));
	printf("Le isascii pour '-1' ->%d\n\n", isascii(-1));
	printf("Mon isascii pour '0' ->%d\n", ft_isascii(0));
	printf("Le isascii pour '0' ->%d\n\n", isascii(0));
	printf("Mon isascii pour '42' ->%d\n", ft_isascii(42));
	printf("Le isascii pour '42' ->%d\n\n", isascii(42));
	printf("Mon isascii pour '127' ->%d\n", ft_isascii(127));
	printf("Le isascii pour '127' ->%d\n\n", isascii(127));
	printf("Mon isascii pour '128' ->%d\n", ft_isascii(128));
	printf("Le isascii pour '128' ->%d\n", isascii(128));
	printf("\033[1;32m%s passed.\033[0m\n\n", str);
}

void	test_isdigit(void)
{
	char *str= "ISDIGIT";
	printf("\033[1;33m%s\033[0m\n", str);
	printf("Mon isdigit pour '-1' ->%d\n", ft_isdigit(-1));
	printf("Le isdigit pour '-1' ->%d\n\n", isdigit(-1));
	printf("Mon isdigit pour '0' ->%d\n", ft_isdigit(0));
	printf("Le isdigit pour '0' ->%d\n\n", isdigit(0));
	printf("Mon isdigit pour '57' ->%d\n", ft_isdigit(57));
	printf("Le isdigit pour '57' ->%d\n\n", isdigit(57));
	printf("Mon isdigit pour '48' ->%d\n", ft_isdigit(48));
	printf("Le isdigit pour '48' ->%d\n\n", isdigit(48));
	printf("Mon isdigit pour '58' ->%d\n", ft_isdigit(58));
	printf("Le isdigit pour '58' ->%d\n", isdigit(58));
	printf("\033[1;32m%s passed.\033[0m\n\n", str);
}

void	test_isalpha(void)
{
	char *str = "ISALPHA";

	printf("\033[1;33m%s\033[0m\n", str);
	printf("Mon isalpha pour '-1' ->%d\n", ft_isalpha(-1));
	printf("Le isalpha pour '-1' ->%d\n\n", isalpha(-1));
	printf("Mon isalpha pour 'a' ->%d\n", ft_isalpha('a'));
	printf("Le isalpha pour 'a' ->%d\n\n", isalpha('a'));
	printf("Mon isalpha pour 'z' ->%d\n", ft_isalpha('z'));
	printf("Le isalpha pour 'z' ->%d\n\n", isalpha('z'));
	printf("Mon isalpha pour '0' ->%d\n", ft_isalpha('0'));
	printf("Le isalpha pour '0' ->%d\n\n", isalpha('0'));
	printf("Mon isalpha pour 64 ->%d\n", ft_isalpha(64));
	printf("Le isalpha pour 64 ->%d\n\n", isalpha(64));
	printf("Mon isalpha pour 122 ->%d\n", ft_isalpha(122));
	printf("Le isalpha pour 122 ->%d\n\n", isalpha(122));
	printf("Mon isalpha pour 96 ->%d\n", ft_isalpha(96));
	printf("Le isalpha pour 96 ->%d\n", isalpha(96));
	printf("\033[1;32m%s passed.\033[0m\n\n", str);
}

void	test_isalnum(void)
{
	char *str;
	str = "ISALNUM";
	printf("\033[1;33m%s\033[0m\n", str);
	printf("Mon isalnum pour 96 ->%d\n", ft_isalnum(96));
	printf("Le isalnum pour 96 ->%d\n\n", isalnum(96));
	printf("Mon isalnum pour 'a' ->%d\n", ft_isalnum('a'));
	printf("Le isalnum pour 'a' ->%d\n\n", isalnum('a'));
	printf("Mon isalnum pour 'z' ->%d\n", ft_isalnum('z'));
	printf("Le isalnum pour 'z' ->%d\n\n", isalnum('z'));
	printf("Mon isalnum pour 7 ->%d\n", ft_isalnum(7));
	printf("Le isalnum pour 7 ->%d\n\n", isalnum(7));
	printf("Mon isalnum pour 2400 ->%d\n", ft_isalnum(2400));
	printf("Le isalnum pour 2400 ->%d\n\n", isalnum(2400));
	printf("Mon isalnum pour ? ->%d\n", ft_isalnum('?'));
	printf("Le isalnum pour ? ->%d\n", isalnum('?'));
	printf("\033[1;32m%s passed.\033[0m\n\n", str);
}

void	test_isprint(void)
{
	char *str;

	str = "ISPRINT";
	printf("\033[1;33m%s\033[0m\n", str);
	printf("Mon %s pour 31 ->%d\n", str, ft_isprint(31));
	printf("Le %s pour 31 ->%d\n\n", str, isprint(31));
	printf("Mon %s pour 32 ->%d\n", str, ft_isprint(32));
	printf("Le %s pour 32 ->%d\n\n", str, isprint(32));
	printf("Mon %s pour 125 ->%d\n", str, ft_isprint(125));
	printf("Le %s pour 125 ->%d\n\n", str, isprint(125));
	printf("Mon %s pour 126 ->%d\n", str, ft_isprint(126));
	printf("Le %s pour 126 ->%d\n\n", str, isprint(126));
	printf("Mon %s pour 127 ->%d\n", str, ft_isprint(127));
	printf("Le %s pour 127 ->%d\n\n", str, isprint(127));
	printf("Mon %s pour 'a' ->%d\n", str, ft_isprint('a'));
	printf("Le %s pour 'a' ->%d\n", str, isprint('a'));
	printf("\033[1;32m%s passed.\033[0m\n\n", str);
}

void	test_bzero(void)
{
	char str[] = "BZERO";

	char str1[]= "Bzero";
	char str2[] = "Bzero";
	printf("\033[1;33m%s\033[0m\n", str);
	bzero((char *)str1, 2);
	ft_bzero((char *)str2, 2);
	printf("BZERO appliqué, sur 2 lettres ->\n");
	write(1, &str1[0], 1);
	printf("\n");
	printf("Le seconde lettre ->\n");
	write(1, &str1[1], 1);
	printf("\n");
	printf("La troisème lettre ->\n");
	write(1, &str1[2], 1);
	printf("\n");
	printf("\nFT_BZERO appliqué, sur 2 lettres ->\n");
	write(1, &str2[0], 1);
	printf("\n");
	printf("Le seconde lettre ->\n");
	write(1, &str2[1], 1);
	printf("\n");
	printf("La troisème lettre ->\n");
	write(1, &str2[2], 1);
	printf("\n");
	printf("\033[1;32m%s passed.\033[0m\n\n", str);
}

void	test_strlen(void)
{
	char *str;
	char str2[100]= "coucou";
	char str4[100]= "coucou";

	str = "STRLEN";
	printf("\033[1;33m%s\033[0m\n", str);
	int j = strlen(str2);
	printf("Le strlen pour 'coucou' -> %d\n", j);
	int i = ft_strlen(str4);
	printf("strlen asm pour 'coucou' -> %d\n", i);
	i = strlen("");
	printf("strlen pour '' -> %d\n", i);
	printf("strlen asm pour '' -> %d\n", ft_strlen(""));
	i = strlen("abcdefghijklmnopqrstuvwxyz");
	printf("strlen pour 'abcdefghijklmnopqrstuvwxyz' -> %d\n", i);
	printf("strlen asm pour abcdefghijklmnopqrstuvwxyz -> %d\n", ft_strlen("abcdefghijklmnopqrstuvwxyz"));
	printf("\033[1;32m%s passed.\033[0m\n\n", str);
}

void	test_toupper(void)
{
	char c = 'a';
	char d = 'a';
	char e = 'A';
	char f = 'A';
	char *str = "TOUPPER";
	printf("\033[1;33m%s\033[0m\n", str);
	puts("toupper");
	printf("Valeur ascii de 'a' -> %d\n", c);
	int i = toupper(c);
	printf("toupper de 'a' %d\n", i);
	printf("'a' vaut toujours -> %d\n", c);
	printf("a n'est pas devenu majuscule -> %c\n\n", c);
	printf("Valeur ascii de 'A' -> %d\n", e);
	i = toupper(e);
	printf("toupper de 'A' -> %d\n", i);
	printf("'A' vaut toujours -> %d\n", e);
	printf("A n'est pas devenu minuscule -> %c\n\n", e);

	puts("ft_toupper");
	printf("Valeur ascii de 'a' -> %d\n", d);
	i = ft_toupper(d);
	printf("toupper de 'a' %d\n", i);
	printf("'a' vaut toujours -> %d\n", d);
	printf("a n'est pas devenu majuscule -> %c\n\n", d);
	printf("Valeur ascii de 'A' -> %d\n", f);
	i = ft_toupper(f);
	printf("toupper de 'A' -> %d\n", i);
	printf("'A' vaut toujours -> %d\n", f);
	printf("A n'est pas devenu minuscule -> %c\n\n", f);

	printf("toupper de 2 -> %d\n", toupper(2));
	printf("ft_toupper de 2 -> %d\n", ft_toupper(2));
	printf("\033[1;32m%s passed.\033[0m\n\n", str);
}

void	test_tolower(void)
{
	char c = 'a';
	char d = 'a';
	char e = 'A';
	char f = 'A';
	char *str = "TOLOWER";
	printf("\033[1;33m%s\033[0m\n", str);
	puts("tolower");
	printf("Valeur ascii de 'a' -> %d\n", c);
	int i = tolower(c);
	printf("tolower de 'a' %d\n", i);
	printf("'a' vaut toujours -> %d\n", c);
	printf("a n'est pas devenu majuscule -> %c\n\n", c);
	printf("Valeur ascii de 'A' -> %d\n", e);
	i = tolower(e);
	printf("tolower de 'A' -> %d\n", i);
	printf("'A' vaut toujours -> %d\n", e);
	printf("A n'est pas devenu minuscule -> %c\n\n", e);

	puts("ft_tolower");
	printf("Valeur ascii de 'a' -> %d\n", d);
	i = ft_tolower(d);
	printf("tolower de 'a' %d\n", i);
	printf("'a' vaut toujours -> %d\n", d);
	printf("a n'est pas devenu majuscule -> %c\n\n", d);
	printf("Valeur ascii de 'A' -> %d\n", f);
	i = ft_tolower(f);
	printf("tolower de 'A' -> %d\n", i);
	printf("'A' vaut toujours -> %d\n", f);
	printf("A n'est pas devenu minuscule -> %c\n\n", f);

	printf("tolower de 2 -> %d\n", tolower(2));
	printf("ft_toupper de 2 -> %d\n", ft_tolower(2));
	printf("\033[1;32m%s passed.\033[0m\n\n", str);
}

void	test_strcat(void)
{
	char *str = "STRCAT";
	char str1[100] = "coucou ";
	char *str2 = "les zaza.";
	char str3[100] = "coucou ";
	char *str4 = "les zaza.";

	printf("\033[1;33m%s\033[0m\n", str);
	strcat(str1, str2);
	printf("strcat de 'coucou ' 'les zaza.' -> %s\n", str1);
	ft_strcat(str3, str4);
	printf("ft_strcat de 'coucou ' 'les zaza.' -> %s\n", str3);
	printf("\033[1;32m%s passed.\033[0m\n\n", str);
}

void	test_memset(void)
{
	char	*str = "MEMSET";
	char	str1[100]="COUCOU";
	char	str2[100]="COUCOU";
	char	str3[100]="";
	char	str4[100]="";

	printf("\033[1;33m%s\033[0m\n", str);
	memset(str2, 'A', 3);
	printf("memset de 'COUCOU' 'A' 3 -> %s\n", str2);
	ft_memset(str1, 'A', 3);
	printf("ft_memset de 'COUCOU' 'A' 3 -> %s\n", str1);
	memset(str3, 'A', 3);
	printf("memset de '' 'A' 3 -> %s\n", str3);
	ft_memset(str4, 'A', 3);
	printf("ft_memset de '' 'A' 3 -> %s\n", str4);
	printf("\033[1;32m%s passed.\033[0m\n\n", str);
}

void	test_memcpy(void)
{
	char	*str = "MEMCPY";
	char	str1[100]="COUUCOUSSINS";
	char	str2[100]="LES SAUCISSES";
	char	str3[100]="COUUCOUSSINS";
	char	str4[100]="LES SAUCISSES";
	char	str5[100]="COUCOU";
	char	str6[100]="";
	char	str7[100]="COUCOU";
	char	str8[100]="";
	char	str9[100]="COUCOU";
	char	str10[100]="";
	char	str11[100]="COUCOU";
	char	str12[100]="";

	printf("\033[1;33m%s\n\033[0m", str);
	memcpy(str1, str2, 4);
	printf("memcpy de 'COUUCOUSSINS' 'LES SAUCISSES' 4 -> %s\n", str1);
	ft_memcpy(str3, str4, 4);
	printf("ft_memcpy de 'COUUCOUSSINS' 'LES SAUCISSES' 4 -> %s\n", str3);
	memcpy(str5, str6, 7);
	printf("memcpy de 'COUCOU' '' 7 -> %s\n", str5);
	ft_memcpy(str7, str8, 7);
	printf("ft_memcpy de 'COUCOU' '' 7 -> %s\n", str7);
	memcpy(str9, str10, 3);
	printf("memcpy de 'COUCOU' '' 3 -> %s\n", str9);
	ft_memcpy(str11, str12, 3);
	printf("ft_memcpy de 'COUCOU' '' 3 -> %s\n", str11);
	printf("\033[1;32m%s passed.\033[0m\n\n", str);
}

void	test_strdup(void)
{
	char	str[] = "STRDUP";
	char	*str1;
	char	*str2;

	printf("\033[1;33m%s\n\033[0m", str);
	str1 = ft_strdup(str);
	printf("strdup de 'STRDUP' sur char * vide -> %s\n", str1);
	str2 = ft_strdup("Bonjour monsieur le correcteur, + de 100% hein... :D");
	printf("strdup de 'Bonjour [...]' sur char * vide -> %s\n", str2);
	printf("\033[1;32m%s passed.\033[0m\n\n", str);
}

void	test_cat(void)
{
	char	str[] = "CAT";
	char	dos[] = "./ft_cat.s";
//	char	dos[] = "/dev/urandom";
	int		fd;

	printf("\033[1;33m%s\033[0m\n", str);
//	fd = open(__FILE__, O_RDONLY);
	fd = open(dos, O_RDONLY);
	ft_cat(fd);
	printf("\n");

	printf("\033[1;32m%s passed.\033[0m\n\n", str);
}

void	test_putstr(void)
{
	char	str[] = "PUTSTR";
	printf("\033[1;33m%s\033[0m\n", str);
	ft_putstr("Bonjour");
	ft_putstr(" les");
	ft_putstr(" amis");
	ft_putstr(" !");
	ft_putstr("\n");
	ft_putstr(NULL);
	ft_putstr("\n");
	printf("\033[1;32m%s passed.\033[0m\n\n", str);
}

void	test_putstr_fd(void)
{
	char	str[] = "PUTSTR_FD";
	printf("\033[1;33m%s\033[0m\n", str);
	ft_putstr_fd("Bonjour", 2);
	ft_putstr_fd(" les", 1);
	ft_putstr_fd(" amis", 2);
	ft_putstr_fd(" !", 1);
	ft_putstr_fd("\n", 3);
	ft_putstr_fd(NULL, 1);
	ft_putstr_fd("\n", 1);
	printf("\033[1;32m%s passed.\033[0m\n\n", str);
}

void	test_putchar(void)
{
	char	str[] = "PUTCHAR";
	printf("\033[1;33m%s\033[0m\n", str);
	ft_putchar('B');
	ft_putchar('l');
	ft_putchar('a');
	ft_putchar('!');
	ft_putchar('\n');
	ft_putchar('\n');
	printf("\033[1;32m%s passed.\033[0m\n\n", str);
}


void	test_putchar_fd(void)
{
	char	str[] = "PUTCHAR_FD";
	printf("\033[1;33m%s\033[0m\n", str);
	ft_putchar_fd('B', 2);
	ft_putchar_fd('l', 1);
	ft_putchar_fd('a', 2);
	ft_putchar_fd('!', 1);
	ft_putchar_fd('\n', 3);
	ft_putchar_fd('\n', 1);
	printf("\033[1;32m%s passed.\033[0m\n\n", str);
}

void	test_abs(void)
{
	int a;
	int b;
	int c;

	b = 0;
	c = 3;
	a = -2;
	char str[] = "FT_ABS";
	printf("\033[1;33m%s\n\033[0m", str);
	a = abs(a);
	printf("la valeur abs de -2 -> %d\n", a);
	ft_abs(a);
	printf("la valeur ft_abs de -2 -> %d\n", a);
	b = abs(b);
	printf("la valeur abs de 0 -> %d\n", b);
	ft_abs(b);
	printf("la valeur ft_abs de 0 -> %d\n", b);
	c = abs(c);
	printf("la valeur abs de 3 -> %d\n", c);
	ft_abs(c);
	printf("la valeur ft_abs de 3 -> %d\n", c);
}

void	test_strcpy(void)
{
	char	*str = "STRCPY";
	char	str1[100]="COUUCOUSSINS";
	char	str2[100]="LES SAUCISSES";
	char	str3[100]="COUUCOUSSINS";
	char	str4[100]="LES SAUCISSES";
	char	str5[100]="COUCOU";
	char	str6[100]="";
	char	str7[100]="COUCOU";
	char	str8[100]="";
	char	str9[100]="COUCOU";
	char	str10[100]="";
	char	str11[100]="COUCOU";
	char	str12[100]="";

	printf("\033[1;33m%s\n\033[0m", str);
	strcpy(str1, str2);
	printf("strcpy de 'COUUCOUSSINS' 'LES SAUCISSES' 4 -> %s\n", str1);
	ft_strcpy(str3, str4, 4);
	printf("ft_strcpy de 'COUUCOUSSINS' 'LES SAUCISSES' 4 -> %s\n", str3);
	strcpy(str5, str6);
	printf("strcpy de 'COUCOU' '' 7 -> %s\n", str5);
	ft_strcpy(str7, str8, 7);
	printf("ft_strcpy de 'COUCOU' '' 7 -> %s\n", str7);
	strcpy(str9, str10);
	printf("strcpy de 'COUCOU' '' 3 -> %s\n", str9);
	ft_strcpy(str11, str12, 3);
	printf("ft_strcpy de 'COUCOU' '' 3 -> %s\n", str11);
	printf("\033[1;32m%s passed.\033[0m\n\n", str);
}

int		main(void)
{
	test_isascii();
	test_isdigit();
	test_isalpha();
	test_isalnum();
	test_isprint();
	test_bzero();
	test_toupper();
	test_tolower();
	test_strlen();
	test_strcat();
	test_memset();
	test_memcpy();
	test_puts();
	test_strdup();
	test_cat();
	printf("\n\n\033[1;32m  !!  BONUS  !!  \033[0m\n\n");
	test_putstr();
	test_putstr_fd();
	test_putchar();
	test_putchar_fd();
	test_abs();
	test_strcpy();
	return (0);
}
