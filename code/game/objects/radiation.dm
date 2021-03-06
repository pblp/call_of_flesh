/proc/radiation_pulse(turf/epicenter, heavy_range, .light_range, severity, log=0)
	if(!epicenter || !severity) return

	if(!istype(epicenter, /turf))
		epicenter = get_turf(epicenter.loc)

	if(heavy_range > light_range)
		light_range = heavy_range

	var/light_severity = severity * 0.5
	for(var/atom/T in range(light_range, epicenter))
		var/distance = get_dist(epicenter, T)
		if(distance < 0)
			distance = 0
		if(distance < heavy_range)
			T.rad_act(severity)
		else if(distance == heavy_range)
			if(prob(50))
				T.rad_act(severity)
			else
				T.rad_act(light_severity)
		else if(distance <= light_range)
			T.rad_act(light_severity)

	if(log)
		log_game("Radiation pulse with size ([heavy_range], [light_range]) and severity [severity] in area [epicenter.loc.name] ")
	return 1

/atom/proc/rad_act(var/severity)
	return 1

/mob/living/carbon/human/rad_act(amount)
	if(amount)
		//var/blocked = run_armor_check(null, "rad"/*, "Your clothes feel warm.", "Your clothes feel warm."*/)
		var/blocked = getarmor_rad()
		//blocked += src.global_armor[attack_flag]

		amount = (amount / 0.75) - blocked
		if(amount < 0)
			amount = 0

		apply_effect(amount, IRRADIATE, 0)
		for(var/obj/I in src) //Radiation is also applied to items held by the mob
			I.rad_act(amount)

/mob/living/carbon/human/proc/getarmor_rad()
	var/armorval = 0
	var/organnum = 0

	for(var/obj/item/organ/limb/organ in organs)
		//if(istype(organ, /obj/item/organ/limb/head))
		//	armorval += 2 * checkarmor(organ, "rad")

		armorval += checkarmor(organ, "rad")
		organnum++
	return (armorval/max(organnum, 1))