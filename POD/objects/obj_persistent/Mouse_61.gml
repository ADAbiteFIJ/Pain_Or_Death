if camera_view_port_width < room_width
{
	camera_view_port_width += 50;
	camera_view_port_height += 50*0.5625;
	camera_set_view_size(view_camera[0],camera_view_port_width,camera_view_port_height);
}
else
	obj_debug_mode.zoom = true;