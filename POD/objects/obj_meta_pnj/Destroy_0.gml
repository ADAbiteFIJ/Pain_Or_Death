scr_gain_sang(gain_sang);

for(var i=0; i<ds_list_size(list_relation);i++)
{
	if instance_exists(ds_list_find_value(list_relation,i))
	{
		var weigth = ds_list_find_value(list_relation_weigth,i);
		scr_gain_souffrance(weigth*5);
	}
}
if self == obj_persistent.pnj_selected
	scr_hide_pop_up();
ds_list_destroy(list_relation);
ds_list_destroy(list_relation_sup);
ds_list_destroy(list_relation_secret);