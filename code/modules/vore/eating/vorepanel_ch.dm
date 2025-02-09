//CHOMP - liquid bellies //These variables have been moved to belly_obj_ch.dm, keeping comments here for reference
/*
/datum/vore_look
	var/show_liquids = FALSE
	var/show_fullness_messages = FALSE
*/

/obj/screen/belly_fullscreen_preview
	icon = 'icons/mob/screen_full_vore_ch.dmi'
	icon_state = ""
	appearance_flags = 0

/datum/vore_look
	var/scloc = "1,1"
	var/map_name
	var/obj/screen/belly_fullscreen_preview/fullscreen_preview

/*/datum/vore_look/tgui_static_data(mob/user)
	var/list/data = ..()
	data["mapRef"] = map_name
	return data*/

/datum/vore_look/New()
	. = ..()
	map_name = "belly_fullscreen_[REF(src)]_map"
	fullscreen_preview = new()
	fullscreen_preview.name = ""
	fullscreen_preview.assigned_map = map_name
	fullscreen_preview.del_on_map_removal = FALSE
	fullscreen_preview.screen_loc = "[map_name]:[scloc]"

/datum/vore_look/proc/update_preview_icon()
	if(host.vore_selected)
		var/obj/belly/selected = host.vore_selected
		fullscreen_preview.icon_state = selected.belly_fullscreen
		fullscreen_preview.color = selected.belly_fullscreen_color
		fullscreen_preview.screen_loc = "[map_name]:[scloc]"

/datum/vore_look/proc/give_client_previews(client/C)
	C.register_map_obj(fullscreen_preview)
