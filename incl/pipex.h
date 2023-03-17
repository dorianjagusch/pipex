/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   pipex.h                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: djagusch <djagusch@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/02/02 14:27:27 by djagusch          #+#    #+#             */
/*   Updated: 2023/02/10 13:22:40 by djagusch         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef PIPEX_H
# define PIPEX_H

# include <sys/wait.h>
# include <errno.h>
# include <string.h>
# include <fcntl.h>
# include "libft.h"
# include "ft_error.h"

typedef struct s_cmd
{
	char	**cmd;
	char	***params;
	int		**fd;
	int		n_cmd;
	int		*n_params;
}			t_cmd;

t_cmd	*parse_input(int ac, char **av, int **pids, char *envp[]);
void	parse_cmds(t_cmd *cmds, int ac, char **av, char *envp[]);
void	close_fds(t_cmd *cmds, int cur);
void	free_cmds(t_cmd **cmds, int **pids);
size_t	count_elements(char **params);
size_t	ft_count_words(char const *s);
void	ft_error(int error, char *str);
void	do_child(t_cmd *cmds, int current, char *envp[]);
char	**ft_split2(char const *s);

#endif