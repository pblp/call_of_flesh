/obj/effect/overlay/temp/impact_effect
	icon_state = "impact_bullet"
	duration = 5

/obj/effect/overlay/temp/impact_effect/New(loc, atom/target, obj/item/projectile/P)
	if(target == P.original) //the projectile hit the target originally clicked
		pixel_x = P.p_x + target.pixel_x - 16 + rand(-4,4)
		pixel_y = P.p_y + target.pixel_y - 16 + rand(-4,4)
	else
		pixel_x = target.pixel_x + rand(-4,4)
		pixel_y = target.pixel_y + rand(-4,4)
	..()

/obj/item/projectile
	var/impact_effect_type

///////////////////////////// ��������� //////////////////////////////////////////

/obj/item/weapon/gun/projectile/automatic/pistol/pm   // �������
	name = "PMm"
	desc = "�������� �������� �����������������. �������� ���������������� � ���� �������� - �������� ��������� �����. ���������� ������� � �������, ���������&#255; ��������� �������� �������� ��� ������������� �������� � ���������������������� �������� �������. �������� ������ ��������-�������-����������. �������� �������� ��&#255; �����������&#255; �����."
	icon_state = "pm"
	w_class = 2
	fire_sound = 'sound/stalker/weapons/pm_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/m9x18pm
	force = 10
	can_suppress = 1
	can_unsuppress = 1
	durability = 50
	spread = 10
	recoil = 0.25
	damagelose = 0.2
	drawsound = 'sound/stalker/weapons/draw/pm_draw.ogg'
	loadsound = 'sound/stalker/weapons/load/pm_load.ogg'
	opensound = 'sound/stalker/weapons/unload/pm_open.ogg'

/obj/item/weapon/gun/projectile/automatic/pistol/pm/update_icon()
	..()
	icon_state = "[initial(icon_state)][chambered ? "" : "-e"]"
	return

/obj/item/weapon/gun/projectile/automatic/pistol/sip  // Sig-Sauer
	name = "SIP-T M200"
	desc = "������, ������������&#255; ��� � 1975 ����, �� �� ��� ��� �����&#255;���&#255; �� ��� ����. ������� ������������ �����, ���� �������� ������ ��� ����������� ����; ������ ������ &#255;��&#255;���&#255; ������������� ������� ������������ ������� .45 �������."
	icon_state = "sip"
	w_class = 2
	fire_sound = 'sound/stalker/weapons/sig220_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/sc45
	force = 10
	can_suppress = 1
	can_unsuppress = 1
	durability = 100
	spread = 6
	recoil = 0.25
	damagelose = 0.2
	drawsound = 'sound/stalker/weapons/draw/sig220_draw.ogg'
	loadsound = 'sound/stalker/weapons/load/pm_load.ogg'
	opensound = 'sound/stalker/weapons/unload/pm_open.ogg'

/obj/item/weapon/gun/projectile/automatic/pistol/sip/update_icon()
	..()
	icon_state = "[initial(icon_state)][chambered ? "" : "-e"]"
	return


/obj/item/weapon/gun/projectile/automatic/pistol/cora  // Colt1911A
	name = "Kora-919"
	desc = "������������ �������������� ������, � ������ ��������� ��� ���������� ��������� XX ���� � �������� �������� � ����� ��������. ��������&#255; ������� �������� � ����������� ������� �������������&#255; �������������� ������� �������."
	icon_state = "cora"
	w_class = 3
	fire_sound = 'sound/stalker/weapons/colt1911_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/sc45
	force = 10
	can_suppress = 1
	can_unsuppress = 1
	spread = 6
	recoil = 0.5
	durability = 85
	damagelose = 0.15
	drawsound = 'sound/stalker/weapons/draw/pm_draw.ogg'
	loadsound = 'sound/stalker/weapons/load/pm_load.ogg'
	opensound = 'sound/stalker/weapons/unload/pm_open.ogg'


/obj/item/weapon/gun/projectile/automatic/pistol/cora/update_icon()
	..()
	icon_state = "[initial(icon_state)][chambered ? "" : "-e"]"
	return

/obj/item/weapon/gun/projectile/automatic/pistol/marta  // Beretta92FS
	name = "Marta"
	desc = "������� �� ���������� ���������� ��� � ������� ���, ������ ��������������� � ����������������� ������������ �� ��� ����. ����� �� �����&#255;��� � � �������������� ����������� ���� ��������&#255; ������� ������� � ������� ������� ��������."
	icon_state = "marta"
	item_state = "marta"
	w_class = 3
	fire_sound = 'sound/stalker/weapons/marta_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/m9x19marta
	force = 10
	can_suppress = 1
	can_unsuppress = 1
	spread = 7
	recoil = 0.4
	damagelose = 0.2
	durability = 85
	drawsound = 'sound/stalker/weapons/draw/pm_draw.ogg'
	loadsound = 'sound/stalker/weapons/load/pm_load.ogg'
	opensound = 'sound/stalker/weapons/unload/pm_open.ogg'

/obj/item/weapon/gun/projectile/automatic/pistol/marta/update_icon()
	..()
	icon_state = "[initial(icon_state)][chambered ? "" : "-e"]"
	return

/obj/item/weapon/gun/projectile/automatic/pistol/fort12  // ����12
	name = "Fora 12"
	desc = "�������� ������������ ���������&#255; ����������� ������������, ��������� �� ����� ���. �������� ������� �� ��������� � ��������� ��������� ��&#255;, ����������� � ����� ������������� ���������, ������ ����� ������."
	icon_state = "fort12"
	fire_sound = 'sound/stalker/weapons/fort_shot.ogg'
	w_class = 2
	mag_type = /obj/item/ammo_box/magazine/stalker/m9x18fort
	force = 10
	can_suppress = 1
	can_unsuppress = 1
	spread = 8
	recoil = 0.3
	durability = 50
	damagelose = 0.2
	drawsound = 'sound/stalker/weapons/draw/fort_draw.ogg'
	loadsound = 'sound/stalker/weapons/load/pm_load.ogg'
	opensound = 'sound/stalker/weapons/unload/pm_open.ogg'

/obj/item/weapon/gun/projectile/automatic/pistol/fort12/update_icon()
	..()
	icon_state = "[initial(icon_state)][chambered ? "" : "-e"]"
	return

/obj/item/weapon/gun/projectile/automatic/pistol/fort12/unique  // ����12 - ����������� �������
	desc = "����������������� �������� ��������� ����. ��������� �������&#255;�."
	icon_state = "fort12_unique"
	mag_type = /obj/item/ammo_box/magazine/stalker/m9x18fort_u

/obj/item/weapon/gun/projectile/automatic/pistol/fort12/unique/update_icon()
	..()
	icon_state = "[initial(icon_state)][chambered ? "" : "-e"]"
	return

/obj/item/weapon/gun/projectile/automatic/pistol/pb1s  //��1�
	name = "PB1s"
	desc = "�������� � ��������������� ����������, ������� ���������������&#255; ��������� ���������. �������� �������, �� � ������ ����� ��-�������� �������� ����������."
	icon_state = "pb1s"
	w_class = 2
	fire_sound = 'sound/stalker/weapons/pb_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/m9x18pm
	force = 10
	suppressed = 1
	can_suppress = 0
	can_unsuppress = 0
	spread = 8
	recoil = 0.3
	durability = 50
	damagelose = 0.2
	drawsound = 'sound/stalker/weapons/draw/pm_draw.ogg'
	loadsound = 'sound/stalker/weapons/load/pm_load.ogg'
	opensound = 'sound/stalker/weapons/unload/pm_open.ogg'

/obj/item/weapon/gun/projectile/automatic/pistol/pb1s/update_icon()
	..()
	icon_state = "[initial(icon_state)][chambered ? "" : "-e"]"
	return

/obj/item/weapon/gun/projectile/automatic/pistol/usp_match  // USP Match
	name = "H&K USP Match"
	desc = "�������&#255; ����������&#255; ���������� ��������� ���������, ������� .45. ����� ����������� �������, ������&#255; ��������� ������� ������ ��� �������� �� ���� ������ ����. ����������� ������� �� 15 ��������. �� ����&#255;��� �������� - L.C."
	icon_state = "usp-match"
	w_class = 2
	mag_type = /obj/item/ammo_box/magazine/stalker/usp45
	force = 10
	can_suppress = 1
	can_unsuppress = 1
	spread = 8
	recoil = 0.4
	durability = 100
	damagelose = 0.15
	drawsound = 'sound/stalker/weapons/draw/usp_draw.ogg'
	loadsound = 'sound/stalker/weapons/load/pm_load.ogg'
	opensound = 'sound/stalker/weapons/unload/pm_open.ogg'

/obj/item/weapon/gun/projectile/automatic/pistol/usp_match/update_icon()
	..()
	icon_state = "[initial(icon_state)][chambered ? "" : "-e"]"
	return


///////////////////////////// ��������, �� //////////////////////////////////////////

/obj/item/weapon/gun/projectile/automatic
	var/image/mag_overlay 			= null
	var/image/mag_overlay_inhands 	= null
	var/image/silencer_overlay 		= null
	var/image/scope_overlay 		= null
	var/image/colored_overlay 		= null
	var/colored 					= null

/obj/item/weapon/gun/projectile/automatic/New()
	..()
	mag_overlay = image('icons/stalker/projectile_overlays32x32.dmi', "[initial(icon_state)]-mag", layer = FLOAT_LAYER)
	if(can_suppress)
		silencer_overlay = image('icons/stalker/projectile_overlays48x48.dmi', "[initial(icon_state)]-silencer", layer = FLOAT_LAYER)
	if(can_scope)
		scope_overlay = image('icons/stalker/projectile_overlays32x32.dmi', "[initial(icon_state)]-scope", layer = FLOAT_LAYER)
	if(colored)
		colored_overlay = image('icons/stalker/projectile_overlays32x32.dmi', "[initial(icon_state)]-[colored]", layer = FLOAT_LAYER)
		overlays += colored_overlay
	update_icon()

/obj/item/weapon/gun/projectile/automatic/update_icon()
	..()
	overlays.Cut()
	/*
	icon_state = "[initial(icon_state)][magazine ? "" : "-e"][suppressed ? "-silenced" : ""]"
	*/
	item_state = "[initial(item_state)][magazine ? "" : "-e"]"		//���� �� ��������� � ��������� �� �����, ����� ���

	/*
	if(!magazine && mag_overlay in overlays)
		overlays.Remove(mag_overlay)

	if(!suppressed && silencer_overlay in overlays)
		overlays.Remove(silencer_overlay)
	*/
	if(colored)
		overlays += colored_overlay

	if(!istype(src, /obj/item/weapon/gun/projectile/automatic/pistol) && magazine && mag_overlay)
		overlays += mag_overlay

	if(suppressed && silencer_overlay)
		overlays += silencer_overlay

	if(zoomable && scope_overlay)
		overlays += scope_overlay

	if(unique)
		overlays += image('icons/stalker/projectile_overlays32x32.dmi', "unique", layer = FLOAT_LAYER)

	if(istype(src, /obj/item/weapon/gun/projectile/automatic/pistol))
		icon_state = "[initial(icon_state)][magazine ? "-[magazine.max_ammo]" : ""][chambered ? "" : "-e"]"

	return
/*
/obj/item/weapon/gun/projectile/automatic/worn_overlays(var/isinhands = TRUE)
	. = list()
	if(!isinhands)
		if(magazine )
			overlays += mag_overlay

		if(suppressed )
			overlays += silencer_overlay
        . += image(icon = 'icons/effects/effects.dmi', icon_state = "[shield_state]")
*/

/obj/item/weapon/gun/projectile/automatic/ak74  // AK-74
	name = "AK 74/2"
	desc = "������� �������� ������� 1974 ���� ��� ������ 5,45x39��. ���������&#255;�� ����� ������� � ������� ������, ���&#255; ��������� � ������������ ��������� ��������� �� �������� ������������&#255; � �������� ��&#255;. � ���� ��� �������� ������ ������� ��������� � ������ ��������."
	icon_state = "ak74"
	item_state = "ak74"
	colored = 0//"normal"
	slot_flags = SLOT_BACK//|SLOT_BELT
	force = 15
	origin_tech = "combat=5;materials=1"
	mag_type = /obj/item/ammo_box/magazine/stalker/m545
	fire_sound = 'sound/stalker/weapons/ak74_shot.ogg'
	can_suppress = 1
	can_unsuppress = 1
	burst_size = 3
	fire_delay = 1
	pin = /obj/item/device/firing_pin
	durability = 150
	w_class = 4
	spread = 7
	recoil = 0.5
	randomspread = 0
	damagelose = 0.25
	can_scope = 1
	drawsound = 'sound/stalker/weapons/draw/ak74_draw.ogg'

/obj/item/weapon/gun/projectile/automatic/aksu74  // ���74�
	name = "AK 74/2y"
	desc = "�� ����� ��������� � ����� ��� 74/2� (�����������) ������ � ����������-��������, ������ �� &#255;��&#255;���&#255; �������������� ���������. �����������: ����� �������� � �������� ������&#255; ����������&#255; �����������. ������� ���������� - ����&#255; ���������&#255; ��������� � ���������� � �������� ��������� ��� �������� ������&#255;��."
	icon_state = "aksu74"
	item_state = "aksu74"
	slot_flags = SLOT_BACK
	force = 15
	origin_tech = "combat=3;materials=1"
	mag_type = /obj/item/ammo_box/magazine/stalker/m545
	fire_sound = 'sound/stalker/weapons/ak74u_shot.ogg'
	can_suppress = 1
	burst_size = 3
	fire_delay = 1
	pin = /obj/item/device/firing_pin
	durability = 80
	w_class = 4
	spread = 9
	recoil = 0.9
	damagelose = 0.5
	can_scope = 1
	drawsound = 'sound/stalker/weapons/draw/ak74u_draw.ogg'

/*
/obj/item/weapon/gun/projectile/automatic/aksu74/black  // ���74� - ������ ����
	colored = "black"
	item_state = "aksu74-black"
	mag_type = /obj/item/ammo_box/magazine/stalker/m545
*/

/obj/item/weapon/gun/projectile/automatic/mp5  // MP5
	name = "Gaduka 5"
	desc = "���� �� ����� ������ � ������ ����������-�������� ������. � ������� ��������� ���&#255;������� XX ���� ��� ����&#255;� �� ���������� ����������������� ����� � ������� �� ������ ������� ����. � ������� ��� ����������� ������ ����� ������������ �����&#255;�� ���� ����� ��&#255;��&#255;���&#255; �� ������ �����, ������ ������� ����� � � ����."
	icon_state = "mp5"
	item_state = "gun"
	fire_sound = 'sound/stalker/weapons/mp5_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/m9x19mp5
	can_suppress = 1
	burst_size = 2
	slot_flags = SLOT_BELT
	durability = 100
	w_class = 3
	spread = 6
	recoil = 0.65
	damagelose = 0.4
	can_scope = 1
	drawsound = 'sound/stalker/weapons/draw/mp5_draw.ogg'
	loadsound = 'sound/stalker/weapons/load/mp5_load.ogg'
	opensound = 'sound/stalker/weapons/unload/mp5_open.ogg'

/obj/item/weapon/gun/projectile/automatic/tpc301  // ����
	name = "TPc-301"
	desc = "����&#255; ������� � �������� ��������� ���������� �-16. ��������&#255; ������������� ������� ������, ������� ���������� � ���������� ���� ������ ������ ���������&#255; ������� ��������� ��&#255;, ���&#255; ������&#255; ���������������� � ����&#255;������ ������ ��� ������������� ��&#255; ������������&#255; � ������� ������&#255;�."
	icon_state = "tpc301"
	item_state = "tpc301"
	slot_flags = SLOT_BACK
	force = 15
	origin_tech = "combat=6"
	mag_type = /obj/item/ammo_box/magazine/stalker/m556x45
	fire_sound = 'sound/stalker/weapons/tpc301_shoot.ogg'
	can_suppress = 1
	burst_size = 3
	fire_delay = 1
	pin = /obj/item/device/firing_pin
	durability = 90
	w_class = 4
	spread = 5
	recoil = 0.5
	damagelose = 0.2
	can_scope = 1
	drawsound = 'sound/stalker/weapons/draw/tpc301_draw.ogg'
	loadsound = 'sound/stalker/weapons/load/tpc301_load.ogg'
	opensound = 'sound/stalker/weapons/unload/tpc301_open.ogg'

/obj/item/weapon/gun/projectile/automatic/abakan  // ������
	name = "AC-96/2"
	desc = "������ ������� ����� ��������� �����. ��� ���������� � �������� ������ ����������� ���-74/2. � �������� �������� �� ������ ���������� ���������, �� � ��&#255; ��������&#255; ������� ������ �� �������, ��� ������&#255;�� ������� ������, ��� ����� ����������� ������� �������� ��&#255;."
	icon_state = "abakan"
	item_state = "abakan"
	slot_flags = SLOT_BACK
	force = 15
	origin_tech = "combat=6"
	mag_type = /obj/item/ammo_box/magazine/stalker/m545
	fire_sound = 'sound/stalker/weapons/abakan_shoot.ogg'
	can_suppress = 1
	burst_size = 2
	fire_delay = 1
	pin = /obj/item/device/firing_pin
	durability = 200
	w_class = 4
	spread = 6
	recoil = 0.5
	damagelose = 0.2
	can_scope = 1
	drawsound = 'sound/stalker/weapons/draw/abakan_draw.ogg'
	loadsound = 'sound/stalker/weapons/load/abakan_load.ogg'
	opensound = 'sound/stalker/weapons/unload/abakan_open.ogg'

/obj/item/weapon/gun/projectile/automatic/il86  // ��86
	name = "IL86"
	desc = "����� ����, ��� ��� �������� ���� �������� ������ �������������� �� �������� ��37, ��� � ������� ���������� ������� �� ������ �����, � ����� � � ����. ������� ������������ ��86 &#255;��&#255;���&#255; ������� 4-������� ������ � ������&#255; �������� ������� ��������. ��� �������� ������&#255;�� �������� ��&#255; ����� ������, � ��������� �������� ���������� �������� ������������ ������. ���������� ��� �������� ��������� ������&#255;�� � ����������."
	icon_state = "il86"
	item_state = "il86"
	slot_flags = SLOT_BACK
	force = 15
	origin_tech = "combat=6;material=1"
	mag_type = /obj/item/ammo_box/magazine/stalker/m556x45
	fire_sound = 'sound/stalker/weapons/il86_shoot.ogg'
	can_suppress = 1
	zoomable = 1
	zoom_amt = 9
	burst_size = 2
	fire_delay = 1.5
	pin = /obj/item/device/firing_pin
	durability = 90
	w_class = 4
	spread = 3
	recoil = 0.4
	damagelose = 0
	can_scope = 0
	drawsound = 'sound/stalker/weapons/draw/l85_draw.ogg'
	loadsound = 'sound/stalker/weapons/load/groza_load.ogg'
	opensound = 'sound/stalker/weapons/unload/groza_open.ogg'


///////////////////////////// ����������� �������� //////////////////////////////////////////
/obj/item/weapon/gun/projectile/automatic/val  // ���
	name = "AS Val"
	desc = "������ �� ���� ��������� ����������� �������� '��������', �� ������� ���������&#255; �������� ���������, ������������ ����� ����� ������&#255;��, � ����� ����� ����� ���������. ���������� �������������&#255; ��&#255; ���������&#255; ����������������&#255;�� � ������&#255;� �����, ��������� ��������� � ������������ ��������."
	icon_state = "val"
	fire_sound = 'sound/stalker/weapons/vintorez_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/sp9x39val
	suppressed = 1
	can_suppress = 0
	can_unsuppress = 0
	durability = 150
	slot_flags = SLOT_BACK
	force = 15
	origin_tech = "combat=5;materials=1"
	burst_size = 2
	pin = /obj/item/device/firing_pin
	w_class = 4
	spread = 4
	recoil = 0.6
	damagelose = 0.1
	can_scope = 1
	drawsound = 'sound/stalker/weapons/draw/val_draw.ogg'
	loadsound = 'sound/stalker/weapons/load/val_load.ogg'
	opensound = 'sound/stalker/weapons/unload/val_open.ogg'

/obj/item/weapon/gun/projectile/automatic/vintorez  // ��� ��������
	name = "VSS Vintorez"
	desc = "�������� ����������&#255; ����������&#255; '��������'. ������������� ��&#255; ��������� �������� � ������������ ����������� �������� � �������� ��������������� ����������. � ������&#255;��&#255; 400 ������ ��������� ���������� ����� ������� ������. ����� ������� ���������� ������ �����&#255; ������."
	icon_state = "vintorez"
	fire_sound = 'sound/stalker/weapons/vintorez_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/sp9x39vint
	suppressed = 1
	can_suppress = 0
	can_unsuppress = 0
	zoomable = 1
	zoom_amt = 7
	burst_size = 1
	durability = 110
	slot_flags = SLOT_BACK
	force = 15
	origin_tech = "combat=5;materials=1"
	pin = /obj/item/device/firing_pin
	w_class = 4
	spread = 3
	recoil = 0.6
	damagelose = 0
	can_scope = 0
	drawsound = 'sound/stalker/weapons/draw/val_draw.ogg'
	loadsound = 'sound/stalker/weapons/load/val_load.ogg'
	opensound = 'sound/stalker/weapons/unload/val_open.ogg'

/obj/item/weapon/gun/projectile/automatic/groza  // ��-14 �����
	name = "Grom C14"
	desc = "���������-������������ �������� - ����� ������� � ������&#255;� ���� ������� ��������� ��������: ����������, �������, � � �� �� ����&#255; ������������� � ������. '����' ����� ���&#255;� ������� ��������."
	icon_state = "groza"
	fire_sound = 'sound/stalker/weapons/groza_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/sp9x39groza
	can_suppress = 0
	durability = 130
	slot_flags = SLOT_BACK
	force = 15
	origin_tech = "combat=5;materials=1"
	burst_size = 3
	pin = /obj/item/device/firing_pin
	w_class = 4
	spread = 8
	recoil = 0.6
	damagelose = 0.35
	can_scope = 1
	drawsound = 'sound/stalker/weapons/draw/groza_draw.ogg'
	loadsound = 'sound/stalker/weapons/load/groza_load.ogg'
	opensound = 'sound/stalker/weapons/unload/groza_open.ogg'




/obj/item/weapon/gun/projectile/automatic/testgun
	name = "testgun"
	desc = "testing"
	icon_state = "ak74"
	item_state = "gun"
	fire_sound = 'sound/stalker/weapons/ak74_shot.ogg'
	mag_type = /obj/item/ammo_box/magazine/stalker/testgun
	can_suppress = 1
	burst_size = 3
	durability = 1000
	slot_flags = SLOT_BACK|SLOT_BELT
	force = 10
	w_class = 3
	spread = 10
