/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   startup.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: trifflet <trifflet@student.le-101.fr>      +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/02/17 16:05:50 by trifflet          #+#    #+#             */
/*   Updated: 2020/02/18 17:57:06 by trifflet         ###   ########lyon.fr   */
/*                                                                            */
/* ************************************************************************** */

#include "../header/cub3d.h"

void	empty(t_data *data)
{
	int i;

	i = 0;
	while (i++ < 127)
		data->inputs.keyboard[i] = 0;
	data->inputs.time = get_time();
}

set_background()

void	startup(t_data *data)
{
	data->inputs.keyboard = malloc(sizeof(char) * 128);
	empty(data);
	if ((data->window.mlx_ptr = mlx_init()) == NULL)
		ft_exit(EXIT_FAILURE);
	set_background(data);
	if ((data->window.window = mlx_new_window(data->window.mlx_ptr,\
		data->window.width, data->window.height, "Cub3D")) == NULL)
		ft_exit (EXIT_FAILURE);
	data->window.background = create_image(data->window.width,\
		data->window.height, data);
}
