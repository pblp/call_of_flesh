/proc/playsound(atom/source, soundin, vol as num, vary, extrarange as num, falloff, channel, surround = 1, repeat_sound = 0, randfreq = 1)

	soundin = get_sfx(soundin) // same sound for everyone

	if(isarea(source))
		throw EXCEPTION("playsound(): source is an area")
		return

	var/frequency
	if(randfreq)
		frequency = get_rand_frequency() // Same frequency for everybody
	else
		frequency = 45000

	var/turf/turf_source = get_turf(source)

 	// Looping through the player list has the added bonus of working for mobs inside containers
	for (var/P in player_list)
		var/mob/M = P
		if(!M || !M.client)
			continue
		if(get_dist(M, turf_source) <= world.view + extrarange)
			var/turf/T = get_turf(M)
			if(T && T.z == turf_source.z)
				M.playsound_local(turf_source, soundin, vol, vary, frequency, falloff, surround, channel, repeat_sound)

/atom/proc/playsound_local(turf/turf_source, soundin, vol as num, vary, frequency, falloff, surround = 1, channel, repeat_sound = 0)
	soundin = get_sfx(soundin)

	var/sound/S = sound(soundin)
	S.wait = 0 //No queue
	if(channel)
		S.channel = channel
	else
		S.channel = 0 //Any channel
	S.volume = vol
	S.repeat = repeat_sound



	if (vary)
		if(frequency)
			S.frequency = frequency
		else
			S.frequency = get_rand_frequency()

	if(isturf(turf_source))
		var/turf/T = get_turf(src)

		//Atmosphere affects sound
	//	var/pressure_factor = 1
	//	var/datum/gas_mixture/hearer_env = T.return_air()
	//	var/datum/gas_mixture/source_env = turf_source.return_air()

	//	if(hearer_env && source_env)
	//		var/pressure = min(hearer_env.return_pressure(), source_env.return_pressure())
	//		if(pressure < ONE_ATMOSPHERE)
	//			pressure_factor = max((pressure - SOUND_MINIMUM_PRESSURE)/(ONE_ATMOSPHERE - SOUND_MINIMUM_PRESSURE), 0)
	//	else //space
	//		pressure_factor = 0

	//	var/distance = get_dist(T, turf_source)
	//	if(distance <= 1)
	//		pressure_factor = max(pressure_factor, 0.15) //touching the source of the sound

	//	S.volume *= pressure_factor
		//End Atmosphere affecting sound

		if(S.volume <= 0)
			return //No sound

		// 3D sounds, the technology is here!
		if (surround)
			var/dx = turf_source.x - T.x // Hearing from the right/left
			S.x = round(max(-SURROUND_CAP, min(SURROUND_CAP, dx)), 1)

			var/dz = turf_source.y - T.y // Hearing from infront/behind
			S.z = round(max(-SURROUND_CAP, min(SURROUND_CAP, dz)), 1)

		// The y value is for above your head, but there is no ceiling in 2d spessmens.
		S.y = 1
		S.falloff = (falloff ? falloff : FALLOFF_SOUNDS)

	src << S

/mob/playsound_local(turf/turf_source, soundin, vol as num, vary, frequency, falloff, surround = 1)
	if(!client || ear_deaf > 0)
		return
	..()

/mob/proc/stopLobbySound()
	src << sound(null, 0, wait = 0, volume = 85, channel = 1)

/client/proc/playtitlemusic()
	if(!ticker || !ticker.login_music)	return
	if(prefs && (prefs.toggles & SOUND_LOBBY))
		src << sound(ticker.login_music, 0, wait = 0, volume = 85, channel = 1) // MAD JAMS

/proc/get_rand_frequency()
	return rand(32000, 55000) //Frequency stuff only works with 45kbps oggs.

/proc/get_sfx(soundin)
	if(istext(soundin))
		switch(soundin)
			if ("shatter") soundin = pick('sound/effects/Glassbr1.ogg','sound/effects/Glassbr2.ogg','sound/effects/Glassbr3.ogg')
			if ("explosion") soundin = pick('sound/effects/Explosion1.ogg','sound/effects/Explosion2.ogg')
			if ("sparks") soundin = pick('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg','sound/effects/sparks4.ogg')
			if ("rustle") soundin = pick('sound/effects/rustle1.ogg','sound/effects/rustle2.ogg','sound/effects/rustle3.ogg','sound/effects/rustle4.ogg','sound/effects/rustle5.ogg')
			if ("bodyfall") soundin = pick('sound/effects/bodyfall1.ogg','sound/effects/bodyfall2.ogg','sound/effects/bodyfall3.ogg','sound/effects/bodyfall4.ogg')
			if ("punch") soundin = pick('sound/weapons/punch1.ogg','sound/weapons/punch2.ogg','sound/weapons/punch3.ogg','sound/weapons/punch4.ogg')
			if ("clownstep") soundin = pick('sound/effects/clownstep1.ogg','sound/effects/clownstep2.ogg')
			if ("swing_hit") soundin = pick('sound/weapons/genhit1.ogg', 'sound/weapons/genhit2.ogg', 'sound/weapons/genhit3.ogg')
			if ("hiss") soundin = pick('sound/voice/hiss1.ogg','sound/voice/hiss2.ogg','sound/voice/hiss3.ogg','sound/voice/hiss4.ogg')
			if ("pageturn") soundin = pick('sound/effects/pageturn1.ogg', 'sound/effects/pageturn2.ogg','sound/effects/pageturn3.ogg')
			if ("gunshot") soundin = pick('sound/weapons/Gunshot.ogg', 'sound/weapons/Gunshot2.ogg','sound/weapons/Gunshot3.ogg','sound/weapons/Gunshot4.ogg')
			if ("ricochet") soundin = pick('sound/weapons/effects/ric1.ogg', 'sound/weapons/effects/ric2.ogg','sound/weapons/effects/ric3.ogg','sound/weapons/effects/ric4.ogg','sound/weapons/effects/ric5.ogg')
			if ("erikafootsteps") soundin = pick('sound/effects/footsteps/tile1.wav','sound/effects/footsteps/tile2.wav','sound/effects/footsteps/tile3.wav','sound/effects/footsteps/tile4.wav')
			if ("grassfootsteps") soundin = pick('sound/effects/footsteps/grass/grass1.wav','sound/effects/footsteps/grass/grass2.wav','sound/effects/footsteps/grass/grass3.wav','sound/effects/footsteps/grass/grass4.wav')
			if ("dirtfootsteps") soundin = pick('sound/effects/footsteps/dirt/dirt1.wav','sound/effects/footsteps/dirt/dirt2.wav','sound/effects/footsteps/dirt/dirt3.wav','sound/effects/footsteps/dirt/dirt4.wav')
			if ("waterfootsteps") soundin = pick('sound/effects/footsteps/water/slosh1.wav','sound/effects/footsteps/water/slosh2.wav','sound/effects/footsteps/water/slosh3.wav','sound/effects/footsteps/water/slosh4.wav')
			if ("sandfootsteps") soundin = pick('sound/effects/footsteps/sand/sand_step1.ogg','sound/effects/footsteps/sand/sand_step2.ogg','sound/effects/footsteps/sand/sand_step3.ogg','sound/effects/footsteps/sand/sand_step4.ogg','sound/effects/footsteps/sand/sand_step5.ogg','sound/effects/footsteps/sand/sand_step6.ogg','sound/effects/footsteps/sand/sand_step7.ogg','sound/effects/footsteps/sand/sand_step8.ogg')
			if ("woodfootsteps") soundin = pick('sound/effects/footsteps/wood/wood_step1.ogg','sound/effects/footsteps/wood/wood_step2.ogg','sound/effects/footsteps/wood/wood_step3.ogg','sound/effects/footsteps/wood/wood_step4.ogg','sound/effects/footsteps/wood/wood_step5.ogg','sound/effects/footsteps/wood/wood_step6.ogg','sound/effects/footsteps/wood/wood_step7.ogg','sound/effects/footsteps/wood/wood_step8.ogg')
			if ("carpetfootsteps") soundin = pick('sound/effects/footsteps/carpet/carpet_step1.ogg','sound/effects/footsteps/carpet/carpet_step2.ogg','sound/effects/footsteps/carpet/carpet_step3.ogg','sound/effects/footsteps/carpet/carpet_step4.ogg','sound/effects/footsteps/carpet/carpet_step5.ogg','sound/effects/footsteps/carpet/carpet_step6.ogg','sound/effects/footsteps/carpet/carpet_step7.ogg','sound/effects/footsteps/carpet/carpet_step8.ogg')
	return soundin
