/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_free_array.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: djagusch <djagusch@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/02/10 13:20:20 by djagusch          #+#    #+#             */
/*   Updated: 2023/02/10 13:36:28 by djagusch         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"
#include <stdio.h>

void	*ft_free_array(char ***array, size_t index)
{
	size_t	i;

	i = 0;
	while (i < index)
	{
		ft_free((*array)[i]);
		(*array)[i++] = NULL;
	}
	ft_free(*array);
	return (NULL);
}
