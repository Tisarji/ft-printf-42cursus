# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jikarunw <jikarunw@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/09/16 22:30:03 by jikarunw          #+#    #+#              #
#    Updated: 2023/09/18 15:14:33 by jikarunw         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Colors
COLOR_RESET = \033[0m
COLOR_YELLOW = \033[1;33m
COLOR_CYAN = \033[1;36m

NAME				=		libftprintf.a
NAME_LIBFT			=		libft.a
LOCAL_SRC_PATH		=		srcs
LOCAL_HEADER_PATH	=		includes
LOCAL_LIBFT_PATH	=		./libft

PRINTF_SRC			=	ft_printf.c \
						ft_printf_char.c \
						ft_printf_hex.c \
						ft_printf_nbr.c \
						ft_printf_string.c \
						ft_printf_unit.c \
						ft_printf_ptr.c

# Compiler
CC 			= 	cc
CFLAGS 		= 	-Wall -Werror -Wextra -I$(LOCAL_HEADER_PATH)

OBJS		=	$(PRINTF_SRC:.c=.o)

all: 	$(NAME)

make_libft:
				make -C $(LOCAL_LIBFT_PATH)
				cp $(LOCAL_LIBFT_PATH)/libft.a $(NAME_LIBFT)
				mv $(NAME_LIBFT) $(NAME)

$(NAME):	make_libft $(OBJS)
			ar -rc $(NAME) $(OBJS)

clean:
			rm -rf $(OBJS)
			cd $(LOCAL_LIBFT_PATH) && make clean

fclean:		clean
			rm -rf $(NAME)
			cd $(LOCAL_LIBFT_PATH) && make fclean
			

re: fclean all

.PHONY: all clean fclean re
