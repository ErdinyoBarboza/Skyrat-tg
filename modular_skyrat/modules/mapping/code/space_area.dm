///Cybersun, Forgotten Ship
/area/ruin/space/has_grav/cybersun
	name = "Cybersun"
	icon_state = "spacecontent1"

/area/ruin/space/has_grav/cybersun/atmospherics
	name = "Abandoned Atmospherics Wing"
	icon_state = "atmos"

///Generic Skyrat Ruins

/area/ruin/space/has_grav/powered/skyrat/smugglies
	name = "Suspicious Cargo Installation"

/area/ruin/space/has_grav/powered/skyrat/polychromicfacility
	name = "Abandoned Research Station"

/area/ruin/space/has_grav/powered/skyrat/luna
	name = "Unexplored Location"

/area/ruin/space/has_grav/powered/skyrat/blackmarket
	name = "Shady Market"

///Interdyne, Forward Operating Base
/area/skyrat/interdynefob
	name = "\improper DS-2" //If DS-1 is so great...
	icon = 'icons/area/areas_centcom.dmi'
	icon_state = "syndie-elite"
	area_flags = UNIQUE_AREA | NOTELEPORT
	has_gravity = STANDARD_GRAVITY

/area/skyrat/interdynefob/outside
	name = "\improper DS-2 Outer Periphery"
	icon = 'icons/area/areas_misc.dmi'
	icon_state = "yellow"
	ambience_index = AMBIENCE_MINING

//Cargo
/area/skyrat/interdynefob/cargo
	name = "\improper DS-2 Cargo"
	icon = 'icons/area/areas_station.dmi'
	icon_state = "cargo_bay"

/area/skyrat/interdynefob/cargo/hangar
	name = "\improper DS-2 Hangar"
	icon_state = "quart_perch"

/area/skyrat/interdynefob/cargo/mining_equipment
	name = "\improper DS-2 Mining Equipment"
	icon_state = "mining"

/area/skyrat/interdynefob/cargo/commissary
	name = "\improper DS-2 Abandoned Commissary"
	icon_state = "vacant_commissary"

/area/skyrat/interdynefob/cargo/warehouse
	name = "\improper DS-2 Warehouse"
	icon_state = "cargo_warehouse"

//Bridge
/area/skyrat/interdynefob/bridge
	name = "\improper DS-2 Bridge"
	icon = 'icons/area/areas_station.dmi'
	icon_state = "bridge"

/area/skyrat/interdynefob/bridge/cl
	name = "\improper DS-2 Corporate Liaison's Office"
	icon_state = "hop_office"

/area/skyrat/interdynefob/bridge/admiral
	name = "\improper DS-2 Station Admiral's Office"
	icon_state = "captain"
	sound_environment = SOUND_AREA_WOODFLOOR

/area/skyrat/interdynefob/bridge/vault
	name = "\improper DS-2 Vault"
	icon_state = "nuke_storage"

/area/skyrat/interdynefob/bridge/eva
	name = "\improper DS-2 E.V.A."
	icon_state = "eva"

//Security
/area/skyrat/interdynefob/security
	name = "\improper DS-2 Security"
	icon = 'icons/area/areas_station.dmi'
	icon_state = "security"
	ambience_index = AMBIENCE_DANGER

/area/skyrat/interdynefob/security/armory
	name = "\improper DS-2 Armory"
	icon_state = "armory"

/area/skyrat/interdynefob/security/lawyer
	name = "\improper DS-2 Corporate Lawyer's Office"
	icon_state = "law"

/area/skyrat/interdynefob/security/prison
	name = "\improper DS-2 Long-Term Brig"
	icon_state = "sec_prison"

/area/skyrat/interdynefob/security/prison/quarters
	name = "\improper DS-2 Long-Term Quarters"
	icon_state = "prison_upper"

/area/skyrat/interdynefob/security/prison/deep
	name = "\improper DS-2 Long-Term Storage"
	icon_state = "prison_upper"

/area/skyrat/interdynefob/security/arrivalsec
	name = "\improper DS-2 Security Checkpoint"
	icon_state = "customs_point"

//Service
/area/skyrat/interdynefob/service
	name = "\improper DS-2 Service Wing"
	icon = 'icons/area/areas_station.dmi'
	icon_state = "crew_quarters"

/area/skyrat/interdynefob/service/diner
	name = "\improper DS-2 Diner"
	icon_state = "cafeteria"

/area/skyrat/interdynefob/service/kitchen
	name = "\improper DS-2 Kitchen"
	icon_state = "kitchen"

/area/skyrat/interdynefob/service/freezer
	name = "\improper DS-2 Cold Room"
	icon_state = "kitchen_cold"

/area/skyrat/interdynefob/service/chapel
	name = "\improper DS-2 Chapel"
	icon_state = "chapel"

/area/skyrat/interdynefob/service/dorms
	name = "\improper DS-2 Dormitories"
	icon_state = "dorms"

/area/skyrat/interdynefob/service/dorms/fitness
	name = "\improper DS-2 Fitness Halls"
	icon_state = "fitness"

/area/skyrat/interdynefob/service/dorms/lockerroom
	name = "\improper DS-2 Locker Room"
	icon_state = "locker"

/area/skyrat/interdynefob/service/library
	name = "\improper DS-2 Library"
	icon_state = "library"

/area/skyrat/interdynefob/service/hydroponics
	name = "\improper DS-2 Hydroponics"
	icon_state = "garden"

//Hallways
/area/skyrat/interdynefob/halls
	name = "\improper DS-2 Central Halls"
	icon = 'icons/area/areas_station.dmi'
	icon_state = "hallC"

/area/skyrat/interdynefob/halls/transfer
	name = "\improper DS-2 Transfer Hub"
	icon_state = "hallC"

//Engineering
/area/skyrat/interdynefob/engineering
	name = "\improper DS-2 Engineering"
	icon = 'icons/area/areas_station.dmi'
	icon_state = "engine"

/area/skyrat/interdynefob/toolstorage
	name = "\improper DS-2 Tool Storage"
	icon_state = "tool_storage"

/area/skyrat/interdynefob/solars
	name = "\improper DS-2 Solar Array"
	icon_state = "apmaint"

/area/skyrat/interdynefob/solars/southwest
	name = "\improper DS-2 Port Quarter Solars"
	icon_state = "SolarcontrolAP"

/area/skyrat/interdynefob/solars/northeast
	name = "\improper DS-2 Starboard Bow Solars"
	icon_state = "panelsS"

//Maintenance
/area/skyrat/interdynefob/maintenance
	name = "\improper DS-2 Maintenance"
	icon = 'icons/area/areas_station.dmi'
	icon_state = "maintcentral"

/area/skyrat/interdynefob/maintenance/southwest
	name = "\improper DS-2 Port Quarter Maintenance"
	icon_state = "apmaint"

/area/skyrat/interdynefob/maintenance/northwest
	name = "\improper DS-2 Port Fore Maintenance"
	icon_state = "fpmaint"

/area/skyrat/interdynefob/maintenance/northeast
	name = "\improper DS-2 Starboard Bow Maintenance"
	icon_state = "smaint"

/area/skyrat/interdynefob/maintenance/southeast
	name = "\improper DS-2 Starboard Quarter Maintenance"
	icon_state = "smaint_2"

//Research
/area/skyrat/interdynefob/research
	name = "\improper DS-2 Research"
	icon = 'icons/area/areas_station.dmi'
	icon_state = "research"

/area/skyrat/interdynefob/research/robotics
	name = "\improper DS-2 Robotics Divison"
	icon_state = "robotics"

/area/skyrat/interdynefob/research/toxins
	name = "\improper DS-2 Toxins Lab"
	icon_state = "ord_mix"

/area/skyrat/interdynefob/research/xenobio
	name = "\improper DS-2 Xenobiology"
	icon_state = "xenobio"
	area_flags = HIDDEN_AREA | BLOBS_ALLOWED | UNIQUE_AREA | NO_ALERTS | XENOBIOLOGY_COMPATIBLE

//Medbay
/area/skyrat/interdynefob/medbay
	name = "\improper DS-2 Medical Bay"
	icon = 'icons/area/areas_station.dmi'
	icon_state = "medbay1"

/area/skyrat/interdynefob/medbay/chem
	name = "\improper DS-2 Chemistry"
	icon_state = "chem"

//Special Areas
/area/skyrat/interdynefob/hiddenmaints
	name = "//ERR:NULL_ENTRY"
	icon_state = "unknown"
	requires_power = FALSE
	area_flags = HIDDEN_AREA | BLOBS_ALLOWED | UNIQUE_AREA | NO_ALERTS | NOTELEPORT

/area/skyrat/interdynefob/blacksite
	name = "//ERR:NULL_ENTRY"
	icon = 'icons/area/areas_station.dmi'
	icon_state = "interrogation"
	requires_power = FALSE
//End Of DS2

/area/ruin/space/has_grav/shuttle8532engineering
	name = "Shuttle 8532 Engine Room"

/area/ruin/space/has_grav/shuttle8532researchbay
	name = "Shuttle 8532 Research Bay"

/area/ruin/space/has_grav/shuttle8532cargohall
	name = "Shuttle 8532 Cargo Hall"

/area/ruin/space/has_grav/shuttle8532crewquarters
	name = "Shuttle 8532 Crew Quarters"

/area/ruin/space/has_grav/shuttle8532bridge
	name = "Shuttle 8532 Bridge"

/area/ruin/space/has_grav/vaulttango
	name = "ARBORLINK Vault Tango"

/area/ruin/space/has_grav/waypoint
	name = "Abandoned Station"

/area/ruin/space/has_grav/powered/toy_store
	name = "Toy Store"

/area/ruin/space/has_grav/powered/prison_shuttle
	name = "Prison Shuttle"

/area/ruin/space/has_grav/powered/posterpandamonium
	name = "Strange Shuttle"

//Port Tarkon

/area/ruin/space/has_grav/port_tarkon
	name = "P-T Cryo-Storage"

/area/ruin/space/has_grav/port_tarkon/afthall
	name = "P-T Aft Hallway"

/area/ruin/space/has_grav/port_tarkon/forehall
	name = "P-T Fore Hallway"

/area/ruin/space/has_grav/port_tarkon/starboardhall
	name = "P-T Starboard Hallway"

/area/ruin/space/has_grav/port_tarkon/porthall
	name = "P-T Port Hallway"

/area/ruin/space/has_grav/port_tarkon/trauma
	name = "P-T Trauma Center"
	icon_state = "medbay1"

/area/ruin/space/has_grav/port_tarkon/developement
	name = "P-T Developement Center"
	icon_state = "research"

/area/ruin/space/has_grav/port_tarkon/comms
	name = "P-T Communication Center"
	icon_state = "captain"

/area/ruin/space/has_grav/port_tarkon/power1
	name = "P-T Solar Control"
	icon_state = "engine"

/area/ruin/space/has_grav/port_tarkon/centerhall
	name = "P-T Central Hallway"
	icon_state = "hallC"

/area/ruin/space/has_grav/port_tarkon/secoff
	name = "P-T Security Office"
	icon_state = "security"

/area/ruin/space/has_grav/port_tarkon/atmos
	name = "P-T Atmospheric Center"
	icon_state = "engine"

/area/ruin/space/has_grav/port_tarkon/kitchen
	name = "P-T Kitchen"
	icon_state = "cafeteria"

/area/ruin/space/has_grav/port_tarkon/garden
	name = "P-T Garden"
	icon_state = "garden"

/area/ruin/space/has_grav/port_tarkon/cargo
	name = "P-T Cargo Center"
	icon_state = "cargo"

/area/ruin/space/has_grav/port_tarkon/mining
	name = "P-T Mining Office"
	icon_state = "cargo"

/area/ruin/space/has_grav/port_tarkon/storage
	name = "P-T Warehouse"
	icon_state = "cargo"

/area/ruin/space/has_grav/port_tarkon/toolstorage
	name = "P-T Tool Storage"
	icon_state = "tool_storage"

/area/ruin/space/has_grav/port_tarkon/observ
	name = "P-T Observatory"
	icon_state = "crew_quarters"

/area/ruin/space/has_grav/port_tarkon/dorms
	name = "P-T Dorms"
	icon_state = "crew_quarters"

/area/solars/tarkon
	name = "\improper P-T Solar Array"
	icon_state = "solarsS"
	has_gravity = STANDARD_GRAVITY
