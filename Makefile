# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: trifflet <trifflet@student.le-101.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/02/12 14:15:23 by trifflet          #+#    #+#              #
#    Updated: 2020/02/18 16:08:46 by trifflet         ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #


NAME		=	Cub3D

HEADERS_DIR	=	header
HEADERS		=	mlx.h

SRC_DIR		=	src

SRC_FILES	=	main.c		\
				startup.c	\
				hooker.c	\
				render.c	\
				time.c

OBJ_DIR		=	obj
#OBJ_FILES	=	${SRC:.c=.o}
OBJ_FILES	= $(SRC:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)

SRC			=	$(addprefix $(SRC_DIR)/,$(SRC_FILES))
OBJ			=	$(OBJ_FILES)

FLAGS		=	-g3 -Wall -Wextra -Werror $(DEBUG) -framework OpenGL -framework AppKit

LIBS		=	lib/libmlx.a
#%.o: %.c
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
				gcc -g3 -Wall -Wextra -Werror -I $(HEADERS) -c $< -o $@

all:		$(NAME)

$(NAME):	$(OBJ)
			gcc $(FLAGS) $(OBJ) -I $(HEADERS) $(LIBS) -o $(NAME)

clean:
	rm -rf $(OBJ)

fclean: clean
	rm -rf $(NAME)

re:		fclean all

norme:
	@norminette $(addprefix $(SRC_DIR)/, $(SRC_FILES))

.PHONY: all, clean, fclean, re, norme
