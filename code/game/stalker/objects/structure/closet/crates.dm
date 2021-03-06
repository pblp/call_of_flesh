/obj/structure/closet/crate/stalker
	icon = 'icons/stalker/crates.dmi'
	anchored = 1

/obj/structure/closet/crate/stalker/blue
	name = "crate"
	desc = "������� �������� &#255;���."
	icon_crate = "blue"
	icon_state = "blue"

/obj/structure/closet/crate/stalker/blue/stash
	name = "stash"
	desc = "� ����� &#255;����� ������ ��&#255;��� �����. ����� �����."
	var/lootcount = 1		//how many items will be spawned
	var/lootdoubles = 1		//if the same item can be spawned twice
	var/list/loot
	var/waspicked = 0
	var/rating_add

/obj/structure/closet/crate/stalker/blue/stash/low
	lootdoubles = 1
	lootcount = 4
	loot = list(
				/obj/item/weapon/gun/projectile/revolver/bm16/sawnoff = 2,
				/obj/item/ammo_box/stalker/b9x18P = 10,
				/obj/item/ammo_box/stalker/b12x70P = 5,
				/obj/item/ammo_box/stalker/b12x70D = 5,
				/obj/item/ammo_box/stalker/b9x19P = 10,
				/obj/item/clothing/suit/hooded/kombez/mercenary = 1,
				/obj/item/clothing/suit/hooded/kombez/kombez_bandit = 1,
				/obj/item/clothing/suit/army = 1,
				/obj/item/clothing/suit/hooded/kozhanka/banditka/coat = 1,
				/obj/item/clothing/suit/hooded/kozhanka/banditka/coat/brown = 1,
				/obj/item/clothing/mask/gas/stalker = 2,
				/obj/nothing = 20
				)
	rating_add = 100

/obj/structure/closet/crate/stalker/blue/stash/medium
	lootdoubles = 1
	lootcount = 2
	loot = list(
				/obj/item/weapon/gun/projectile/automatic/pistol/sip  = 2,
				/obj/item/weapon/gun/projectile/automatic/pistol/cora = 2,
				/obj/item/weapon/gun/projectile/automatic/pistol/marta = 2,
				/obj/item/ammo_box/stalker/b545ap = 8,
				/obj/item/ammo_box/stalker/b55645ap = 8,
				/obj/item/clothing/suit/hooded/kombez = 0.5,
				/obj/item/clothing/suit/hooded/kombez/strazh = 0.5,
				/obj/item/clothing/head/hardhat/tacticalhelmet = 2,
				/obj/nothing = 12
				)
	rating_add = 250

/obj/structure/closet/crate/stalker/blue/stash/high
	lootdoubles = 0
	lootcount = 2
	loot = list(
				/obj/item/weapon/gun/projectile/shotgun/spsa = 1,
				/obj/item/clothing/suit/hooded/kombez/ecolog = 1,
				/obj/item/clothing/suit/hooded/kombez/seva = 1,
				/obj/item/clothing/suit/hooded/kombez/psz9md = 1,
				/obj/item/clothing/suit/skat = 1,
				/obj/item/weapon/gun/projectile/automatic/val = 1,
				/obj/item/weapon/gun/projectile/automatic/vintorez = 1,
				/obj/item/weapon/gun/projectile/automatic/groza = 1,
				/obj/nothing = 2
				)
	rating_add = 1000


/obj/structure/closet/crate/stalker/blue/stash/New()
	..()
	if(prob(40))
		qdel(src)
		return

	if(loot && loot.len)
		for(var/i = lootcount, i > 0, i--)
			if(!loot.len) break
			var/lootspawn = pickweight(loot)
			if(!lootdoubles)
				loot.Remove(lootspawn)

			if(lootspawn)
				new lootspawn(src)

/obj/structure/closet/crate/stalker/blue/stash/open()
	..()
	if(!waspicked && istype(usr, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = usr
		waspicked = 1
		if(istype(H.wear_id, /obj/item/device/stalker_pda))
			var/obj/item/device/stalker_pda/KPK = H.wear_id
			if(KPK.activated)
				show_lenta_message(null, KPK, null, "���", "�������", "�� ���������� ������!", selfsound = 1)


		var/datum/data/record/sk = find_record("sid", H.sid, data_core.stalkers)
		if(sk)
			sk.fields["rating"] += rating_add

	return 1

/obj/structure/closet/stalker
	icon = 'icons/stalker/crates.dmi'
	anchored = 1

/obj/structure/closet/stalker/shkaf
	name = "closet"
	desc = "������� �������� �������."
	icon_state = "shkaf"