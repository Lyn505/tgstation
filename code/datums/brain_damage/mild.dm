//Mild traumas are the most common; they are generally minor annoyances.
//They can be cured with mannitol and patience, although brain surgery still works.
//Most of the old brain damage effects have been transferred to the dumbness trauma.

/datum/brain_trauma/mild

/datum/brain_trauma/mild/hallucinations
	name = "Hallucinations"
	desc = "Patient suffers constant hallucinations."
	scan_desc = "schizophrenia"
	gain_text = span_warning("You feel your grip on reality slipping...")
	lose_text = span_notice("You feel more grounded.")

/datum/brain_trauma/mild/hallucinations/on_life(delta_time, times_fired)
	if(owner.stat != CONSCIOUS || owner.IsSleeping() || owner.IsUnconscious())
		return
	if(HAS_TRAIT(owner, TRAIT_HALLUCINATION_SUPPRESSED))
		return

	owner.adjust_hallucinations_up_to(10 SECONDS * delta_time, 100 SECONDS)

/datum/brain_trauma/mild/hallucinations/on_lose()
	owner.remove_status_effect(/datum/status_effect/hallucination)
	return ..()

/datum/brain_trauma/mild/stuttering
	name = "Stuttering"
	desc = "Patient can't speak properly."
	scan_desc = "reduced mouth coordination"
	gain_text = "<span class='warning'>Speaking clearly is getting harder.</span>"
	lose_text = "<span class='notice'>You feel in control of your speech.</span>"

/datum/brain_trauma/mild/stuttering/on_life(delta_time, times_fired)
	owner.adjust_stutter_up_to(5 SECONDS * delta_time, 50 SECONDS)

/datum/brain_trauma/mild/stuttering/on_lose()
	owner.remove_status_effect(/datum/status_effect/speech/stutter)
	return ..()

/datum/brain_trauma/mild/dumbness
	name = "Dumbness"
	desc = "Patient has reduced brain activity, making them less intelligent."
	scan_desc = "reduced brain activity"
	gain_text = "<span class='warning'>You feel dumber.</span>"
	lose_text = "<span class='notice'>You feel smart again.</span>"

/datum/brain_trauma/mild/dumbness/on_gain()
	ADD_TRAIT(owner, TRAIT_DUMB, TRAUMA_TRAIT)
	owner.add_mood_event("dumb", /datum/mood_event/oblivious)
	return ..()

/datum/brain_trauma/mild/dumbness/on_life(delta_time, times_fired)
	owner.adjust_derpspeech_up_to(5 SECONDS * delta_time, 50 SECONDS)
	if(DT_PROB(1.5, delta_time))
		owner.emote("drool")
	else if(owner.stat == CONSCIOUS && DT_PROB(1.5, delta_time))
		owner.say(pick_list_replacements(BRAIN_DAMAGE_FILE, "brain_damage"), forced = "brain damage")

/datum/brain_trauma/mild/dumbness/on_lose()
	REMOVE_TRAIT(owner, TRAIT_DUMB, TRAUMA_TRAIT)
	owner.remove_status_effect(/datum/status_effect/speech/stutter/derpspeech)
	owner.clear_mood_event("dumb")
	return ..()

/datum/brain_trauma/mild/speech_impediment
	name = "Speech Impediment"
	desc = "Patient is unable to form coherent sentences."
	scan_desc = "communication disorder"
	gain_text = "<span class='danger'>You can't seem to form any coherent thoughts!</span>"
	lose_text = "<span class='danger'>Your mind feels more clear.</span>"

/datum/brain_trauma/mild/speech_impediment/on_gain()
	ADD_TRAIT(owner, TRAIT_UNINTELLIGIBLE_SPEECH, TRAUMA_TRAIT)
	..()

/datum/brain_trauma/mild/speech_impediment/on_lose()
	REMOVE_TRAIT(owner, TRAIT_UNINTELLIGIBLE_SPEECH, TRAUMA_TRAIT)
	..()

/datum/brain_trauma/mild/concussion
	name = "Concussion"
	desc = "Patient's brain is concussed."
	scan_desc = "concussion"
	gain_text = "<span class='warning'>Your head hurts!</span>"
	lose_text = "<span class='notice'>The pressure inside your head starts fading.</span>"

/datum/brain_trauma/mild/concussion/on_life(delta_time, times_fired)
	if(DT_PROB(2.5, delta_time))
		switch(rand(1,11))
			if(1)
				owner.vomit()
			if(2,3)
				owner.adjust_dizzy(20 SECONDS)
			if(4,5)
				owner.adjust_confusion(10 SECONDS)
				owner.blur_eyes(10)
			if(6 to 9)
				owner.adjust_slurring(1 MINUTES)
			if(10)
				to_chat(owner, span_notice("You forget for a moment what you were doing."))
				owner.Stun(20)
			if(11)
				to_chat(owner, span_warning("You faint."))
				owner.Unconscious(80)

	..()

/datum/brain_trauma/mild/healthy
	name = "Anosognosia"
	desc = "Patient always feels healthy, regardless of their condition."
	scan_desc = "self-awareness deficit"
	gain_text = "<span class='notice'>You feel great!</span>"
	lose_text = "<span class='warning'>You no longer feel perfectly healthy.</span>"

/datum/brain_trauma/mild/healthy/on_gain()
	owner.apply_status_effect(/datum/status_effect/grouped/screwy_hud/fake_healthy, type)
	return ..()

/datum/brain_trauma/mild/healthy/on_life(delta_time, times_fired)
	owner.adjustStaminaLoss(-2.5 * delta_time) //no pain, no fatigue

/datum/brain_trauma/mild/healthy/on_lose()
	owner.remove_status_effect(/datum/status_effect/grouped/screwy_hud/fake_healthy, type)
	return ..()

/datum/brain_trauma/mild/muscle_weakness
	name = "Muscle Weakness"
	desc = "Patient experiences occasional bouts of muscle weakness."
	scan_desc = "weak motor nerve signal"
	gain_text = "<span class='warning'>Your muscles feel oddly faint.</span>"
	lose_text = "<span class='notice'>You feel in control of your muscles again.</span>"

/datum/brain_trauma/mild/muscle_weakness/on_life(delta_time, times_fired)
	var/fall_chance = 1
	if(owner.m_intent == MOVE_INTENT_RUN)
		fall_chance += 2
	if(DT_PROB(0.5 * fall_chance, delta_time) && owner.body_position == STANDING_UP)
		to_chat(owner, span_warning("Your leg gives out!"))
		owner.Paralyze(35)

	else if(owner.get_active_held_item())
		var/drop_chance = 1
		var/obj/item/I = owner.get_active_held_item()
		drop_chance += I.w_class
		if(DT_PROB(0.5 * drop_chance, delta_time) && owner.dropItemToGround(I))
			to_chat(owner, span_warning("You drop [I]!"))

	else if(DT_PROB(1.5, delta_time))
		to_chat(owner, span_warning("You feel a sudden weakness in your muscles!"))
		owner.adjustStaminaLoss(50)
	..()

/datum/brain_trauma/mild/muscle_spasms
	name = "Muscle Spasms"
	desc = "Patient has occasional muscle spasms, causing them to move unintentionally."
	scan_desc = "nervous fits"
	gain_text = "<span class='warning'>Your muscles feel oddly faint.</span>"
	lose_text = "<span class='notice'>You feel in control of your muscles again.</span>"

/datum/brain_trauma/mild/muscle_spasms/on_gain()
	owner.apply_status_effect(/datum/status_effect/spasms)
	..()

/datum/brain_trauma/mild/muscle_spasms/on_lose()
	owner.remove_status_effect(/datum/status_effect/spasms)
	..()

/datum/brain_trauma/mild/nervous_cough
	name = "Nervous Cough"
	desc = "Patient feels a constant need to cough."
	scan_desc = "nervous cough"
	gain_text = "<span class='warning'>Your throat itches incessantly...</span>"
	lose_text = "<span class='notice'>Your throat stops itching.</span>"

/datum/brain_trauma/mild/nervous_cough/on_life(delta_time, times_fired)
	if(DT_PROB(6, delta_time) && !HAS_TRAIT(owner, TRAIT_SOOTHED_THROAT))
		if(prob(5))
			to_chat(owner, span_warning("[pick("You have a coughing fit!", "You can't stop coughing!")]"))
			owner.Immobilize(20)
			owner.emote("cough")
			addtimer(CALLBACK(owner, /mob/.proc/emote, "cough"), 6)
			addtimer(CALLBACK(owner, /mob/.proc/emote, "cough"), 12)
		owner.emote("cough")
	..()

/datum/brain_trauma/mild/expressive_aphasia
	name = "Expressive Aphasia"
	desc = "Patient is affected by partial loss of speech leading to a reduced vocabulary."
	scan_desc = "inability to form complex sentences"
	gain_text = "<span class='warning'>You lose your grasp on complex words.</span>"
	lose_text = "<span class='notice'>You feel your vocabulary returning to normal again.</span>"

	var/static/list/common_words = world.file2list("strings/1000_most_common.txt")

/datum/brain_trauma/mild/expressive_aphasia/handle_speech(datum/source, list/speech_args)
	var/message = speech_args[SPEECH_MESSAGE]
	if(message)
		var/list/message_split = splittext(message, " ")
		var/list/new_message = list()

		for(var/word in message_split)
			var/suffix = ""
			var/suffix_foundon = 0
			for(var/potential_suffix in list("." , "," , ";" , "!" , ":" , "?"))
				suffix_foundon = findtext(word, potential_suffix, -length(potential_suffix))
				if(suffix_foundon)
					suffix = potential_suffix
					break

			if(suffix_foundon)
				word = copytext(word, 1, suffix_foundon)
			word = html_decode(word)

			if(lowertext(word) in common_words)
				new_message += word + suffix
			else
				if(prob(30) && message_split.len > 2)
					new_message += pick("uh","erm")
					break
				else
					var/list/charlist = text2charlist(word)
					charlist.len = round(charlist.len * 0.5, 1)
					shuffle_inplace(charlist)
					new_message += jointext(charlist, "") + suffix

		message = jointext(new_message, " ")

	speech_args[SPEECH_MESSAGE] = trim(message)

/datum/brain_trauma/mild/mind_echo
	name = "Mind Echo"
	desc = "Patient's language neurons do not terminate properly, causing previous speech patterns to occasionally resurface spontaneously."
	scan_desc = "looping neural pattern"
	gain_text = "<span class='warning'>You feel a faint echo of your thoughts...</span>"
	lose_text = "<span class='notice'>The faint echo fades away.</span>"
	var/list/hear_dejavu = list()
	var/list/speak_dejavu = list()

/datum/brain_trauma/mild/mind_echo/handle_hearing(datum/source, list/hearing_args)
	if(owner == hearing_args[HEARING_SPEAKER])
		return
	if(hear_dejavu.len >= 5)
		if(prob(25))
			var/deja_vu = pick_n_take(hear_dejavu)
			var/static/regex/quoted_spoken_message = regex("\".+\"", "gi")
			hearing_args[HEARING_RAW_MESSAGE] = quoted_spoken_message.Replace(hearing_args[HEARING_RAW_MESSAGE], "\"[deja_vu]\"") //Quotes included to avoid cases where someone says part of their name
			return
	if(hear_dejavu.len >= 15)
		if(prob(50))
			popleft(hear_dejavu) //Remove the oldest
			hear_dejavu += hearing_args[HEARING_RAW_MESSAGE]
	else
		hear_dejavu += hearing_args[HEARING_RAW_MESSAGE]

/datum/brain_trauma/mild/mind_echo/handle_speech(datum/source, list/speech_args)
	if(speak_dejavu.len >= 5)
		if(prob(25))
			var/deja_vu = pick_n_take(speak_dejavu)
			speech_args[SPEECH_MESSAGE] = deja_vu
			return
	if(speak_dejavu.len >= 15)
		if(prob(50))
			popleft(speak_dejavu) //Remove the oldest
			speak_dejavu += speech_args[SPEECH_MESSAGE]
	else
		speak_dejavu += speech_args[SPEECH_MESSAGE]
