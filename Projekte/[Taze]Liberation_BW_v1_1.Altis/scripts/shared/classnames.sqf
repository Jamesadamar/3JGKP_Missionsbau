

// !! IF YOU WANT TO EDIT THIS FOR MODDING PURPOSES, PLEASE USE CLASSNAMES_EXTENSIONS.SQF INSTEAD !!
// If you know what you're doing then sure, proceed :)




if ( isNil "FOB_typename" ) then { FOB_typename = "Land_Cargo_HQ_V1_F"; };
if ( isNil "FOB_box_typename" ) then { FOB_box_typename = "B_Slingload_01_Cargo_F"; };
if ( isNil "FOB_truck_typename" ) then { FOB_truck_typename = "B_Truck_01_box_F"; };
if ( isNil "Arsenal_typename" ) then { Arsenal_typename = "B_supplyCrate_F"; };
if ( isNil "Respawn_truck_typename" ) then { Respawn_truck_typename = "B_Truck_01_medical_F"; };
if ( isNil "huron_typename" ) then { huron_typename = "B_Heli_Transport_03_unarmed_F"; };
if ( isNil "ammobox_b_typename" ) then { ammobox_b_typename = "Box_NATO_AmmoVeh_F"; };
if ( isNil "ammobox_o_typename" ) then { ammobox_o_typename = "Box_East_AmmoVeh_F"; };
if ( isNil "opfor_ammobox_transport" ) then { opfor_ammobox_transport = "O_Truck_03_transport_F"; };
if ( isNil "commander_classname" ) then { commander_classname = "B_officer_F"; };
if ( isNil "crewman_classname" ) then { crewman_classname = "B_crew_F" };
if ( isNil "pilot_classname" ) then { pilot_classname = "B_Helipilot_F" };

infantry_units = [
	["BWA3_SL_Tropen",10000,0,0]
	
];
if ( isNil "infantry_units_extension" ) then { infantry_units_extension = [] };
if ( isNil "infantry_units_overwrite" ) then { infantry_units_overwrite = false };
if ( infantry_units_overwrite ) then { infantry_units = infantry_units_extension; } else { infantry_units = infantry_units + infantry_units_extension; };

light_vehicles = [
	["GLT_Quadbike_Tropentarn",0,0,1],
	["GLT_Oshkosh_JLTV_Tropentarn",0,0,2],
	["GLT_Oshkosh_JLTV_Medic_Tropentarn",0,0,2],
	["GLT_Fennek_Tropentarn",0,0,2],
	["GLT_Fennek_Ambulance_Tropentarn",0,0,2],
	["GLT_HEMTT_Transport_Tropentarn",0,0,5],
	["GLT_HEMTT_Covered_Tropentarn",0,0,5],
	["bw_dingo_trop",0,10,2],
	["bw_dingo_gl_trop",0,20,2],
	["B_UGV_01_F",0,0,5],
	["B_UGV_01_rcws_F",0,50,5]
];
if ( isNil "light_vehicles_extension" ) then { light_vehicles_extension = [] };
if ( isNil "light_vehicles_overwrite" ) then { light_vehicles_overwrite = false };
if ( light_vehicles_overwrite ) then { light_vehicles = light_vehicles_extension; } else { light_vehicles = light_vehicles + light_vehicles_extension; };

heavy_vehicles = [
	["GLT_CRV_Tropentarn",0,30,8],
	["GLT_Karakal_Tropentarn",0,30,15],
	["GLT_IFV6_AA_Tropentarn",0,40,15],
	["BWA3_Puma_Tropen",0,75,20],
	["BWA3_Leopard2A6M_Tropen",0,100,25],
	["GLT_M109_Tropentarn",0,750,30]
];
if ( isNil "heavy_vehicles_extension" ) then { heavy_vehicles_extension = [] };
if ( isNil "heavy_vehicles_overwrite" ) then { heavy_vehicles_overwrite = false };
if ( heavy_vehicles_overwrite ) then { heavy_vehicles = heavy_vehicles_extension; } else { heavy_vehicles = heavy_vehicles + heavy_vehicles_extension; };

air_vehicles = [
	["EC635_Unarmed_BW",0,0,10],
	["EC635_AT_BW",0,30,10],
	["EC635_BW",0,30,10],
	["BW_NH90Armed",0,20,12],
	["BW_NH90",0,20,12],
	["GLT_MerlinHC3",0,20,12],
	["UH1D_Transport",0,20,12],
	["UH1D_SAR",0,20,12],
	["B_Heli_Transport_03_F",0,20,15],
	["BWA3_Tiger_Gunpod_FZ",0,150,30],
	["BWA3_Tiger_Gunpod_PARS",0,150,30],
	["BWA3_Tiger_Gunpod_Heavy",0,150,30],
	["BWA3_Tiger_RMK_FZ",0,150,30],
	["BWA3_Tiger_RMK_PARS",0,150,30],
	["BWA3_Tiger_RMK_Heavy",0,150,30],
	["BWA3_Tiger_RMK_Universal",0,150,30],
	["JS_JC_FA18E",0,500,50],
	["JS_JC_FA18F",0,500,50],
	["B_Plane_CAS_01_F",0,500,50]
];
if ( isNil "air_vehicles_extension" ) then { air_vehicles_extension = [] };
if ( isNil "air_vehicles_overwrite" ) then { air_vehicles_overwrite = false };
if ( air_vehicles_overwrite ) then { air_vehicles = air_vehicles_extension; } else { air_vehicles = air_vehicles + air_vehicles_extension; };

static_vehicles = [
	["RHS_M2StaticMG_MiniTripod_USMC_WD",0,10,0],
	["RHS_TOW_TriPod_D",0,30,0],
	["B_Mortar_01_F",0,50,0]
];
if ( isNil "static_vehicles_extension" ) then { static_vehicles_extension = [] };
if ( isNil "static_vehicles_overwrite" ) then { static_vehicles_overwrite = false };
if ( static_vehicles_overwrite ) then { static_vehicles = static_vehicles_extension; } else { static_vehicles = static_vehicles + static_vehicles_extension; };

buildings = [
	["Land_CncBarrierMedium4_F",0,0,0],
	["Land_CncWall4_F",0,0,0],
	["Land_CncShelter_F",0,0,0],
	["Land_HBarrier_5_F",0,0,0],
	["Land_HBarrierBig_F",0,0,0],
	["Land_HBarrierWall6_F",0,0,0],
	["Land_HBarrierWall_corner_F",0,0,0],
	["Land_HBarrierTower_F",0,0,0],
	["Land_BagBunker_Large_F",0,0,0],
	["Land_BagBunker_Small_F",0,0,0],
	["Land_BagBunker_Tower_F",0,0,0],
	["Land_PortableLight_single_F",0,0,0],
	["CamoNet_BLUFOR_open_F",0,0,0],
	["CamoNet_BLUFOR_big_F",0,0,0],
	["Land_Cargo_House_V1_F",0,0,0],
	["Land_Cargo_Patrol_V1_F",0,0,0],
	["Flag_NATO_F",0,0,0],
	["Land_HelipadSquare_F",0,0,0],
	["Land_Razorwire_F",0,0,0],
	["Land_BagFence_Round_F",0,0,0],
	["Land_ToolTrolley_02_F",0,0,0],
	["Land_WeldingTrolley_01_F",0,0,0],
	["Land_GasTank_02_F",0,0,0],
	["Land_Workbench_01_F",0,0,0],
	["Land_WaterTank_F",0,0,0],
	["Land_WaterBarrel_F",0,0,0],
	["Land_MetalCase_01_large_F",0,0,0],
	["Land_CampingChair_V1_F",0,0,0],
	["Land_CampingChair_V2_F",0,0,0],
	["Land_CampingTable_F",0,0,0],
	["MapBoard_altis_F",0,0,0],
	["Land_Metal_rack_Tall_F",0,0,0],
	["PortableHelipadLight_01_blue_F",0,0,0],
	["Land_DieselGroundPowerUnit_01_F",0,0,0],
	["Land_Pallet_MilBoxes_F",0,0,0],
	["Land_PaperBox_open_full_F",0,0,0],
	["Land_ClutterCutter_large_F",0,0,0]
];
if ( isNil "buildings_extension" ) then { buildings_extension = [] };
if ( isNil "buildings_overwrite" ) then { buildings_overwrite = false };
if ( buildings_overwrite ) then { buildings = buildings_extension; } else { buildings = buildings + buildings_extension; };

support_vehicles = [
	[Arsenal_typename,10,0,0],
	[Respawn_truck_typename,20,0,5],
	[FOB_box_typename,30,50,0],
	[FOB_truck_typename,30,50,5],
	["C_Offroad_01_repair_F",5,0,2],
	["ACE_Track",0,10,0],
	["ACE_Wheel",0,10,0],
	["B_Truck_01_Repair_F",10,0,5],
	["B_Truck_01_fuel_F",10,0,5],
	["B_Truck_01_ammo_F",10,0,5],
	["B_Slingload_01_Repair_F",5,0,0],
	["B_Slingload_01_Fuel_F",5,0,0],
	["B_Slingload_01_Ammo_F",5,0,0],
	["Box_NATO_AmmoVeh_F",0,154,0],
	["Box_East_AmmoVeh_F",0,115,0]
];
if ( isNil "support_vehicles_extension" ) then { support_vehicles_extension = [] };
if ( isNil "support_vehicles_overwrite" ) then { support_vehicles_overwrite = false };
if ( support_vehicles_overwrite ) then { support_vehicles = support_vehicles_extension; } else { support_vehicles = support_vehicles + support_vehicles_extension; };

if ( isNil "blufor_squad_inf_light" ) then { blufor_squad_inf_light = [] };
if ( count blufor_squad_inf_light == 0 ) then { blufor_squad_inf_light = [ "B_Soldier_SL_F","B_Soldier_TL_F","B_Soldier_GL_F","B_soldier_AR_F","B_Soldier_GL_F","B_medic_F","B_Soldier_LAT_F","B_Soldier_F","B_Soldier_F" ]; };
if ( isNil "blufor_squad_inf" ) then { blufor_squad_inf = [] };
if ( count blufor_squad_inf == 0 ) then { blufor_squad_inf = [ "B_Soldier_SL_F","B_Soldier_TL_F","B_Soldier_AR_F","B_HeavyGunner_F","B_medic_F","B_Soldier_GL_F","B_Soldier_LAT_F","B_Soldier_LAT_F","B_soldier_M_F","B_Sharpshooter_F" ]; };
if ( isNil "blufor_squad_at" ) then { blufor_squad_at = [] };
if ( count blufor_squad_at == 0 ) then { blufor_squad_at = [ "B_Soldier_SL_F","B_soldier_AT_F","B_soldier_AT_F","B_soldier_AT_F","B_medic_F","B_soldier_F" ]; };
if ( isNil "blufor_squad_aa" ) then { blufor_squad_aa = [] };
if ( count blufor_squad_aa == 0 ) then { blufor_squad_aa = [ "B_Soldier_SL_F","B_soldier_AA_F","B_soldier_AA_F","B_soldier_AA_F","B_medic_F","B_soldier_F" ]; };
if ( isNil "blufor_squad_recon" ) then { blufor_squad_recon = [] };
if ( count blufor_squad_recon == 0 ) then { blufor_squad_recon = [ "B_recon_TL_F","B_recon_F","B_recon_exp_F","B_recon_medic_F","B_recon_LAT_F","B_recon_LAT_F","B_recon_M_F","B_Recon_Sharpshooter_F","B_recon_F" ]; };
if ( isNil "blufor_squad_para" ) then { blufor_squad_para = [] };
if ( count blufor_squad_para == 0 ) then { blufor_squad_para = [ "B_soldier_PG_F","B_soldier_PG_F","B_soldier_PG_F","B_soldier_PG_F","B_soldier_PG_F","B_soldier_PG_F","B_soldier_PG_F","B_soldier_PG_F","B_soldier_PG_F","B_soldier_PG_F" ]; };
if ( isNil "blufor_squad_inf_light" ) then { blufor_squad_inf_light = [] };
if ( count blufor_squad_inf_light == 0 ) then { blufor_squad_inf_light = [ "B_Soldier_SL_F","B_Soldier_TL_F","B_Soldier_GL_F","B_soldier_AR_F","B_Soldier_GL_F","B_medic_F","B_Soldier_LAT_F","B_Soldier_F","B_Soldier_F"]; };
if ( isNil "uavs" ) then { uavs = [] }; uavs = [] + uavs + [ "B_UAV_01_F","B_UAV_02_F","B_UAV_02_CAS_F","B_UGV_01_F","B_UGV_01_rcws_F" ];
if ( isNil "elite_vehicles_extension" ) then { elite_vehicles_extension = [] }; elite_vehicles = [] + elite_vehicles_extension + ["GLT_CRV_Tropentarn","GLT_Karakal_Tropentarn","GLT_IFV6_AA_Tropentarn","BWA3_Puma_Tropen","BWA3_Leopard2A6M_Tropen","B_Plane_CAS_01_F","GLT_M109_Tropentarn","BWA3_Tiger_Gunpod_FZ","BWA3_Tiger_Gunpod_PARS","BWA3_Tiger_Gunpod_Heavy","BWA3_Tiger_RMK_FZ","BWA3_Tiger_RMK_PARS","BWA3_Tiger_RMK_Heavy","BWA3_Tiger_RMK_Universal","JS_JC_FA18E","JS_JC_FA18F","B_Plane_CAS_01_F"];
if ( isNil "ai_resupply_sources_extension" ) then { ai_resupply_sources_extension = [] };
ai_resupply_sources = [] + ai_resupply_sources_extension + [ Respawn_truck_typename, huron_typename, Arsenal_typename, "B_Slingload_01_Ammo_F", "B_APC_Tracked_01_CRV_F", "B_Truck_01_ammo_F", "JNS_Skycrane_Pod_Ammo_BLU_Black" ];
if ( isNil "vehicle_repair_sources_extension" ) then { vehicle_repair_sources_extension = [] };
vehicle_repair_sources = [] + vehicle_repair_sources_extension + [ "B_APC_Tracked_01_CRV_F", "C_Offroad_01_repair_F", "B_Truck_01_Repair_F", "B_Slingload_01_Repair_F", "JNS_Skycrane_Pod_Repair_BLU_Black" ];
if ( isNil "vehicle_rearm_sources_extension" ) then { vehicle_rearm_sources_extension = [] };
vehicle_rearm_sources = [] + vehicle_rearm_sources_extension + [ "B_APC_Tracked_01_CRV_F", "B_Truck_01_ammo_F", "B_Slingload_01_Ammo_F", "JNS_Skycrane_Pod_Ammo_BLU_Black" ];
if ( isNil "vehicle_refuel_sources_extension" ) then { vehicle_refuel_sources_extension = [] };
vehicle_refuel_sources = [] + vehicle_refuel_sources_extension +  [ "B_APC_Tracked_01_CRV_F", "B_Truck_01_fuel_F", "B_Slingload_01_Fuel_F" ];
squads = [
	[blufor_squad_inf_light,20,0,0],
	[blufor_squad_inf,30,0,0],
	[blufor_squad_at,20,25,0],
	[blufor_squad_aa,20,25,0],
	[blufor_squad_recon,25,0,0],
	[blufor_squad_para,20,0,0]
];

if ( isNil "opfor_sentry") then { opfor_sentry = "rhs_msv_efreitor"; };      						// Leichter Schütze
if ( isNil "opfor_rifleman") then { opfor_rifleman = "rhs_msv_efreitor"; };		 					// Rifleman
if ( isNil "opfor_grenadier") then { opfor_grenadier = "rhs_msv_grenadier"; };  					// Grenadier
if ( isNil "opfor_squad_leader") then { opfor_squad_leader = "rhs_msv_officer_armored"; };			// Squadleader
if ( isNil "opfor_team_leader") then { opfor_team_leader = "rhs_msv_officer"; };					// Teamleader
if ( isNil "opfor_marksman") then { opfor_marksman = "rhs_msv_marksman"; };							// Marksman
if ( isNil "opfor_machinegunner") then { opfor_machinegunner = "rhs_msv_machinegunner"; };			// MG
if ( isNil "opfor_heavygunner") then { opfor_heavygunner = "rhs_msv_machinegunner"; };				// MG
if ( isNil "opfor_medic") then { opfor_medic = "rhs_msv_medic"; };									// Arzt
if ( isNil "opfor_rpg") then { opfor_rpg = "rhs_msv_grenadier_rpg"; };								// AT Rifleman
if ( isNil "opfor_at") then { opfor_at = "rhs_msv_LAT"; };											// AT
if ( isNil "opfor_aa") then { opfor_aa = "rhs_vmf_flora_aa"; };										// AA
if ( isNil "opfor_officer") then { opfor_officer = "rhs_msv_LAT"; };								// Officer
if ( isNil "opfor_sharpshooter") then { opfor_sharpshooter = "rhs_msv_marksman"; };					// Sharpshooter
if ( isNil "opfor_sniper") then { opfor_sniper = "rhs_msv_marksman"; };								// Sniper
if ( isNil "opfor_engineer") then { opfor_engineer = "rhs_msv_engineer"; };							// Pionier
if ( isNil "opfor_paratrooper") then { opfor_paratrooper = "rhs_msv_junior_sergeant"; };			// Falschirmspringer
if ( isNil "opfor_mrap") then { opfor_mrap = "rhs_tigr_sts_msv"; };
if ( isNil "opfor_mrap_armed") then { opfor_mrap_armed = "rhs_tigr_sts_msv"; };
if ( isNil "opfor_transport_helo") then { opfor_transport_helo = "RHS_Mi8mt_vdv"; };
if ( isNil "opfor_transport_truck") then { opfor_transport_truck = "RHS_Ural_MSV_01"; };
if ( isNil "opfor_fuel_truck") then { opfor_fuel_truck = "RHS_Ural_Fuel_VDV_01"; };
if ( isNil "opfor_ammo_truck") then { opfor_ammo_truck = "rhs_gaz66_ammo_vdv"; };
if ( isNil "opfor_fuel_container") then { opfor_fuel_container = "Land_Pod_Heli_Transport_04_fuel_F"; };
if ( isNil "opfor_ammo_container") then { opfor_ammo_container = "Land_Pod_Heli_Transport_04_ammo_F"; };
if ( isNil "opfor_flag") then { opfor_flag = "Flag_CSAT_F"; };

militia_squad = [
	"O_G_Soldier_SL_F", 	//Rebell Squadleader
	"O_G_Soldier_A_F",  	//Rebell Munition Träger
	"O_G_Soldier_AR_F", 	//Rebell Maschingunner
	"O_G_medic_F", 			//Rebell Arzt
	"O_G_engineer_F",		//Rebell Pionier
	"O_G_Soldier_exp_F",	//Rebell Pio Bombe
	"O_G_Soldier_GL_F",		//Rebell Grenadier
	"O_G_Soldier_M_F",		//Rebell Marksman
	"O_G_Soldier_F",		//Rebell Schütze
	"O_G_Soldier_LAT_F",	//Rebell Rifleman AT
	"O_G_Soldier_lite_F",	//Rebell Schütze Leicht
	"O_G_Soldier_TL_F"		//Rebell Teamleader
];
if ( isNil "militia_squad_extension" ) then { militia_squad_extension = [] };
if ( isNil "militia_squad_overwrite" ) then { militia_squad_overwrite = false };
if ( militia_squad_overwrite ) then { militia_squad = militia_squad_extension; } else { militia_squad = militia_squad + militia_squad_extension; };

militia_vehicles = [
	"O_G_Offroad_01_armed_F"
];
if ( isNil "militia_vehicles_extension" ) then { militia_vehicles_extension = [] };
if ( isNil "militia_vehicles_overwrite" ) then { militia_vehicles_overwrite = false };
if ( militia_vehicles_overwrite ) then { militia_vehicles = militia_vehicles_extension; } else { militia_vehicles = militia_vehicles + militia_vehicles_extension; };

opfor_vehicles = [
	"rhs_btr80_msv",
	"rhs_btr80_msv",
	"rhs_t90a_tv",
	"rhs_t90a_tv",
	"rhs_zsu234_aa",
	"rhs_tigr_sts_msv",
	"rhs_tigr_sts_msv"
];
if ( isNil "opfor_vehicles_extension" ) then { opfor_vehicles_extension = [] };
if ( isNil "opfor_vehicles_overwrite" ) then { opfor_vehicles_overwrite = false };
if ( opfor_vehicles_overwrite ) then { opfor_vehicles = opfor_vehicles_extension; } else { opfor_vehicles = opfor_vehicles + opfor_vehicles_extension; };

opfor_vehicles_low_intensity = [
	"rhs_btr80_msv",
	"rhs_btr80_msv",
	"rhs_tigr_sts_msv",
	"rhs_tigr_sts_msv"
];
if ( isNil "opfor_vehicles_low_intensity_extension" ) then { opfor_vehicles_low_intensity_extension = [] };
if ( isNil "opfor_vehicles_low_intensity_overwrite" ) then { opfor_vehicles_low_intensity_overwrite = false };
if ( opfor_vehicles_low_intensity_overwrite ) then { opfor_vehicles_low_intensity = opfor_vehicles_low_intensity_extension; } else { opfor_vehicles_low_intensity = opfor_vehicles_low_intensity + opfor_vehicles_low_intensity_extension; };

opfor_battlegroup_vehicles = [
	"rhs_tigr_sts_msv",
	"rhs_tigr_sts_msv",
	"rhs_zsu234_aa",
	"rhs_btr80_msv",
	"RHS_Ural_MSV_01",
	"rhs_t90a_tv",
	"rhs_t90a_tv",
	"rhs_zsu234_aa",
	"RHS_Mi8MTV3_FAB_vdv",
	"RHS_Mi24P_AT_vdv",
	"RHS_Mi8mt_vdv",
	"RHS_Ural_Open_MSV_01"
];
if ( isNil "opfor_battlegroup_vehicles_extension" ) then { opfor_battlegroup_vehicles_extension = [] };
if ( isNil "opfor_battlegroup_vehicles_overwrite" ) then { opfor_battlegroup_vehicles_overwrite = false };
if ( opfor_battlegroup_vehicles_overwrite ) then { opfor_battlegroup_vehicles = opfor_battlegroup_vehicles_extension; } else { opfor_battlegroup_vehicles = opfor_battlegroup_vehicles + opfor_battlegroup_vehicles_extension; };

opfor_battlegroup_vehicles_low_intensity = [
	"rhs_zsu234_aa",
	"rhs_btr80_msv",
	"rhs_tigr_sts_msv",
	"rhs_tigr_sts_msv",
	"RHS_Ural_MSV_01",
	"O_Heli_Transport_04_bench_F",
	"RHS_Ural_Open_MSV_01"
];
if ( isNil "opfor_battlegroup_vehicles_low_intensity_extension" ) then { opfor_battlegroup_vehicles_low_intensity_extension = [] };
if ( isNil "opfor_battlegroup_vehicles_low_intensity_overwrite" ) then { opfor_battlegroup_vehicles_low_intensity_overwrite = false };
if ( opfor_battlegroup_vehicles_low_intensity_overwrite ) then { opfor_battlegroup_vehicles_low_intensity = opfor_battlegroup_vehicles_low_intensity_extension; } else { opfor_battlegroup_vehicles_low_intensity = opfor_battlegroup_vehicles_low_intensity + opfor_battlegroup_vehicles_low_intensity_extension; };

opfor_troup_transports = [
	"rhs_btr80_msv",
	"RHS_Ural_MSV_01",
	"RHS_Mi8mt_vdv",
	"RHS_Ural_Open_MSV_01",
	"rhs_ka60_c"
];
if ( isNil "opfor_troup_transports_extension" ) then { opfor_troup_transports_extension = [] };
if ( isNil "opfor_troup_transports_overwrite" ) then { opfor_troup_transports_overwrite = false };
if ( opfor_troup_transports_overwrite ) then { opfor_troup_transports = opfor_troup_transports_extension; } else { opfor_troup_transports = opfor_troup_transports + opfor_troup_transports_extension; };

opfor_choppers = [
	"RHS_Mi8MTV3_FAB_vdv",
	"RHS_Mi24P_AT_vdv",
	"RHS_Mi8mt_vdv"
];
if ( isNil "opfor_choppers_extension" ) then { opfor_choppers_extension = [] };
if ( isNil "opfor_choppers_overwrite" ) then { opfor_choppers_overwrite = false };
if ( opfor_choppers_overwrite ) then { opfor_choppers = opfor_choppers_extension; } else { opfor_choppers = opfor_choppers + opfor_choppers_extension; };

opfor_air = [
	"RHS_Su25SM_vvsc",
	"RHS_Su25SM_CAS_vvsc",
	"RHS_Su25SM_KH29_vvsc"
];
if ( isNil "opfor_air_extension" ) then { opfor_air_extension = [] };
if ( isNil "opfor_air_overwrite" ) then { opfor_air_overwrite = false };
if ( opfor_air_overwrite ) then { opfor_air = opfor_air_extension; } else { opfor_air = opfor_air + opfor_air_extension; };


civilians = [
	"C_man_1",
	"C_man_polo_6_F",
	"C_man_polo_3_F",
	"C_man_polo_2_F",
	"C_man_polo_4_F",
	"C_man_polo_5_F",
	"C_man_polo_1_F",
	"C_man_p_beggar_F",
	"C_man_1_2_F",
	"C_man_p_fugitive_F",
	"C_man_hunter_1_F",
	"C_journalist_F",
	"C_man_shorts_2_F",
	"C_man_w_worker_F"
];
if ( isNil "civilians_extension" ) then { civilians_extension = [] };
if ( isNil "civilians_overwrite" ) then { civilians_overwrite = false };
if ( civilians_overwrite ) then { civilians = civilians_extension; } else { civilians = civilians + civilians_extension; };

civilian_vehicles = [
	"C_Hatchback_01_F",
	"C_Hatchback_01_sport_F",
	"C_Offroad_01_F",
	"C_SUV_01_F",
	"C_Van_01_transport_F",
	"C_Van_01_box_F",
	"C_Van_01_fuel_F",
	"C_Quadbike_01_F"
];
if ( isNil "civilian_vehicles_extension" ) then { civilian_vehicles_extension = [] };
if ( isNil "civilian_vehicles_overwrite" ) then { civilian_vehicles_overwrite = false };
if ( civilian_vehicles_overwrite ) then { civilian_vehicles = civilian_vehicles_extension; } else { civilian_vehicles = civilian_vehicles + civilian_vehicles_extension; };

GRLIB_blacklisted_from_arsenal = [
	"B_Respawn_Sleeping_bag_blue_F",
	"B_Respawn_Sleeping_bag_brown_F",
	"B_Respawn_TentDome_F",
	"B_Respawn_Sleeping_bag_F",
	"B_Respawn_TentA_F",
	"I_GMG_01_A_weapon_F",
	"O_GMG_01_A_weapon_F",
	"B_GMG_01_A_weapon_F",
	"I_HMG_01_A_weapon_F",
	"B_HMG_01_A_weapon_F",
	"O_HMG_01_A_weapon_F",
	"O_HMG_01_weapon_F",
	"B_HMG_01_weapon_F",
	"I_HMG_01_weapon_F",
	"I_HMG_01_high_weapon_F",
	"O_HMG_01_high_weapon_F",
	"B_HMG_01_high_weapon_F",
	"O_GMG_01_weapon_F",
	"I_GMG_01_weapon_F",
	"B_GMG_01_weapon_F",
	"B_GMG_01_high_weapon_F",
	"I_GMG_01_high_weapon_F",
	"O_GMG_01_high_weapon_F",
	"I_Mortar_01_support_F",
	"B_Mortar_01_support_F",
	"O_Mortar_01_support_F",
	"B_Mortar_01_weapon_F",
	"O_Mortar_01_weapon_F",
	"I_Mortar_01_weapon_F",
	"B_HMG_01_support_F",
	"O_HMG_01_support_F",
	"I_HMG_01_support_F",
	"B_HMG_01_support_high_F",
	"O_HMG_01_support_high_F",
	"I_HMG_01_support_high_F",
	"B_AA_01_weapon_F",
	"O_AA_01_weapon_F",
	"I_AA_01_weapon_F",
	"B_AT_01_weapon_F",
	"O_AT_01_weapon_F",
	"I_AT_01_weapon_F",
	"I_UAV_01_backpack_F",
	"B_UAV_01_backpack_F",
	"O_UAV_01_backpack_F"
];
if ( isNil "blacklisted_from_arsenal_extension" ) then { blacklisted_from_arsenal_extension = [] };
GRLIB_blacklisted_from_arsenal = [] + blacklisted_from_arsenal_extension + GRLIB_blacklisted_from_arsenal;

box_transport_config = [
	[ "B_Truck_01_transport_F", -6.5, [0,	-0.4,	0.4], [0,	-2.1,	0.4], [0,	-3.8,	0.4] ],
	[ "B_Truck_01_covered_F", -6.5, [0,	-0.4,	0.4], [0,	-2.1,	0.4], [0,	-3.8,	0.4] ],
	[ "O_Truck_03_transport_F", -6.5, [0,	-0.8,	0.4], [0,	-2.4,	0.4], [0,	-4.0,	0.4] ],
	[ "O_Truck_03_covered_F", -6.5, [0,	-0.8,	0.4], [0,	-2.4,	0.4], [0,	-4.0,	0.4] ],
	[ "B_Heli_Transport_03_F", -7.5, [0,	2.2,	-1], [0,	0.8,	-1], [0,	-1.0, -1] ],
	[ "B_Heli_Transport_03_unarmed_F", -7.5, [0,	2.2,	-1], [0,	0.8,	-1], [0,	-1.0, -1] ],
	[ "I_Heli_Transport_02_F", -6.5, [0,	4.2,	-1.45], [0,	2.5,	-1.45], [0,	0.8, -1.45], [0,	-0.9, -1.45] ]
];
if ( isNil "box_transport_config_extension" ) then { box_transport_config_extension = [] };
box_transport_config = [] + box_transport_config + box_transport_config_extension;

infantry_units = [ infantry_units ] call F_filterMods;
light_vehicles = [ light_vehicles ] call F_filterMods;
heavy_vehicles = [ heavy_vehicles ] call F_filterMods;
air_vehicles = [ air_vehicles ] call F_filterMods;
support_vehicles = [ support_vehicles ] call F_filterMods;
static_vehicles = [ static_vehicles ] call F_filterMods;
buildings = [ buildings ] call F_filterMods;
build_lists = [[],infantry_units,light_vehicles,heavy_vehicles,air_vehicles,static_vehicles,buildings,support_vehicles,squads];
militia_squad = [ militia_squad , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
militia_vehicles = [ militia_vehicles , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_vehicles = [ opfor_vehicles , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_vehicles_low_intensity = [ opfor_vehicles_low_intensity , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_battlegroup_vehicles = [ opfor_battlegroup_vehicles , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_battlegroup_vehicles_low_intensity = [ opfor_battlegroup_vehicles_low_intensity , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_troup_transports = [ opfor_troup_transports , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_choppers = [ opfor_choppers , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_air = [ opfor_air , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
civilians = [ civilians , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
civilian_vehicles = [ civilian_vehicles , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
military_alphabet = ["Alpha","Bravo","Charlie","Delta","Echo","Foxtrot","Golf","Hotel","India","Juliet","Kilo","Lima","Mike","November","Oscar","Papa","Quebec","Romeo","Sierra","Tango","Uniform","Victor","Whiskey","X-Ray","Yankee","Zulu"];
land_vehicles_classnames = (opfor_vehicles + militia_vehicles);
opfor_squad_low_intensity = [opfor_team_leader,opfor_machinegunner,opfor_medic,opfor_rpg,opfor_sentry,opfor_sentry,opfor_sentry,opfor_sentry];
opfor_squad_8_standard = [opfor_squad_leader,opfor_team_leader,opfor_machinegunner,opfor_heavygunner,opfor_medic,opfor_marksman,opfor_grenadier,opfor_rpg];
opfor_squad_8_infkillers = [opfor_squad_leader,opfor_machinegunner,opfor_machinegunner,opfor_heavygunner,opfor_medic,opfor_marksman,opfor_sharpshooter,opfor_sniper];
opfor_squad_8_tankkillers = [opfor_squad_leader,opfor_medic,opfor_machinegunner,opfor_rpg,opfor_rpg,opfor_at,opfor_at,opfor_at];
opfor_squad_8_airkillers = [opfor_squad_leader,opfor_medic,opfor_machinegunner,opfor_rpg,opfor_rpg,opfor_aa,opfor_aa,opfor_aa];
all_resistance_troops = [] + militia_squad;
all_hostile_classnames = (land_vehicles_classnames + opfor_air + opfor_choppers + opfor_troup_transports + opfor_vehicles_low_intensity);
{ land_vehicles_classnames pushback (_x select 0); } foreach (heavy_vehicles + light_vehicles);
air_vehicles_classnames = [] + opfor_choppers;
{ air_vehicles_classnames pushback (_x select 0); } foreach air_vehicles;
markers_reset = [99999,99999,0];
zeropos = [0,0,0];
squads_names = [ localize "STR_LIGHT_RIFLE_SQUAD", localize "STR_RIFLE_SQUAD", localize "STR_AT_SQUAD", localize "STR_AA_SQUAD",  localize "STR_RECON_SQUAD", localize "STR_PARA_SQUAD" ];
boats_names = [ "B_Boat_Transport_01_F", "B_Boat_Armed_01_minigun_F" ];
ammobox_transports_typenames = [];
{ ammobox_transports_typenames pushback (_x select 0) } foreach box_transport_config;
ammobox_transports_typenames = [ ammobox_transports_typenames , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
elite_vehicles = [ elite_vehicles , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
original_resistance = [ "O_G_Soldier_SL_F","O_G_Soldier_A_F","O_G_Soldier_AR_F","O_G_medic_F","O_G_engineer_F","O_G_Soldier_exp_F","O_G_Soldier_GL_F","O_G_Soldier_M_F","O_G_Soldier_F","O_G_Soldier_LAT_F","O_G_Soldier_lite_F","O_G_Sharpshooter_F","O_G_Soldier_TL_F"];
opfor_infantry = [opfor_sentry,opfor_rifleman,opfor_grenadier,opfor_squad_leader,opfor_team_leader,opfor_marksman,opfor_machinegunner,opfor_heavygunner,opfor_medic,opfor_rpg,opfor_at,opfor_aa,opfor_officer,opfor_sharpshooter,opfor_sniper,opfor_engineer];
GRLIB_intel_table = "Land_CampingTable_small_F";
GRLIB_intel_chair = "Land_CampingChair_V2_F";
GRLIB_intel_file = "Land_File1_F";
GRLIB_intel_laptop = "Land_Laptop_device_F";
GRLIB_ignore_colisions_when_building = [
	"Land_Flush_Light_red_F",
	"Land_Flush_Light_green_F",
	"Land_Flush_Light_yellow_F",
	"Land_runway_edgelight",
	"Land_runway_edgelight_blue_F",
	"Land_HelipadSquare_F",
	"Sign_Sphere100cm_F",
	"TMR_Autorest_Georef",
	"Land_ClutterCutter_large_F"
];
GRLIB_sar_wreck = "Land_Wreck_Heli_Attack_01_F";
GRLIB_sar_fire = "test_EmptyObjectForFireBig";