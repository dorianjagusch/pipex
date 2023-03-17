# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: djagusch <djagusch@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/14 11:46:33 by djagusch          #+#    #+#              #
#    Updated: 2023/03/09 15:49:35 by djagusch         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

### COLOURS ###

COLOUR_GREEN=\033[0;32m
COLOUR_RED=\033[0;31m
COLOUR_BLUE=\033[0;34m
COLOUR_END=\033[0m

### SET UP ###
CC = cc
CFLAGS = -Wall -Werror -Wall -I$I

RM = /bin/rm -f
RMDIR = /bin/rmdir -p

LIBFT = libft/libft.a

S = srcs
O = objs
I = incl
B = bonus
BO = bonus_objs

FILES = pipex parse_input parse_command do_child utils \
	ft_split2 ft_count_words

HEADER = libft.h pipex.h ft_error.h
HEADER := $(addprefix $I/,$(HEADER))

SRCS := $(shell find $S -type f -name '*.c')
OBJS = $(patsubst $S/%,$O/%,$(SRCS:.c=.o))
O_DIRS = $(dir $(OBJS))

BONUS = $(shell find $B -type f -name '*_bonus.c')
B_OBJS = $(patsubst $B/%,$(BO)/%,$(BONUS:.c=.o))
BO_DIRS = $(dir $(B_OBJS))

NAME = pipex
NAME_B = pipex_bonus

### RULES ###
all: $(NAME) bonus

$(NAME): $(OBJS) $(LIBFT)
	@$(CC) $(CFLAGS) $(OBJS) -Llibft -lft -o $(NAME)
	@echo "$(COLOUR_GREEN) $(NAME) created$(COLOUR_END)"

$O:
	@mkdir -p $@ $(O_DIRS)

$O/%.o: $S/%.c $(HEADER) | $O
	@$(CC) $(CFLAGS) -c $< -o $@

### BONUS

bonus: $(NAME_B)

$(NAME_B): $(B_OBJS) $(LIBFT)
	@$(CC) $(CFLAGS) $(B_OBJS) -Llibft -lft -o $(NAME_B)
	@echo "$(COLOUR_GREEN) $(NAME_B) created$(COLOUR_END)"

$(BO):
	@mkdir -p $@ $(BO_DIRS)

$(BO)/%.o: $B/%.c $(HEADER) | $(BO)
	@$(CC) $(CFLAGS) -c $< -o $@

### LIBFT

libft: $(LIBFT)

$(LIBFT):
	@$(MAKE) -C libft
	@echo "$(COLOUR_GREEN) $(LIBFT) created$(COLOUR_END)"

### CLEANING

clean:
	@cd libft && $(MAKE) clean
	@echo "$(COLOUR_RED) $(LIBFT) removed$(COLOUR_END)"
	@$(RM) $(OBJS) $(B_OBJS)
	@if [ -d $O ]; then $(RM) -rf $(O_DIRS) $O; fi
	@if [ -d $(BO) ]; then $(RM) -rf $(BO_DIRS) $(BO); fi

fclean : clean
	@cd libft && $(MAKE) fclean
	@$(RM) $(NAME) pipex_bonus
	@echo "$(COLOUR_RED) $(NAME) (bonus) removed$(COLOUR_END)"

re: fclean $(NAME)

.PHONY: all clean fclean re bonus
