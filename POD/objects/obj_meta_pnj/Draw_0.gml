draw_self();
if draw_relation_link
{
		var line_width;
		draw_set_color(c_white); //on dessine les fleches qui partent de self
		for(var i=0; i< ds_list_size(list_relation);i++)
		{
			var tmp = ds_list_find_value(list_relation,i);
			var linked_visible = ds_list_find_value(list_relation_linked_visible,i);
			if instance_exists(tmp) and linked_visible
			{
				line_width = 5 + ds_list_find_value(list_relation_weigth,i);
				if tmp == obj_persistent.pnj_hovered
					line_width *= 2;
				scr_draw_arrow(tmp,line_width,self,"");
			}
		}

	draw_set_color(c_orange); //on dessine les fleches qui arrive à self
	with obj_meta_pnj
	{
		var obj = other.object_index; //on cherche self dans les listes de tout les pnj			
		var index = ds_list_find_index(list_relation,obj); //s'il a ete devoile on affiche la fleche
		var linked_visible = ds_list_find_value(list_relation_linked_visible,i);
		if index != -1 and linked_visible
		{
			line_width = 5 + ds_list_find_value(list_relation_weigth,index);
			scr_draw_arrow(obj,line_width,self,"");
		}
	}
	draw_set_color(c_red)
	if draw_ghost_arrow
	{
		draw_line_width(x,y,mouse_x,mouse_y,5);
		draw_arrow(x,y,mouse_x,mouse_y,40);
	}
}

if visited or known or ds_map_find_value(map_information_known,"name") != "inconnu"
	scr_draw_center_object(fnt_debug_mode,c_white,name,image_xscale,image_yscale,0);
if marked
	scr_draw_center_object(fnt_marked,c_red,"X",1,1,0);

var souffrance = 0;
for(var i=0; i<ds_list_size(clef_relation);i++)
{
	var clef = ds_list_find_value(clef_relation,i);
	var value = ds_map_find_value(map_relation,clef)
	if instance_exists(value.pnj_linked)
		souffrance += value.force_relation;
}
draw_set_color(c_white);
draw_set_font(fnt_debug_mode)
draw_set_valign(fa_top)
draw_set_halign(fa_center)
draw_text(x,y+sprite_height/2,souffrance*5);
draw_set_valign(false)
draw_set_halign(false)