Ich möchte mir mal näher ansehen, ob es möglich wäre die Abhängigkeit vom Personal Aid Kit abzuschaffen, indem man den Puls mittels HLW wieder über Null bekommt.

Dazu werfe ich derzeit einen Blick in die pbo cba_main, ace_main und ace_medical.

Im ersten Schritt schaue mir mir zunächst an, welche Infos von all unseren derzeitigen Mods im Spieler selbst gespeichert werden (Spoiler: Es sind 162 Variablen!).

Zum Auslesen nutze ich folgenden Code in der Debug Konsole:

{ diag_log format ["%1 : %2", _x, player getVariable _x]; } forEach (allVariables player);

Als Ergebnis finde ich in der RPT Datei diese Zeilen:

17:34:07 "cba_xeh_explosion : [{if (local (_this select 0)) then {_this call ace_goggles_fnc_handleExplosion};},{_this call ace_hearing_fnc_explosionNear;;}]"
17:34:07 "cba_xeh_inventoryopened : [{_this call ace_vehiclelock_fnc_onOpenInventory;;},{if (_this select 0 == ACE_player) then {_this call ace_backpacks_fnc_onOpenInventory};;}]"
17:34:07 "ace_dragging_candrag : true"
17:34:07 "ace_medical_morphine : 0"
17:34:07 "ace_medical_openwounds : []"
17:34:07 "ace_medical_cantreat_leg_l_bandage : any"
17:34:07 "ace_medical_cantreat_leg_l_packingbandage : any"
17:34:07 "ace_medical_cantreat_leg_l_removetourniquet : any"
17:34:07 "ace_iseod : false"
17:34:07 "ace_medical_bloodpressure : [79.6287,119.652]"
17:34:07 "ace_medical_addedtounitloop : true"
17:34:07 "ace_medical_incardiacarrest : false"
17:34:07 "ace_interact_menu_aaehid : 0"
17:34:07 "ace_rearm_selectedweapononrearm : any"
17:34:07 "tf_globalvolume : 1"
17:34:07 "tf_forcedcurator : false"
17:34:07 "ace_medical_cantreat_hand_l_tourniquet : any"
17:34:07 "ace_medical_cantreat_hand_r_adenosine : any"
17:34:07 "cba_xeh_animchanged : [{_this call ace_dragging_fnc_handleAnimChanged;}]"
17:34:07 "ctab_messages : []"
17:34:07 "ace_medical_airwaystatus : 100"
17:34:07 "ace_interact_menu_atcache_ace_selfactions : any"
17:34:07 "cba_xeh_incomingmissile : [{_this call ace_missileguidance_fnc_onIncomingMissile;}]"
17:34:07 "bis_fnc_feedback_postresethandler : true"
17:34:07 "bis_fnc_feedback_respawnedhandler : true"
17:34:07 "ace_medical_tourniquets : [0,0,0,0,0,0]"
17:34:07 "ace_medical_internalwounds : []"
17:34:07 "ace_medical_heartrateadjustments : []"
17:34:07 "ace_medical_haslostblood : 0"
17:34:07 "german_cammon_uniform : BWA3_Uniform_Fleck"
17:34:07 "ace_medical_cantreat_head_fielddressing : any"
17:34:07 "ace_medical_cantreat_hand_r_bandage : any"
17:34:07 "ace_medical_cantreat_leg_r_tourniquet : any"
17:34:07 "ace_medical_treatmentprevanimcaller : any"
17:34:07 "ace_medical_heartrate : 77.9984"
17:34:07 "sam_grg_range_temping : 0"
17:34:07 "bis_fnc_selectrespawntemplate_respawned : true"
17:34:07 "ace_overheating_rh_usp_temp : 0"
17:34:07 "ace_medical_cantreat_hand_l_epinephrine : any"
17:34:07 "ace_medical_cantreat_leg_l_fielddressing : any"
17:34:07 "ace_overheating_bwa3_g36_time : 614.428"
17:34:07 "cba_xeh_getin : [{_this call ace_attach_fnc_handleGetIn;},{_this call ace_captives_fnc_handleGetIn;}]"
17:34:07 "ace_dragging_carryposition : [0.4,-0.1,-1.25]"
17:34:07 "ace_medical_amountofrevivelives : 2"
17:34:07 "ace_originalspeaker : Male07ENG"
17:34:07 "ace_common_statuseffect_object : tru_0_0"
17:34:07 "tf_force_radio_active : 0.9.8"
17:34:07 "ace_medical_cantreat_body_elasticbandage : any"
17:34:07 "ace_medical_cantreat_body_quikclot : any"
17:34:07 "ace_medical_cantreat_hand_r_morphine : any"
17:34:07 "ace_medical_medicclass : 1"
17:34:07 "cba_xeh_hit : [{_this call ace_hitreactions_fnc_fallDown;}]"
17:34:07 "cba_xeh_local : [{call ace_medical_fnc_handleLocal;},{_this call ace_common_fnc_statusEffect_localEH;}]"
17:34:07 "ace_medical_pain : 0"
17:34:07 "ace_medical_lastuniquewoundid : 1"
17:34:07 "ace_medical_isbleeding : false"
17:34:07 "ace_common_muteunitreasons : ["isPlayer"]"
17:34:07 "ace_onembargo_ace_scopes_adjustment : any"
17:34:07 "ace_medical_cantreat_body_bandage : any"
17:34:07 "ace_medical_cantreat_hand_l_checkpulse : any"
17:34:07 "ace_medical_cantreat_hand_l_checkbloodpressure : any"
17:34:07 "ace_medical_cantreat_hand_r_tourniquet : any"
17:34:07 "ace_medical_cantreat_leg_r_bandage : any"
17:34:07 "ace_medical_cantreat_leg_r_morphine : any"
17:34:07 "cba_xeh_isprocessed : true"
17:34:07 "cba_xeh_fired : [{private _this = [_this select 0, _this select 1, _this select 2, _this select 3, _this select 4, _this select 6, _this select 5];_this execVM "\sam_grg\scripts\sam_grg_temping.sqf";},{_this call L_Suppress_Suppress_sys_fnc_fired;},{private _this = [_this select 0, _this select 1, _this select 2, _this select 3, _this select 4, _this select 6, _this select 5];_this call L_fnc_Immerse_fired;},{_this call BWA3_fnc_handleFired;},{_this call ace_common_fnc_firedEH;},{_this call ace_missileguidance_fnc_onFired;},{_this call ace_javelin_fnc_onFired;}]"
17:34:07 "cba_xeh_init : [{call compile preProcessFileLineNumbers '\z\ace\addons\medical\XEH_init.sqf';},{_this call ace_dragging_fnc_initPerson;},{_this call ace_hearing_fnc_addEarPlugs;},{_dummy = (_this select 0) execVM '\RAV_Lifter_A3\InitMan.sqf';;}]"
17:34:07 "cba_xeh_initpost : [{if (local (_this select 0)) then {_this call ace_common_fnc_setName};;},{_this call ace_common_fnc_muteUnitHandleInitPost;},{[_this select 0] call ace_disposable_fnc_takeLoadedATWeapon;},{_this call ace_respawn_fnc_handleInitPostServer;},{_this call BWA3_fnc_randomizeFacewear;},{_this call ace_captives_fnc_handleUnitInitPost;},{call ace_zeus_fnc_addObjectToCurator;},{[_this select 0] call ace_common_fnc_executePersistent;},{_this call ace_interact_menu_fnc_compileMenu;_this call ace_interact_menu_fnc_compileMenuSelfAction;}]"
17:34:07 "ace_medical_bloodvolume : 100"
17:34:07 "ace_medical_fractures : []"
17:34:07 "ace_medical_triagelevel : 0"
17:34:07 "ace_medical_airwayoccluded : false"
17:34:07 "ace_medical_airwaycollapsed : false"
17:34:07 "ace_medical_haspain : false"
17:34:07 "tf_killset : true"
17:34:07 "ace_medical_cantreat_head_elasticbandage : any"
17:34:07 "ace_medical_cantreat_body_packingbandage : any"
17:34:07 "ace_medical_cantreat_hand_l_removetourniquet : any"
17:34:07 "ace_medical_cantreat_hand_r_elasticbandage : any"
17:34:07 "ace_medical_cantreat_hand_r_checkbloodpressure : any"
17:34:07 "ace_medical_cantreat_leg_r_fielddressing : any"
17:34:07 "ace_medical_cantreat_leg_r_removetourniquet : any"
17:34:07 "ace_dragging_dragposition : [0,1.1,0.092]"
17:34:07 "bis_fnc_feedback_damagepulsinghandler : true"
17:34:07 "bis_fnc_feedback_hitarrayhandler : true"
17:34:07 "ace_nameraw : [3.JgKp]Schmitt"
17:34:07 "ace_medical_occludedmedications : any"
17:34:07 "ace_medical_salineivvolume : 0"
17:34:07 "tf_handlers_set : true"
17:34:07 "stmg_mapgestures_transmit : false"
17:34:07 "ace_medical_cantreat_hand_l_morphine : any"
17:34:07 "ace_medical_cantreat_hand_r_packingbandage : any"
17:34:07 "ace_medical_cantreat_leg_l_adenosine : any"
17:34:07 "cba_xeh_respawn : [{_this call jgkp_camofaces_fnc_respawn;;},{_this call ace_common_fnc_muteUnitHandleRespawn;},{(_this select 0) setVariable ["ace_interaction_assignedFireTeam",(_this select 0) getVariable ["ace_interaction_assignedFireTeam",'MAIN'],true];},{call compile preProcessFileLineNumbers '\z\ace\addons\medical\XEH_respawn.sqf';},{call compile preProcessFileLineNumbers '\z\ace\addons\parachute\XEH_respawn.sqf';},{call compile preProcessFileLineNumbers '\z\ace\addons\rearm\XEH_respawn.sqf';},{call compile preProcessFileLineNumbers '\z\ace\addons\refuel\XEH_respawn.sqf';},{_this call ace_respawn_fnc_handleRespawn;},{_this call ace_captives_fnc_handleRespawn;},{_this call ace_hearing_fnc_handleRespawn;},{_this call ace_common_fnc_restoreVariablesJIP;},{_this call ace_common_fnc_setName;},{_this call ace_common_fnc_resetAllDefaults;},{_this call ace_common_fnc_statusEffect_respawnEH;}]"
17:34:07 "cba_xeh_put : [{[_this select 1,_this select 0,_this select 2] call ace_explosives_fnc_onInventoryChanged;}]"
17:34:07 "ace_dragging_dragdirection : 180"
17:34:07 "ace_dragging_cancarry : true"
17:34:07 "ace_medical_triagecard : []"
17:34:08 "ace_medical_bloodivvolume : 0"
17:34:08 "ace_medical_bodypartstatus : [0,0,0,0,0,0]"
17:34:08 "bis_fnc_addcuratorplayer_handler : 0"
17:34:08 "ace_medical_cantreat_head_packingbandage : any"
17:34:08 "ace_medical_cantreat_head_quikclot : any"
17:34:08 "ace_medical_cantreat_body_fielddressing : any"
17:34:08 "ace_medical_cantreat_hand_r_quikclot : any"
17:34:08 "ace_medical_cantreat_hand_r_atropine : any"
17:34:08 "ace_medical_cantreat_leg_l_morphine : any"
17:34:08 "ace_medical_cantreat_leg_r_quikclot : any"
17:34:08 "ace_medical_cantreat_leg_r_atropine : any"
17:34:08 "ace_medical_cantreat_leg_r_epinephrine : any"
17:34:08 "ace_medical_logfile_activity : [["STR_ace_medical_Check_Pulse_Log","15:00","activity",["[3.JgKp]Schmitt","Normal"]],["STR_ace_medical_Check_Pulse_Log","15:00","activity",["[3.JgKp]Schmitt","80"]],["STR_ace_medical_Check_Pulse_Log","15:00","activity",["[3.JgKp]Schmitt","80"]]]"
17:34:08 "ace_overheating_bwa3_g36_temp : 0"
17:34:08 "ace_medical_allusedmedication : []"
17:34:08 "ace_medical_cantreat_hand_l_fielddressing : any"
17:34:08 "ace_medical_cantreat_hand_l_elasticbandage : any"
17:34:08 "ace_medical_cantreat_leg_r_elasticbandage : any"
17:34:08 "randomValue : <null>"
17:34:08 "cba_xeh_killed : [{_this call ace_goggles_fnc_handleKilled;},{call ace_medical_fnc_handleKilled;},{_this call ace_rearm_fnc_handleKilled;},{_this call ace_refuel_fnc_handleKilled;},{_this call ace_respawn_fnc_handleKilled;},{_this call ace_sandbag_fnc_handleKilled;},{_this call ace_sitting_fnc_handleInterrupt;},{_this call ace_tacticalladder_fnc_handleKilled;},{_this call ace_trenches_fnc_handleKilled;},{_this call ace_tripod_fnc_handleKilled;},{_this call ace_dragging_fnc_handleKilled;},{_this call ace_explosives_fnc_onIncapacitated;},{_this call ace_attach_fnc_handleKilled;},{call ace_cargo_fnc_handleDestroyed;}]"
17:34:08 "ace_dragging_carrydirection : 195"
17:34:08 "ace_name : [3.JgKp]Schmitt"
17:34:08 "ace_medical_bandagedwounds : []"
17:34:08 "ace_goggles_condition : [false,[false,0,0,0],false]"
17:34:08 "ace_medical_cantreat_head_bandage : any"
17:34:08 "ace_medical_cantreat_hand_l_bandage : any"
17:34:08 "ace_medical_cantreat_hand_r_checkpulse : any"
17:34:08 "ace_medical_cantreat_leg_r_adenosine : any"
17:34:08 "ace_medical_logfile_quick_view : [["STR_ace_medical_Check_Pulse_Log","15:00","quick_view",["[3.JgKp]Schmitt","STR_ace_medical_Check_Pulse_Normal"]],["STR_ace_medical_Check_Pulse_Log","15:00","quick_view",["[3.JgKp]Schmitt","80"]],["STR_ace_medical_Check_Pulse_Log","15:00","quick_view",["[3.JgKp]Schmitt","80"]]]"
17:34:08 "cba_xeh_getout : [{_this call ace_attach_fnc_handleGetOut;},{_this call ace_captives_fnc_handleGetOut;}]"
17:34:08 "cba_xeh_isinitialized : true"
17:34:08 "ace_scopes_adjustment : [[0,0,0],[0,0,0],[0,0,0]]"
17:34:08 "ace_oldvalue_ace_overheating_rh_usp_temp : 0"
17:34:08 "ace_medical_cantreat_head_checkbloodpressure : any"
17:34:08 "ace_medical_cantreat_hand_l_packingbandage : any"
17:34:08 "ace_medical_cantreat_hand_l_quikclot : any"
17:34:08 "ace_medical_cantreat_hand_l_atropine : any"
17:34:08 "ace_medical_cantreat_hand_r_fielddressing : any"
17:34:08 "ace_medical_cantreat_leg_l_quikclot : any"
17:34:08 "ace_medical_cantreat_leg_l_atropine : any"
17:34:08 "ace_medical_cantreat_leg_r_packingbandage : any"
17:34:08 "morale : 5"
17:34:08 "cba_xeh_take : [{_this call BWA3_fnc_handleTake;},{_this call ace_overheating_fnc_handleTakeEH;},{if (_this select 0 == ACE_player && {ace_reload_DisplayText} && {(_this select 1) in [uniformContainer (_this select 0),vestContainer (_this select 0),backpackContainer (_this select 0)]} && {_this select 2 == currentMagazine (_this select 0)}) then {[_this select 0,vehicle (_this select 0)] call ace_reload_fnc_displayAmmo};;},{[_this select 0,_this select 1,_this select 2] call ace_explosives_fnc_onInventoryChanged;}]"
17:34:08 "cba_xeh_firednear : [{_this call ace_hearing_fnc_firedNear;;}]"
17:34:08 "bis_fnc_feedback_dirteffecthandler : true"
17:34:08 "ace_medical_peripheralresistance : 100"
17:34:08 "ace_medical_painsuppress : 0"
17:34:08 "ace_action_defaultaction : [2,[0,[0],[[{ace_interact_menu_openedMenuType >= 0},{
if (!ace_interact_menu_actionOnKeyRelease && ace_interact_menu_actionSelected) then {
[ace_interact_menu_openedMenuType,true] call ace_interact_menu_fnc_keyUp;
};
}]]],tru_0_0]"
17:34:08 "ace_hearing_deaf : false"
17:34:08 "ace_medical_cantreat_hand_l_adenosine : any"
17:34:08 "ace_medical_cantreat_leg_l_elasticbandage : any"
17:34:08 "ace_medical_selectedweaponontreatment : ["BWA3_G36","BWA3_G36","Single","BWA3_30Rnd_556x45_G36",30]"
17:34:08 "ace_medical_lastmomentvaluessynced : 613.925"
17:34:08 "ace_isunconscious : false"
17:34:08 "ace_medical_plasmaivvolume : 0"
17:34:08 "ace_medical_alllogs : ["ace_medical_logFile_activity","ace_medical_logFile_quick_view"]"
17:34:08 "ace_parachute_hasreserve : false"
17:34:08 "ace_overheating_rh_usp_time : 133.515"
17:34:08 "ace_medical_cantreat_head_checkpulse : any"
17:34:08 "ace_medical_cantreat_hand_r_epinephrine : any"
17:34:08 "ace_medical_cantreat_hand_r_removetourniquet : any"
17:34:08 "ace_medical_cantreat_leg_l_tourniquet : any"
17:34:08 "ace_medical_cantreat_leg_l_epinephrine : any"
17:34:08 "ace_oldvalue_ace_overheating_bwa3_g36_temp : 0"

Entscheidet ist die Variable 'ace_medical_heartrate'. Fällt diese unter 20, so wird der Spieler bewusstlos. Via Epi steigt der Puls wieder und alles wird gut. Problematisch ist es bei einem Puls von 0 welcher sich via Epi nicht zu erhöhen lassen scheint.

Lösung könnte sein, nach Abschluss einer HLW den Puls z. B. auf 10 zu setzen mit dem Befehl:

player setVariable ["ace_medical_heartrate", 10];

Dann bliebe der Spieler zwar noch bewusstlos, ließe sich aber via Epi auf einen höheren Puls hochbringen.

Zum Testen habe ich das Blutvolumen des Spielers von Normal 100 mit folgendem Befehl auf 20 gesetzt:

player setVariable ["ace_medical_bloodvolume", 20];

Der Spieler wird sofort bewusstlos und der Puls fällt auf 0 (!). Auch wenn man danach das Blutvolumen wieder hochgesetzt mit

player setVariable ["ace_medical_bloodvolume", 100];

bleibt der Puls bei Null. Wenn man nun den Puls versucht manuell auf 60 zu setzen klappt dies nur für den Bruchteil einer Sekunde. Danach fällt der Puls automatisch wieder auf 0 (!) zurück:

player setVariable ["ace_medical_heartrate", 60];

Da hilft es auch nichts Schmerzen zurückzusetzen mit

player setVariable ["ace_medical_pain", 0.0];

Denn der Spieler hat zu diesem Zeitpunkt gemäß Code gar keine Schmerzen.

Was funktioniert ist, wenn man dem Spieler einfach sagt, dass er jetzt eben nicht bewusstlos sein soll und ganz platt den Befehl gibt:

player setVariable ["ace_isunconscious", false];

Dann steht der Spieler tatsächlich wieder auf. Hat aber eigentlich gar keinen Puls. Und das wäre dann seltsam in der Mission. Außerdem fällt der Spieler nach wenigen Sekunden/Minuten wieder um, sobald erkannt wird, dass der Puls bei 0 liegt.

Ich probiere mal neben Blutvolumen auch den Blutdruck zu normalisieren und anschließend Puls und Schmerz auf vertretbare Niveaus zu setzen:

player setVariable ["ace_medical_bloodvolume", 100];
player setVariable ["ace_medical_bloodpressure", [80.0,120.0]];
player setVariable ["ace_medical_heartrate", 60];
player setVariable ["ace_medical_pain", 0.0];

Trotzdem springt der Puls sofort auf 0 zurück.

Allein durch das Editieren von Spieler Variablen kommen wir also nicht weiter. Wir müssen an die ACE Funktionen ran.

Ich durchsuche alle ACE_medical Dateien nach "heartRate" und stoße auf "fnc_handleUnitVitals.sqf".

Interessant ist der Bereich ab Zeile 99 also alles nach "if (GVAR(level) >= 2) then {" zumal hier das Advanced Medical System behandelt wird. Hier steht was jede Sekunde einmal pro Spieler aktualisiert wird.

- Fällt das Blutvolumen unter 30 wird der Spieler für Tod erklärt und falls mehrere Wiederbeleben seitens Server erlaubt sind dann auf ace_medical_inrevivestate true gesetzt. In diesem Kontext wird auch der Puls auf 0 geschraubt (!) via _unit setVariable [QGVAR(heartRate), 0];

- Fällt das Blutvolumen unter 60 wird der Spieler bewusstlos (wenn auch nicht sofort sondern zeitverzögert)

Interessant könnte auch diese Variable sein, die besagt ob der Spieler einen Herzstillstand hat oder nicht:

_unit setVariable [QGVAR(inCardiacArrest), true,true];
bzw.
_unit setVariable [QGVAR(inCardiacArrest), nil,true];
