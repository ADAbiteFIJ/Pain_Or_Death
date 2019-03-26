///@param instance
if argument0.info_known >= 6
	return scr_infos_contexte("Toute l'âme de "+argument0.name+" est découverte");
	
var tmp_list = ds_list_create();
ds_list_add(tmp_list,"name","surname","age","metier","signe","lieu");

var rdm_index = irandom_range(0,ds_list_size(tmp_list)-1);
var rdm_key = ds_list_find_value(tmp_list,rdm_index);
var rdm_value = ds_map_find_value(argument0.map_information_known,rdm_key);

if rdm_value == "inconnu"
{
	var val = variable_instance_get(argument0,rdm_key);
	if !is_string(val)
		ds_map_replace(argument0.map_information_known,rdm_key,val.name);
	else
		ds_map_replace(argument0.map_information_known,rdm_key,val);
}
else
{
	while ds_map_find_value(self.map_information_known,rdm_key) != "inconnu"
	{
		rdm_key = ds_map_find_next(self.map_information_known,rdm_key);
		if is_undefined(rdm_key)
			rdm_key = ds_map_find_first(self.map_information_known);
	}
	var val = variable_instance_get(argument0,rdm_key);
	if !is_string(val)
		ds_map_replace(argument0.map_information_known,rdm_key,val.name);
	else
		ds_map_replace(argument0.map_information_known,rdm_key,val);
}

argument0.info_known += 1;
ds_list_destroy(tmp_list);