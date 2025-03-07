/obj/item/clothing/head/powdered_wig
	name = "powdered wig"
	desc = "A powdered wig."
	icon_state = "pwig"
	inhand_icon_state = "pwig"

/obj/item/clothing/head/hasturhood
	name = "hastur's hood"
	desc = "It's <i>unspeakably</i> stylish."
	icon_state = "hasturhood"
	flags_inv = HIDEHAIR
	flags_cover = HEADCOVERSEYES

/obj/item/clothing/head/syndicatefake
	name = "black space-helmet replica"
	icon_state = "syndicate-helm-black-red"
	inhand_icon_state = "syndicate-helm-black-red"
	desc = "A plastic replica of a Syndicate agent's space helmet. You'll look just like a real murderous Syndicate agent in this! This is a toy, it is not made for use in space!"
	clothing_flags = SNUG_FIT
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR|HIDESNOUT

/obj/item/clothing/head/cueball
	name = "cueball helmet"
	desc = "A large, featureless white orb meant to be worn on your head. How do you even see out of this thing?"
	icon_state = "cueball"
	inhand_icon_state="cueball"
	clothing_flags = SNUG_FIT
	flags_cover = HEADCOVERSEYES|HEADCOVERSMOUTH
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR|HIDESNOUT

/obj/item/clothing/head/snowman
	name = "snowman head"
	desc = "A ball of white styrofoam. So festive."
	icon_state = "snowman_h"
	inhand_icon_state = "snowman_h"
	clothing_flags = SNUG_FIT
	flags_cover = HEADCOVERSEYES
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR|HIDESNOUT

/obj/item/clothing/head/witchwig
	name = "witch costume wig"
	desc = "Eeeee~heheheheheheh!"
	icon_state = "witch"
	inhand_icon_state = "witch"
	flags_inv = HIDEHAIR

/obj/item/clothing/head/maidheadband
	name = "maid headband"
	desc = "Just like from one of those chinese cartoons!"
	icon_state = "maid_headband"

/obj/item/clothing/head/chicken
	name = "chicken suit head"
	desc = "Bkaw!"
	icon_state = "chickenhead"
	inhand_icon_state = "chickensuit"
	clothing_flags = SNUG_FIT
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR|HIDESNOUT

/obj/item/clothing/head/griffin
	name = "griffon head"
	desc = "Why not 'eagle head'? Who knows."
	icon_state = "griffinhat"
	inhand_icon_state = "griffinhat"
	clothing_flags = SNUG_FIT
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR|HIDESNOUT

/obj/item/clothing/head/xenos
	name = "xenos helmet"
	icon_state = "xenos"
	inhand_icon_state = "xenos_helm"
	desc = "A helmet made out of chitinous alien hide."
	clothing_flags = SNUG_FIT
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR|HIDESNOUT
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH

/obj/item/clothing/head/lobsterhat
	name = "foam lobster head"
	desc = "When everything's going to crab, protecting your head is the best choice."
	icon_state = "lobster_hat"
	clothing_flags = SNUG_FIT
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR|HIDESNOUT

/obj/item/clothing/head/drfreezehat
	name = "doctor freeze's wig"
	desc = "A cool wig for cool people."
	icon_state = "drfreeze_hat"
	flags_inv = HIDEHAIR

/obj/item/clothing/head/shrine_wig
	name = "shrine maiden's wig"
	desc = "Purify in style!"
	flags_inv = HIDEHAIR //bald
	icon_state = "shrine_wig"
	inhand_icon_state = "shrine_wig"

	worn_y_offset = 1

/obj/item/clothing/head/cardborg
	name = "cardborg helmet"
	desc = "A helmet made out of a box."
	icon_state = "cardborg_h"
	inhand_icon_state = "cardborg_h"
	clothing_flags = SNUG_FIT
	flags_cover = HEADCOVERSEYES
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR|HIDESNOUT

	dog_fashion = /datum/dog_fashion/head/cardborg

/obj/item/clothing/head/cardborg/equipped(mob/living/user, slot)
	..()
	if(ishuman(user) && (slot & ITEM_SLOT_HEAD))
		var/mob/living/carbon/human/H = user
		if(istype(H.wear_suit, /obj/item/clothing/suit/costume/cardborg))
			var/obj/item/clothing/suit/costume/cardborg/CB = H.wear_suit
			CB.disguise(user, src)

/obj/item/clothing/head/cardborg/dropped(mob/living/user)
	..()
	user.remove_alt_appearance("standard_borg_disguise")

/obj/item/clothing/head/bronze
	name = "bronze hat"
	desc = "A crude helmet made out of bronze plates. It offers very little in the way of protection."
	icon = 'icons/obj/clothing/hats.dmi'
	icon_state = "clockwork_helmet_old"
	clothing_flags = SNUG_FIT
	flags_inv = HIDEEARS|HIDEHAIR
	armor = list(MELEE = 5, BULLET = 0, LASER = -5, ENERGY = -15, BOMB = 10, BIO = 0, FIRE = 20, ACID = 20)

/obj/item/clothing/head/fancy
	name = "fancy hat"
	icon_state = "fancy_hat"
	greyscale_colors = "#E3C937#782A81"
	greyscale_config = /datum/greyscale_config/fancy_hat
	greyscale_config_worn = /datum/greyscale_config/fancy_hat_worn
	flags_1 = IS_PLAYER_COLORABLE_1

/obj/item/clothing/head/football_helmet
	name = "football helmet"
	icon_state = "football_helmet"
	greyscale_colors = "#D74722"
	greyscale_config = /datum/greyscale_config/football_helmet
	greyscale_config_worn = /datum/greyscale_config/football_helmet_worn
	flags_1 = IS_PLAYER_COLORABLE_1

/obj/item/clothing/head/tv_head
	name = "television helmet"
	desc = "A mysterious headgear made from the hollowed out remains of a status display. How very retro-retro-futuristic of you."
	icon_state = "IPC_helmet"
	inhand_icon_state = "syringe_kit"
	lefthand_file = 'icons/mob/inhands/equipment/medical_lefthand.dmi' //Grandfathered in from the wallframe for status displays.
	righthand_file = 'icons/mob/inhands/equipment/medical_righthand.dmi'
	clothing_flags = SNUG_FIT
	flash_protect = FLASH_PROTECTION_SENSITIVE
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH | PEPPERPROOF
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR|HIDESNOUT
	var/has_fov = TRUE

/obj/item/clothing/head/tv_head/Initialize(mapload)
	. = ..()
	if(has_fov)
		AddComponent(/datum/component/clothing_fov_visor, FOV_90_DEGREES)

/obj/item/clothing/head/tv_head/fov_less
	desc = "A mysterious headgear made from the hollowed out remains of a status display. How very retro-retro-futuristic of you. It's very easy to see out of this one."
	has_fov = FALSE

/obj/item/clothing/head/irs
	name = "internal revenue service cap"
	icon_state = "irs_hat"
	inhand_icon_state = "irs_hat"

/obj/item/clothing/head/tmc
	name = "Lost M.C. bandana"
	icon_state = "tmc_hat"
	inhand_icon_state = "tmc_hat"

/obj/item/clothing/head/deckers
	name = "Decker headphones"
	icon_state = "decker_hat"
	inhand_icon_state = "decker_hat"

/obj/item/clothing/head/yuri
	name = "yuri initiate helmet"
	icon_state = "yuri_helmet"
	inhand_icon_state = "yuri_helmet"
	clothing_flags = SNUG_FIT
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR|HIDESNOUT

/obj/item/clothing/head/allies
	name = "allies helmet"
	icon_state = "allies_helmet"
	inhand_icon_state = "allies_helmet"
