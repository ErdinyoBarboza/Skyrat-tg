//Mutant variants needs to be a property of all items, because all items can be equipped, despite the mob code only expecting clothing items (ugh)
/obj/item
	var/mutant_variants = NONE
	///Icon file for mob worn overlays, if the user is digi.
	var/icon/worn_icon_digi
	///The config type to use for greyscaled worn sprites for digitigrade characters. Both this and greyscale_colors must be assigned to work.
	var/greyscale_config_worn_digi
	/// Icon file for mob worn overlays, if the user is a vox.
	var/icon/worn_icon_vox
	/// The config type to use for greyscaled worn sprites for vox characters. Both this and greyscale_colors must be assigned to work.
	var/greyscale_config_worn_vox

	var/worn_icon_taur_snake
	var/worn_icon_taur_paw
	var/worn_icon_taur_hoof
	var/worn_icon_muzzled

	var/greyscale_config_worn_taur_snake
	var/greyscale_config_worn_taur_paw
	var/greyscale_config_worn_taur_hoof

/obj/item/clothing/head
	mutant_variants = STYLE_MUZZLE | STYLE_VOX

/obj/item/clothing/mask
	mutant_variants = STYLE_MUZZLE | STYLE_VOX

/obj/item/clothing/glasses
	mutant_variants = STYLE_VOX

/obj/item/clothing/under
	mutant_variants = STYLE_DIGITIGRADE|STYLE_VOX

/obj/item/clothing/suit
	mutant_variants = STYLE_DIGITIGRADE|STYLE_TAUR_ALL|STYLE_VOX

/obj/item/clothing/gloves
	mutant_variants = STYLE_VOX

/obj/item/clothing/shoes
	mutant_variants = STYLE_DIGITIGRADE|STYLE_VOX

/obj/item/clothing/suit/armor
	mutant_variants = STYLE_VOX

/obj/item/clothing/under/color/jumpskirt
	mutant_variants = STYLE_VOX

/obj/item/clothing/under/rank/engineering/chief_engineer/skirt
	mutant_variants = NONE

/obj/item/clothing/under/rank/medical/chief_medical_officer/skirt
	mutant_variants = NONE

/obj/item/clothing/under/rank/civilian/chaplain/skirt
	mutant_variants = NONE

/obj/item/clothing/under/rank/cargo/qm/skirt
	mutant_variants = NONE

/obj/item/clothing/under/rank/captain/skirt
	mutant_variants = NONE

/obj/item/clothing/under/rank/civilian/chaplain/skirt
	mutant_variants = NONE

/obj/item/clothing/under/dress
	mutant_variants = STYLE_VOX

/obj/item/clothing/under/rank/security/officer/skirt
	mutant_variants = NONE

/obj/item/clothing/under/suit/black/skirt
	mutant_variants = NONE

/obj/item/clothing/under/rank/rnd/research_director/skirt
	mutant_variants = NONE

/obj/item/clothing/under/rank/rnd/research_director/alt
	mutant_variants = NONE

/obj/item/clothing/under/rank/rnd/research_director/turtleneck/skirt
	mutant_variants = NONE

/obj/item/clothing/under/rank/civilian/head_of_personnel/skirt
	mutant_variants = NONE

/obj/item/clothing/under/rank/security/head_of_security/skirt
	mutant_variants = NONE

/obj/item/clothing/under/rank/security/head_of_security/alt/skirt
	mutant_variants = NONE

/obj/item/clothing/under/rank/security/warden/skirt
	mutant_variants = NONE

/obj/item/clothing/under/rank/prisoner/skirt
	mutant_variants = NONE

/obj/item/clothing/under/rank/security/officer/skirt
	mutant_variants = NONE

/obj/item/clothing/under/syndicate/skirt
	mutant_variants = NONE

/obj/item/clothing/under/rank/cargo/tech/skirt
	mutant_variants = NONE

/obj/item/clothing/under/rank/civilian/bartender/skirt
	mutant_variants = NONE

/obj/item/clothing/under/rank/civilian/chef/skirt
	mutant_variants = NONE

/obj/item/clothing/under/rank/civilian/head_of_personnel/suit/skirt
	mutant_variants = NONE

/obj/item/clothing/under/rank/civilian/hydroponics/skirt
	mutant_variants = NONE

/obj/item/clothing/under/rank/civilian/janitor/skirt
	mutant_variants = NONE

/obj/item/clothing/under/rank/civilian/lawyer/black/skirt
	mutant_variants = NONE

/obj/item/clothing/under/rank/civilian/lawyer/female/skirt
	mutant_variants = NONE

/obj/item/clothing/under/rank/civilian/lawyer/red/skirt
	mutant_variants = NONE

/obj/item/clothing/under/rank/civilian/lawyer/blue/skirt
	mutant_variants = NONE

/obj/item/clothing/under/rank/civilian/lawyer/bluesuit/skirt
	mutant_variants = NONE

/obj/item/clothing/under/rank/civilian/lawyer/purpsuit/skirt
	mutant_variants = NONE

/obj/item/clothing/under/rank/civilian/mime/skirt
	mutant_variants = NONE

/obj/item/clothing/under/rank/civilian/curator/skirt
	mutant_variants = NONE

/obj/item/clothing/under/rank/engineering/atmospheric_technician/skirt
	mutant_variants = NONE

/obj/item/clothing/under/rank/engineering/engineer/skirt
	mutant_variants = NONE

/obj/item/clothing/under/rank/medical/virologist/skirt
	mutant_variants = NONE

/obj/item/clothing/under/rank/medical/doctor/skirt
	mutant_variants = NONE

/obj/item/clothing/under/rank/medical/chemist
	mutant_variants = NONE

/obj/item/clothing/under/rank/medical/paramedic/skirt
	mutant_variants = NONE

/obj/item/clothing/under/rank/rnd/scientist/skirt
	mutant_variants = NONE

/obj/item/clothing/under/rank/rnd/roboticist/skirt
	mutant_variants = NONE

/obj/item/clothing/under/rank/rnd/geneticist/skirt
	mutant_variants = NONE

/obj/item/clothing/under/rank/security/detective/skirt
	mutant_variants = NONE

/obj/item/clothing/under/rank/security/detective/grey/skirt
	mutant_variants = NONE

/obj/item/clothing/under/suit/white/skirt
	mutant_variants = NONE

/obj/item/clothing/under/suit/black/skirt
	mutant_variants = NONE

/obj/item/clothing/under/suit/black_really/skirt
	mutant_variants = NONE

/obj/item/clothing/under/syndicate/tacticool/skirt
	mutant_variants = NONE

/obj/item/clothing/under/rank/civilian/head_of_personnel/suit/skirt
	mutant_variants = NONE

/obj/item/clothing/under/rank/civilian/head_of_personnel/suit/skirt
	mutant_variants = NONE

/obj/item/clothing/under/rank/civilian/head_of_personnel/suit/skirt
	mutant_variants = NONE

/obj/item/clothing/under/rank/civilian/head_of_personnel/suit/skirt
	mutant_variants = NONE

/obj/item/clothing/under/costume/draculass
	mutant_variants = NONE
