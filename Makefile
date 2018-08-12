# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ofedoryc <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/07/15 00:08:04 by ofedoryc          #+#    #+#              #
#    Updated: 2018/08/12 17:30:09 by mpetruno         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = fillit

CC = gcc

FILES = ft_checker.c \
		ft_error.c \
		ft_global_checker.c \
		ft_tetr_checker.c \
		tetr.c \
		map.c \
		solver.c \
		point.c \
		main.c

LIB = ./libft/libft.a

LIBFT = ./libft/

HEAD = fillit.h

FLAGS = -Wall -Wextra -Werror

O_FILES = $(FILES:.c=.o)

#list_obj:
#	@echo $(O_FILES)
#
#list_src:
#	@echo $(FILES)

all: $(NAME)

$(NAME): $(LIB) $(HEAD) $(O_FILES)
	$(CC) $(O_FILES) $(LIB) $(FLAGS) -I $(HEAD) -o $(NAME)

$(LIB):
	make -C $(LIBFT)

%.o: %.c
	$(CC) -c $^ $(FLAGS)

clean:
	rm -f $(O_FILES)
	make -C ./libft/ clean # -C убивает только файл

fclean: clean
	rm -f $(NAME)  # -f убивает только файл
	make -C ./libft/ fclean

re: fclean all

.PHONY: all clean fclean re
