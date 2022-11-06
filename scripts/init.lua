local variant = Tracker.ActiveVariantUID
local has_map = variant ~= variant:find("items_only")

Tracker:AddItems("items/quest.json")
Tracker:AddItems("items/equipment.json")
Tracker:AddItems("items/items.json")
Tracker:AddItems("items/dungeons.json")
Tracker:AddItems("items/settings.json")

ScriptHost:LoadScript("scripts/global.lua")
ScriptHost:LoadScript("scripts/class.lua")
ScriptHost:LoadScript("scripts/custom_item.lua")
ScriptHost:LoadScript("scripts/key_setting.lua")
ScriptHost:LoadScript("scripts/bomb_bag.lua")
ScriptHost:LoadScript("scripts/logic.lua")

KeySetting("Small Keys Shuffle", "small_keys_setting", "images/small_key_model.png")
KeySetting("Big Keys Shuffle", "big_keys_setting", "images/big_key_model.png")

BombBag()

if has_map then
  Tracker:AddMaps("maps/maps.json")
  Tracker:AddLocations("locations/overworld.json")
  Tracker:AddLocations("locations/forest.json")
  Tracker:AddLocations("locations/mines.json")
  Tracker:AddLocations("locations/lakebed.json")
  Tracker:AddLocations("locations/grounds.json")
  Tracker:AddLocations("locations/ruins.json")
  Tracker:AddLocations("locations/time.json")
  Tracker:AddLocations("locations/sky.json")
  Tracker:AddLocations("locations/palace.json")
  Tracker:AddLocations("locations/castle.json")
end

Tracker:AddLayouts("layouts/item_grids.json")
Tracker:AddLayouts("layouts/layouts.json")
Tracker:AddLayouts("layouts/capture.json")
Tracker:AddLayouts("layouts/tracker.json")
Tracker:AddLayouts("layouts/broadcast.json")

initialize()