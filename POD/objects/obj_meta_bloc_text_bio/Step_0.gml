if !hyperlink
	return -1;
if point_in_rectangle(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), x,y-sprite_height/2,x+sprite_width,y+sprite_height/2)
{
	obj_persistent.button_selected = self;
	window_set_cursor(cr_handpoint);
	event_perform(ev_mouse,ev_mouse_enter);
	if mouse_check_button_released(mb_left)
		event_perform(ev_mouse,ev_left_release);
}
else
{
	if obj_persistent.button_selected == self
	{
		event_perform(ev_mouse,ev_mouse_leave);
		window_set_cursor(cr_default);
	}
	obj_persistent.button_selected = noone;
}