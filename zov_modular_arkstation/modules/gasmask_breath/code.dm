/datum/preference/toggle/gas_breath
	category = PREFERENCE_CATEGORY_GAME_PREFERENCES
	savefile_key = "gas_breath"
	savefile_identifier = PREFERENCE_PLAYER

/datum/preference/toggle/gas_breath/apply_to_client_updated(client/client, value)
	if(!value)
		client.mob.stop_sound_channel(CHANNEL_GASMASK)

/obj/item/clothing/mask/gas
	///Does this particular mask have breath noises
	var/breathy = TRUE
	///This covers most of the screen
	var/hearing_range = 5

/obj/item/clothing/mask/gas/signalis_gaiter
	breathy = FALSE

/obj/item/clothing/mask/gas/adjust_visor(mob/living/carbon/user)
	. = ..()
	breathy = up ? FALSE : TRUE

/obj/item/clothing/mask/gas/equipped(mob/living/carbon/human/user, slot)
	. = ..()
	if(!breathy)
		return
	if(HAS_TRAIT(user, TRAIT_NOBREATH))
		STOP_PROCESSING(SSgasmask, src)
		return
	if(user.stat == DEAD)
		STOP_PROCESSING(SSgasmask, src)
		return
	if(slot != ITEM_SLOT_MASK)
		STOP_PROCESSING(SSgasmask, src)
		return
	START_PROCESSING(SSgasmask, src)

/obj/item/clothing/mask/gas/dropped(mob/living/user)
	. = ..()
	STOP_PROCESSING(SSgasmask, src)

/obj/item/clothing/mask/gas/process(seconds_per_tick)
	if(TIMER_COOLDOWN_RUNNING(src, COOLDOWN_GAS_BREATH))
		return
	playsound(src, SFX_GASBREATH, 20, TRUE, channel = CHANNEL_GASMASK)
	TIMER_COOLDOWN_START(src, COOLDOWN_GAS_BREATH, 10 SECONDS)
