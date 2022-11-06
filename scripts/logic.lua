-- General
function has(item, amount)
  local count = Tracker:ProviderCountForCode(item)

  amount = tonumber(amount)

  if not amount then
    return count > 0
  else
    return count >= amount
  end
end

-- Items
function bugs_held()
  local bugs = Tracker:FindObjectForCode("bugs")
  local location = Tracker:FindObjectForCode("@Agitha's Castle/Agitha's Rewards")

  return bugs.CurrentStage > (MAX_BUGS - location.AvailableChestCount)
end

function burn_webs()
  return has("lantern") or use_bombs()
end

function castle_painting()
  return use_bow() and use_bombs()
end

function damage()
  return has("sword") or has("ball_and_chain") or use_bow() or use_bombs() or has("boots") or has("wolf") or has("spinner")
end

function dominion_rod_level()
  local dominion_rod = Tracker:FindObjectForCode("dominion_rod")

  return dominion_rod.CurrentStage
end

function free_all_monkeys()
  return free_monkey() and (has("lantern") or (SMALL_KEYS_REMOVED and (use_bombs() or has("boots")))) and burn_webs() and has("boomerang") and bokoblin() and (forest_small_keys() >= 4)
end

function free_monkey()
  return has("sword") or has("boots") or has("spinner") or has("ball_and_chain") or has("wolf") or use_bow() or has("clawshot")
end

function hanging_baba()
  return use_bow() or has("clawshot") or has("boomerang")
end

function hanging_web()
  return has("clawshot") or use_bow() or has("boomerang") or has("ball_and_chain")
end

function heavy()
  if has("boots") then
    return true, AccessibilityLevel.Normal
  elseif has("magic") then
    return true, AccessibilityLevel.SequenceBreak
  else
    return false
  end
end

function launch_bombs()
  return use_bombs() and (has("boomerang") or use_bow())
end

function mines_switch()
  if has("boots") then
    return true, AccessibilityLevel.Normal
  elseif has("ball_and_chain") or has("magic") then
    return true, AccessibilityLevel.SequenceBreak
  else
    return false
  end
end

function poe_souls()
  local poe_souls = Tracker:FindObjectForCode("poe_souls")

  return poe_souls.CurrentStage
end

function ranged()
  return has("ball_and_chain") or has("slingshot") or use_bow() or has("clawshot") or has("boomerang")
end

function smash()
  return use_bombs() or has("ball_and_chain")
end

function use_bombs()
  return has("bombs") and faron_field()
end

function use_bow()
  return has("bow") and (forest_open() or sacred_grove())
end

function use_water_bombs()
  return has("bombs") and faron_field()
end

function wooden_door()
  return has("wolf") or has("sword") or smash()
end

-- Enemies
function aeralfos()
  return has("clawshot") and (has("sword") or has("ball_and_chain") or has("wolf"))
end

function argorok()
  local heavy, accessibility = heavy()

  return has("double_clawshot") and heavy and has("ordon_sword"), accessibility
end

function armogohma()
  return use_bow() and (dominion_rod_level() >= 1)
end

function armos()
  return has("sword") or has("ball_and_chain") or use_bow() or has("boots") or has("wolf") or has("clawshot") or use_bombs() or has("spinner")
end

function baba_serpent()
  return has("sword") or has("ball_and_chain") or use_bow() or has("boots") or has("spinner") or has("wolf") or use_bombs()
end

function baby_gohma()
  return has("sword") or has("ball_and_chain") or use_bow() or has("boots") or has("spinner") or has("slingshot") or has("clawshot") and use_bombs()
end

function beamos()
  return has("ball_and_chain") or use_bow() or use_bombs()
end

function big_baba()
  return has("sword") or has("ball_and_chain") or use_bow() or has("boots") or has("wolf") or has("spinner") or use_bombs()
end

function blizzeta()
  return has("ball_and_chain")
end

function bokoblin()
  return has("sword") or has("ball_and_chain") or use_bow() or has("boots") or has("spinner") or has("slingshot") or has("wolf") or use_bombs()
end

function bomskit()
  return has("sword") or has("ball_and_chain") or use_bow() or has("boots") or has("spinner") or has("wolf")
end

function bubble()
  return has("sword") or has("ball_and_chain") or use_bow() or has("boots") or has("spinner") or has("wolf")
end

function bulblin()
  return has("sword") or has("ball_and_chain") or use_bow() or has("boots") or has("spinner") or has("wolf")
end

function chilfos()
  return has("sword") or has("ball_and_chain") or use_bow() or has("boots") or has("wolf")
end

function chu()
  return has("sword") or has("ball_and_chain") or use_bow() or has("boots") or has("spinner") or has("wolf") or has("clawshot") or use_bombs()
end

function chu_worm()
  return (has("sword") or has("ball_and_chain") or use_bow() or has("boots") or has("spinner") or has("wolf")) and (use_bombs() or has("clawshot"))
end

function dangoro()
  return has("boots") and (has("sword") or has("ball_and_chain") or has("wolf"))
end

function darkhammer()
  return has("sword") or has("ball_and_chain") or use_bow() or has("boots") or has("wolf")
end

function darknut()
  return has("sword")
end

function death_sword()
  return has("wolf") and (has("sword") or has("ball_and_chain") or has("boots")) and (has("boomerang") or use_bow() or has("clawshot"))
end

function deku_toad()
  return has("sword") or has("ball_and_chain") or use_bow() or has("boots") or has("wolf")
end

function diababa()
  return (has("boomerang") or (use_bombs() and use_bow())) and (has("sword") or has("ball_and_chain") or has("boots") or has("wolf"))
end

function dinalfos()
  return has("sword") or has("ball_and_chain") or has("wolf")
end

function dodongo()
  return has("sword") or has("ball_and_chain") or use_bow() or has("boots") or has("spinner") or has("wolf")
end

function fire_bubble()
  return has("sword") or has("ball_and_chain") or use_bow() or has("boots") or has("spinner") or has("wolf")
end

function fire_keese()
  return has("sword") or has("ball_and_chain") or use_bow() or has("boots") or has("spinner") or has("slingshot") or has("wolf")
end

function freezard()
  return has("ball_and_chain")
end

function fyrus()
  return use_bow() and has("boots") and has("sword")
end

function ganondorf()
  local skills = Tracker:FindObjectForCode("skills")

  return has("wolf") and has("master_sword") and (skills.CurrentStage >= 1)
end

function ghoul_rat()
  return has("wolf")
end

function goron()
  local skills = Tracker:FindObjectForCode("skills")

  return has("sword") or has("ball_and_chain") or use_bow() or has("boots") or has("spinner") or (has("shield") and (skills.CurrentStage >= 2)) or has("slingshot") or has("lantern") or has("clawshot")
end

function helmasaur()
  return has("sword") or has("ball_and_chain") or use_bow() or has("boots") or has("spinner") or has("wolf")
end

function ice_bubble()
  return has("sword") or has("ball_and_chain") or use_bow() or has("boots") or has("spinner") or has("wolf")
end

function ice_keese()
  return has("sword") or has("ball_and_chain") or use_bow() or has("boots") or has("spinner") or has("slingshot") or has("wolf")
end

function kargarok()
  return has("sword") or has("ball_and_chain") or use_bow() or has("boots") or has("spinner") or has("wolf")
end

function keese()
  return has("sword") or has("ball_and_chain") or use_bow() or has("boots") or has("spinner") or has("slingshot") or has("wolf")
end

function king_bulblin_castle()
  return has("sword") or has("ball_and_chain") or has("wolf")
end

function king_bulblin_desert()
  return has("sword") or has("ball_and_chain") or has("wolf")
end

function leever()
  return has("sword") or has("ball_and_chain") or use_bow() or has("boots") or has("spinner") or has("wolf")
end

function lizalfos()
  return has("sword") or has("ball_and_chain") or use_bow() or has("boots") or has("wolf")
end

function mini_freezard()
  return has("sword") or has("ball_and_chain") or use_bow() or has("boots") or has("spinner") or has("wolf")
end

function morpheel()
  local heavy, accessibility = heavy()

  return has("zora") and heavy and has("sword") and has("clawshot"), accessibility
end

function ook()
  return has("sword") or has("ball_and_chain") or use_bow() or has("boots") or has("wolf")
end

function phantom_zant()
  return has("wolf") or has("sword")
end

function poe()
  return has("wolf")
end

function rat()
  return has("sword") or has("ball_and_chain") or use_bow() or has("boots") or has("spinner") or has("slingshot") or has("wolf")
end

function redead_knight()
  return has("sword") or has("ball_and_chain") or use_bow() or has("boots") or has("wolf")
end

function shadow_beast()
  return has("sword") or (has("wolf") and midna_desperate_hour())
end

function shell_blade()
  return use_water_bombs() or (has("sword") and has("boots"))
end

function skull_kid()
  return use_bow()
end

function skulltula()
  return has("sword") or has("ball_and_chain") or use_bow() or has("boots") or has("spinner") or has("wolf")
end

function stalchild()
  return has("sword") or has("ball_and_chain") or use_bow() or has("boots") or has("spinner") or has("wolf")
end

function stalfos()
  return smash()
end

function stalhound()
  return has("sword") or has("ball_and_chain") or use_bow() or has("boots") or has("spinner") or has("wolf")
end

function stallord()
  return has("spinner") and has("sword")
end

function tektite()
  return has("sword") or has("ball_and_chain") or use_bow() or has("boots") or has("spinner") or has("wolf")
end

function tile_worm()
  return has("boomerang") and (has("sword") or has("ball_and_chain") or use_bow() or has("wolf"))
end

function toadpoli()
  return has("sword") or has("ball_and_chain") or use_bow()
end

function torch_slug()
  return has("sword") or has("ball_and_chain") or use_bow() or has("wolf")
end

function walltula()
  return has("ball_and_chain") or has("slingshot") or use_bow() or has("boomerang") or has("clawshot")
end

function young_gohma()
  return has("sword") or has("ball_and_chain") or use_bow() or has("boots") or has("spinner") or has("wolf")
end

function zant()
  return has("master_sword") and has("boomerang") and has("clawshot") and has("boots") and has("zora") and has("ball_and_chain")
end

function zant_head()
  return has("wolf") or has("sword")
end

-- Golden Wolves
function gerudo_desert_wolf()
  local howling_stone = Tracker:FindObjectForCode("@Lake Hylia South Ledges/Howling Stone")

  return howling_stone.AvailableChestCount == 0
end

function kakariko_graveyard_wolf()
  local howling_stone = Tracker:FindObjectForCode("@Snowpeak Climb/Howling Stone")

  return howling_stone.AvailableChestCount == 0
end

function north_castle_town_wolf()
  local howling_stone = Tracker:FindObjectForCode("@Hidden Village/Howling Stone")

  return howling_stone.AvailableChestCount == 0
end

function ordon_spring_wolf()
  local howling_stone = Tracker:FindObjectForCode("@Death Mountain Trail/Howling Stone")

  return howling_stone.AvailableChestCount == 0
end

function south_hyrule_field_wolf()
  local howling_stone = Tracker:FindObjectForCode("@North Faron Woods/Howling Stone")

  return howling_stone.AvailableChestCount == 0
end

function west_hyrule_field_wolf()
  local howling_stone = Tracker:FindObjectForCode("@Upper Zora's River/Howling Stone")

  return howling_stone.AvailableChestCount == 0
end

-- Events
function complete_intro()
  return has("prologue_skipped") or (has("sword") and has("slingshot") and has("fishing_rod"))
end

function forest_open()
   return has("forest") or has("faron_open")
end

function midna_desperate_hour()
  return has("lakebed") or has("midna_skipped")
end

-- Areas
function arbiters_grounds()
  local bulblin_camp, accessibility = gerudo_desert_bulblin_camp()

  return bulblin_camp and (has("grounds_skipped") or (king_bulblin_desert() and desert_key())), accessibility
end

function arbiters_grounds_boss_room()
  local poe_gate, accessibility = arbiters_grounds_poe_gate()

  return poe_gate and has("spinner") and grounds_big_key(), accessibility
end

function arbiters_grounds_lobby()
  local arbiters_grounds, accessibility = arbiters_grounds()

  return arbiters_grounds and (grounds_small_keys() >= 1) and has("lantern"), accessibility
end

function arbiters_grounds_poe_gate()
  local lobby, accessibility = arbiters_grounds_lobby()

  return lobby and poe() and has("wolf") and has("clawshot") and redead_knight() and stalchild() and bubble() and ghoul_rat() and stalfos() and (grounds_small_keys() >= 4), accessibility
end

function cave_of_ordeals_floor_1()
 return gerudo_desert() and shadow_beast() and has("clawshot")
end

function cave_of_ordeals_floor_12()
  return cave_of_ordeals_floor_1() and bokoblin() and keese() and rat() and baba_serpent() and skulltula() and bulblin() and torch_slug() and fire_keese() and dodongo() and tektite() and lizalfos()
end

function cave_of_ordeals_floor_22()
  return cave_of_ordeals_floor_12() and helmasaur() and rat() and has("spinner") and chu() and chu_worm() and bubble() and bulblin() and keese() and stalhound() and poe() and leever()
end

function cave_of_ordeals_floor_32()
  return cave_of_ordeals_floor_22() and bokoblin() and ice_keese() and has("ball_and_chain") and keese() and rat() and ghoul_rat() and stalchild() and redead_knight() and bulblin() and stalfos() and skulltula() and bubble() and lizalfos() and fire_bubble()
end

function cave_of_ordeals_floor_42()
  return cave_of_ordeals_floor_32() and beamos() and keese() and (dominion_rod_level() >= 2) and torch_slug() and fire_keese() and dodongo() and fire_bubble() and redead_knight() and poe() and ghoul_rat() and chu() and ice_keese() and freezard() and chilfos() and ice_bubble() and leever() and darknut()
end

function city_in_the_sky()
  local skybook = Tracker:FindObjectForCode("skybook")

  return lanayru_field() and has("clawshot") and ((skybook.CurrentStage >= 7) or has("cannon_skipped"))
end

function city_in_the_sky_boss_room()
  local north_wing, accessibility = city_in_the_sky_north_wing()

  return north_wing and has("double_clawshot") and aeralfos() and sky_big_key(), accessibility
end

function city_in_the_sky_east_wing()
  return city_in_the_sky() and has("clawshot") and has("spinner") and sky_small_key()
end

function city_in_the_sky_north_wing()
  local heavy, accessibility = heavy()

  return city_in_the_sky() and has("double_clawshot") and baba_serpent() and kargarok() and has("wolf") and heavy, accessibility
end

function city_in_the_sky_west_wing()
  return city_in_the_sky() and has("double_clawshot")
end

function eldin_field_bombfish_grotto()
  return faron_field() and has("wolf")
end

function eldin_field_bomskit_grotto()
  return faron_field() and has("wolf")
end

function eldin_province_stalfos_grotto()
  return has("wolf") and has("spinner") and (smash() or ((has("lanyru_skipped") or has("wolf")) and gate_keys()))
end

function eldin_province_stockcave()
  return faron_field() and has("clawshot")
end

function faron_field()
  return forest_open()
end

function faron_field_corner_grotto()
  return has("wolf")
end

function faron_woods_mist_cave()
  return south_faron_woods() and has("lantern")
end

function forest_temple()
  return north_faron_woods()
end

function forest_temple_boss_room()
  return forest_temple_lobby() and forest_big_key() and has("boomerang") and (free_all_monkeys() or has("clawshot"))
end

function forest_temple_lobby()
  return forest_temple() and walltula() and bokoblin() and free_monkey()
end

function forest_temple_ook_room()
  local west_wing, accessibility = forest_temple_west_wing()

  if (forest_temple_lobby() and has("lantern") and (forest_small_keys() >= 4)) or (west_wing and (accessibility == AccessibilityLevel.Normal) and has("boomerang")) then
    return true, AccessibilityLevel.Normal
  elseif (forest_temple_lobby() and has("lantern") and (forest_small_keys() >= 3)) or (west_wing and (accessibility == AccessibilityLevel.SequenceBreak) and has("boomerang")) then
    return true, AccessibilityLevel.SequenceBreak
  else
    return false, AccessibilityLevel.None
  end
end

function forest_temple_west_wing()
  if forest_temple_lobby() and burn_webs() and (has("clawshot") or ((forest_small_keys() >= 2) and bokoblin())) then
    return true, AccessibilityLevel.Normal
  elseif forest_temple_lobby() and burn_webs() and ((forest_small_keys() >= 1) and bokoblin()) then
    return true, AccessibilityLevel.SequenceBreak
  else
    return false, AccessibilityLevel.None
  end
end

function ganondorf_castle()
  return hyrule_castle_third_floor_balcony() and (castle_small_keys() >= 2) and has("spinner") and has("double_clawshot") and darknut() and lizalfos() and castle_big_key() and ganondorf()
end

function gerudo_desert()
  return lanayru_field() and has("memo")
end

function gerudo_desert_bulblin_camp()
  if gerudo_desert() and bulblin() then
    return true, AccessibilityLevel.Normal
  elseif gerudo_desert() then
    return true, AccessibilityLevel.SequenceBreak
  else
    return false, AccessibilityLevel.None
  end
end

function gerudo_desert_rock_grotto()
  return gerudo_desert() and has("wolf") and has("clawshot")
end

function gerudo_desert_skulltula_grotto()
  return gerudo_desert() and has("wolf")
end

function goron_mines()
  if faron_field() and has("boots") and goron() then
    return true, AccessibilityLevel.Normal
  elseif faron_field() and goron() and has("shield") and has("wrestling_skipped") then
    return true, AccessibilityLevel.SequenceBreak
  else
    return false, AccessibilityLevel.None
  end
end

function goron_mines_boss_room()
  local north_wing, accessibility = goron_mines_north_wing()

  return north_wing and use_bow() and has("boots") and bulblin() and goron_big_key(), accessibility
end

function goron_mines_crystal_switch_room()
  local lower_west_wing, accessibility = goron_mines_lower_west_wing()

  return lower_west_wing and has("boots"), accessibility
end

function goron_mines_lower_west_wing()
  local magnet_room, accessibility = goron_mines_magnet_room()

  return magnet_room and (goron_small_keys() >= 1), accessibility
end

function goron_mines_magnet_room()
  local entrance, accessibility = goron_mines()

  return entrance and has("boots") and wooden_door(), accessibility
end

function goron_mines_north_wing()
  local crystal_switch_room, accessibility = goron_mines_crystal_switch_room()

  return crystal_switch_room and ((has("boots") and has("sword")) or use_bow()) and (goron_small_keys() >= 2), accessibility
end

function goron_mines_upper_east_wing()
  local north_wing, accessibility = goron_mines_north_wing()

  return north_wing and (goron_small_keys() >= 3), accessibility
end

function hidden_village()
  return lanayru_field() and has("statue")
end

function hyrule_castle()
  local requirement = false
  local shadows = Tracker:ProviderCountForCode("shadow")
  local mirrors = Tracker:ProviderCountForCode("mirror")

  if has("hc_open") then
    requirement = true
  elseif has("hc_shadow") then
    requirement = (shadows >= 3)
  elseif has("hc_mirror") then
    requirement = (mirrors >= 3)
  elseif has("hc_ad") then
    requirement = has("forest") and has("mines") and has("lakebed") and has("grounds") and has("ruins") and has("time") and has("sky") and has("palace")
  elseif has("hc_vanilla") then
    requirement = has("palace")
  end

  return lanayru_field() and requirement and midna_desperate_hour()
end

function hyrule_castle_graveyard()
  return hyrule_castle_outside_east_wing() and has("wolf")
end

function hyrule_castle_main_hall()
  return hyrule_castle() and (castle_small_keys() >= 1)
end

function hyrule_castle_outside_east_wing()
  return hyrule_castle() and bokoblin() and kargarok()
end

function hyrule_castle_outside_west_wing()
  return hyrule_castle() and bokoblin() and kargarok()
end

function hyrule_castle_third_floor_balcony()
  return hyrule_castle_main_hall() and bokoblin() and lizalfos() and has("double_clawshot") and darknut() and has("boomerang") and ((has("lantern") and dinalfos()) or castle_painting())
end

function hyrule_castle_treasure_room()
  return hyrule_castle_third_floor_balcony() and (castle_small_keys() >= 3) and has("spinner") and has("double_clawshot") and darknut() and lizalfos()
end

function kakariko_gorge_lantern_cave()
  return faron_field() and smash()
end

function lake_hylia_bridge_bubble_grotto()
  return lanayru_field() and has("wolf") and launch_bombs() and has("clawshot")
end

function lake_hylia_lantern_cave()
  return lanayru_field() and smash()
end

function lake_hylia_shell_blade_grotto()
  return lanayru_field() and has("wolf")
end

function lake_hylia_toadpoli_grotto()
  return lanayru_field() and has("wolf")
end

function lakebed_temple()
  local heavy, accessibility = heavy()

  return lanayru_field() and has("zora") and (has("lakebed_skipped") or (heavy and use_water_bombs())), accessibility
end

function lakebed_temple_boss_room()
  local central_room, accessibility = lakebed_temple_central_room()

  if central_room and (accessibility == AccessibilityLevel.Normal) and (lakebed_small_keys() >= 3) and launch_bombs() and has("clawshot") and lakebed_big_key() then
    return true, AccessibilityLevel.Normal
  elseif central_room and (accessibility == AccessibilityLevel.SequenceBreak) and (lakebed_small_keys() >= 2) and launch_bombs() and has("clawshot") and lakebed_big_key() then
    return true, AccessibilityLevel.SequenceBreak
  else
    return false, AccessibilityLevel.None
  end
end

function lakebed_temple_central_room()
  local lakebed_temple, accessibility = lakebed_temple()

  return lakebed_temple and launch_bombs(), accessibility
end

function lakebed_temple_east_wing_second_floor()
  local central_room, accessibility = lakebed_temple_central_room()

  return central_room and (lakebed_small_keys() >= 1), accessibility
end

function lakebed_temple_west_wing()
  local central_room, accessibility = lakebed_temple_central_room() 

  if central_room and (accessibility == AccessibilityLevel.Normal) and (lakebed_small_keys() >= 3) and smash() and has("clawshot") then
    return true, AccessibilityLevel.Normal
  elseif central_room and (accessibility == AccessibilityLevel.SequenceBreak) and (lakebed_small_keys() >= 2) and smash() and has("clawshot") then
    return true, AccessibilityLevel.SequenceBreak
  else
    return false, AccessibilityLevel.None
  end
end

function lanayru_field()
  return faron_field() and (smash() or (gate_keys() and (has("lanayru_skipped") or has("wolf"))))
end

function lanayru_field_helmasaur_grotto()
  return lanayru_field() and has("wolf") and has("clawshot")
end

function lanayru_field_ice_cave()
  return lanayru_field() and smash()
end

function lanayru_field_poe_grotto()
  return lanayru_field() and has("wolf")
end

function lanayru_field_skulltula_grotto()
  return lanayru_field() and has("wolf")
end

function lanayru_field_tektite_grotto()
  return lanayru_field() and has("wolf")
end

function north_faron_woods()
  return south_faron_woods() and complete_intro() and (has("lantern") or has("wolf"))
end

function ordon_ranch_grotto()
  return complete_intro() and has("wolf")
end

function palace_of_twilight()
  local arbiters_grounds_boss_room, accessibility = arbiters_grounds_boss_room()
  local requirement = false
  local shadows = Tracker:ProviderCountForCode("shadow")
  local mirrors = Tracker:ProviderCountForCode("mirror")

  if has("palace_open") then
    requirement = true
  elseif has("palace_shadow") then
    requirement = (shadows >= 3)
  elseif has("palace_mirror") then
    requirement = (mirrors >= 3)
  elseif has("palace_vanilla") then
    requirement = has("sky")
  end

  return arbiters_grounds_boss_room and stallord() and requirement, accessibility
end

function palace_of_twilight_boss_room()
  return palace_of_twilight_north_tower() and (palace_small_keys() >= 7) and zant_head() and has("light_sword") and palace_big_key() and shadow_beast()
end

function palace_of_twilight_east_wing()
  return palace_of_twilight() and phantom_zant() and has("clawshot") and zant_head() and (palace_small_keys() >= 2)
end

function palace_of_twilight_north_tower()
  return palace_of_twilight() and has("light_sword") and phantom_zant() and has("clawshot") and zant_head() and (palace_small_keys() >= 4) and shadow_beast()
end

function sacred_grove()
  return north_faron_woods() and has("wolf")
end

function sacred_grove_arena()
  return has("grove_skipped") or (skull_kid() and has("wolf"))
end

function sacred_grove_baba_serpent_grotto()
  return smash() and has("wolf")
end

function snowpeak_freezard_grotto()
  return zora_domain() and has("wolf") and (has("coral_earring") or has("ruins_skipped"))
end

function snowpeak_ruins()
  return snowpeak_summit() and shadow_beast()
end

function snowpeak_ruins_boss_room()
  local west_courtyard, accessibility = snowpeak_ruins_west_courtyard()

  if west_courtyard and (accessibility == AccessibilityLevel.Normal) and (ruins_small_keys() >= 4) and ruins_cheese() and has("ball_and_chain") and use_bombs() and ruins_big_key() then
    return true, AccessibilityLevel.Normal
  elseif west_courtyard and (accessibility == AccessibilityLevel.SequenceBreak) and (ruins_small_keys() >= 2) and ruins_cheese() and has("ball_and_chain") and use_bombs() and ruins_big_key() then
    return true, AccessibilityLevel.SequenceBreak
  else
    return false, AccessibilityLevel.None
  end
end

function snowpeak_ruins_caged_freezard_room()
  return snowpeak_ruins() and ruins_cheese()
end

function snowpeak_ruins_chapel()
  local west_courtyard, accessibility = snowpeak_ruins_west_courtyard()

  if west_courtyard and (accessibility == AccessibilityLevel.Normal) and (ruins_small_keys() >= 4) and ruins_cheese() and has("ball_and_chain") and use_bombs() then
    return true, AccessibilityLevel.Normal
  elseif west_courtyard and (accessibility == AccessibilityLevel.SequenceBreak) and (ruins_small_keys() >= 2) and ruins_cheese() and has("ball_and_chain") and use_bombs() then
    return true, AccessibilityLevel.SequenceBreak
  else
    return false, AccessibilityLevel.None
  end
end

function snowpeak_ruins_chilfos_room_first_floor()
  if snowpeak_ruins_east_courtyard() and (((ruins_small_keys() >= 4) and mini_freezard()) or (ruins_small_keys() >= 2 and has("clawshot") and mini_freezard())) then
    return true, AccessibilityLevel.Normal
  elseif snowpeak_ruins_east_courtyard() and (ruins_small_keys() >= 1) and mini_freezard() then
    return true, AccessibilityLevel.SequenceBreak
  else
    return false, AccessibilityLevel.None
  end
end

function snowpeak_ruins_chilfos_room_second_floor()
  local mini_freezard_room, accessibility = snowpeak_ruins_mini_freezard_room()

  return mini_freezard_room and has("ball_and_chain") and has("clawshot") and chilfos(), accessibility
end

function snowpeak_ruins_darkhammer_room()
  local west_courtyard, accessibility = snowpeak_ruins_west_courtyard()

  if west_courtyard and (accessibility == AccessibilityLevel.Normal) and (has("ball_and_chain") or (((ruins_small_keys() >= 2) or ruins_cheese()) and use_bombs())) then
    return true, AccessibilityLevel.Normal
  elseif west_courtyard and (accessibility == AccessibilityLevel.SequenceBreak) and (has("ball_and_chain") or (((ruins_small_keys() >= 1) or ruins_cheese()) and use_bombs())) then
    return true, AccessibilityLevel.SequenceBreak
  else
    return false, AccessibilityLevel.None
  end
end

function snowpeak_ruins_east_courtyard()
  return snowpeak_ruins() and (has("wolf") or has("ball_and_chain"))
end

function snowpeak_ruins_mini_freezard_room()
  if snowpeak_ruins_caged_freezard_room() and has("ball_and_chain") and (ruins_small_keys() >= 3) then
    return true, AccessibilityLevel.Normal
  elseif snowpeak_ruins_caged_freezard_room() and has("ball_and_chain") and (ruins_small_keys() >= 1) then
    return true, AccessibilityLevel.SequenceBreak
  else
    return false, AccessibilityLevel.None
  end
end

function snowpeak_ruins_west_cannon_room()
  local west_courtyard, accessibility = snowpeak_ruins_west_courtyard()

  if (west_courtyard and (accessibility == AccessibilityLevel.Normal)) or (snowpeak_ruins_caged_freezard_room() and has("ball_and_chain")) then
    return true, AccessibilityLevel.Normal
  elseif west_courtyard and (accessibility == AccessibilityLevel.SequenceBreak) then
    return true, AccessibilityLevel.SequenceBreak
  else
    return false, AccessibilityLevel.None
  end
end

function snowpeak_ruins_west_courtyard()
  if snowpeak_ruins() and (ruins_pumpkin() or has("ball_and_chain") or (ruins_cheese() and (ruins_small_keys() >= 2))) then
    return true, AccessibilityLevel.Normal
  elseif snowpeak_ruins() and ruins_cheese() and (ruins_small_keys() >= 1) then
    return true, AccessibilityLevel.SequenceBreak
  else
    return false, AccessibilityLevel.None
  end
end

function snowpeak_ruins_wooden_beam_room()
  local west_cannon_room, accessibility = snowpeak_ruins_west_cannon_room()

  if (west_cannon_room and (accessibility == AccessibilityLevel.Normal) and smash()) or (snowpeak_ruins_caged_freezard_room() and has("ball_and_chain")) then
    return true, AccessibilityLevel.Normal
  elseif west_cannon_room and (accessibility == AccessibilityLevel.SequenceBreak) and smash() then
    return true, AccessibilityLevel.SequenceBreak
  else
    return false, AccessibilityLevel.None
  end
end

function snowpeak_summit()
  return zora_domain() and has("wolf") and (has("coral_earring") or has("ruins_skipped"))
end

function south_faron_woods()
  return has("prologue_skipped") or (has("sword") and has("slingshot"))
end

function temple_of_time()
  return sacred_grove_arena() and (has("grove_skipped") or (shadow_beast() and has("master_sword")))
end

function temple_of_time_armos_antechamber()
  return temple_of_time_central_mechanical_platform() and has("spinner")
end

function temple_of_time_boss_room()
  return temple_of_time_crumbling_corridor() and (dominion_rod_level() >= 1) and time_big_key()
end

function temple_of_time_central_mechanical_platform()
  return temple_of_time_connecting_corridors() and ranged() and young_gohma() and lizalfos()
end

function temple_of_time_connecting_corridors()
  return temple_of_time() and (time_small_keys() >= 1)
end

function temple_of_time_crumbling_corridor()
  return temple_of_time() and (dominion_rod_level() >= 1) and use_bow() and has("spinner") and lizalfos() and dinalfos() and darknut() and (time_small_keys() >= 3)
end

function temple_of_time_darknut_arena()
  return temple_of_time_scales_of_time() and lizalfos() and baby_gohma() and young_gohma() and armos() and (time_small_keys() >= 3)
end

function temple_of_time_floor_switch_puzzle_room()
  return temple_of_time_scales_of_time() and has("clawshot") and has("spinner")
end

function temple_of_time_moving_wall_hallways()
  return temple_of_time_central_mechanical_platform() and has("spinner") and (time_small_keys() >= 2)
end

function temple_of_time_scales_of_time()
  return temple_of_time_moving_wall_hallways() and use_bow() and lizalfos() and dinalfos()
end

function zora_domain()
  return lanayru_field() and (smash() or has("wolf"))
end

-- Keys
function castle_big_key()
  return BIG_KEYS_REMOVED or has("castle_big_key")
end

function castle_small_keys()
  local keys = Tracker:FindObjectForCode("castle_small_keys")

  if SMALL_KEYS_REMOVED then
    return MAX_SMALL_KEYS 
  else
    return keys.CurrentStage
  end
end

function desert_key()
  return SMALL_KEYS_REMOVED or has("desert_key")
end

function forest_big_key()
  return BIG_KEYS_REMOVED or has("forest_big_key")
end

function forest_small_keys()
  local keys = Tracker:FindObjectForCode("forest_small_keys")

  if SMALL_KEYS_REMOVED then
    return MAX_SMALL_KEYS 
  else
    return keys.CurrentStage
  end
end

function gate_keys()
  return SMALL_KEYS_REMOVED or has("gate_keys")
end

function goron_big_key()
  local key = Tracker:FindObjectForCode("mines_big_key")

  return BIG_KEYS_REMOVED or (key.CurrentStage >= 3)
end

function goron_small_keys()
  local keys = Tracker:FindObjectForCode("mines_small_keys")

  if SMALL_KEYS_REMOVED then
    return MAX_SMALL_KEYS 
  else
    return keys.CurrentStage
  end
end

function grounds_big_key()
  return BIG_KEYS_REMOVED or has("grounds_big_key")
end

function grounds_small_keys()
  local keys = Tracker:FindObjectForCode("grounds_small_keys")

  if SMALL_KEYS_REMOVED then
    return MAX_SMALL_KEYS 
  else
    return keys.CurrentStage
  end
end

function lakebed_big_key()
  return BIG_KEYS_REMOVED or has("lakebed_big_key")
end

function lakebed_small_keys()
  local keys = Tracker:FindObjectForCode("lakebed_small_keys")

  if SMALL_KEYS_REMOVED then
    return MAX_SMALL_KEYS 
  else
    return keys.CurrentStage
  end
end

function palace_big_key()
  return BIG_KEYS_REMOVED or has("palace_big_key")
end

function palace_small_keys()
  local keys = Tracker:FindObjectForCode("palace_small_keys")

  if SMALL_KEYS_REMOVED then
    return MAX_SMALL_KEYS 
  else
    return keys.CurrentStage
  end
end

function ruins_big_key()
  return BIG_KEYS_REMOVED or has("ruins_big_key")
end

function ruins_cheese()
  return SMALL_KEYS_REMOVED or has("cheese")
end

function ruins_pumpkin()
  return SMALL_KEYS_REMOVED or has("pumpkin")
end

function ruins_small_keys()
  local keys = Tracker:FindObjectForCode("ruins_small_keys")

  if SMALL_KEYS_REMOVED then
    return MAX_SMALL_KEYS 
  else
    return keys.CurrentStage
  end
end

function sky_big_key()
  return BIG_KEYS_REMOVED or has("sky_big_key")
end

function sky_small_key()
  return SMALL_KEYS_REMOVED or has("sky_small_key")
end

function time_big_key()
  return BIG_KEYS_REMOVED or has("time_big_key")
end

function time_small_keys()
  local keys = Tracker:FindObjectForCode("time_small_keys")

  if SMALL_KEYS_REMOVED then
    return MAX_SMALL_KEYS 
  else
    return keys.CurrentStage
  end
end