TRACKER_READY = false
SMALL_KEYS_REMOVED = false
BIG_KEYS_REMOVED = false
MAX_SMALL_KEYS = 0xFF
MAX_BUGS = 24
NULL = 0

function initialize()
  update_item_dungeon_layouts()
end

function tracker_on_begin_loading_save_file()
  TRACKER_READY = false
end

function tracker_on_finish_loading_save_file()
  update_item_dungeon_layouts()
  TRACKER_READY = true
end

function tracker_on_pack_ready()
  TRACKER_READY = true
end

function update_item_dungeon_layouts(setting)
  if setting then
    local item_enum = Layout:FindLayout("item_grid_container").Root.Children:GetEnumerator()
    local dungeon_enum = Layout:FindLayout("dungeon_grid_container").Root.Children:GetEnumerator()

    item_enum:MoveNext()
    dungeon_enum:MoveNext()

    if setting.code == "small_keys_setting" then
      SMALL_KEYS_REMOVED = setting:getState()
    elseif setting.code == "big_keys_setting" then
      BIG_KEYS_REMOVED = setting:getState()
    end

    if (not SMALL_KEYS_REMOVED) and (not BIG_KEYS_REMOVED) then
      item_enum.Current.Layout = Layout:FindLayout("item_grid")
      dungeon_enum.Current.Layout = Layout:FindLayout("dungeon_grid")
    elseif SMALL_KEYS_REMOVED and (not BIG_KEYS_REMOVED) then
      item_enum.Current.Layout = Layout:FindLayout("item_grid_sk_off")
      dungeon_enum.Current.Layout = Layout:FindLayout("dungeon_grid_sk_off")
    elseif (not SMALL_KEYS_REMOVED) and BIG_KEYS_REMOVED then
      item_enum.Current.Layout = Layout:FindLayout("item_grid")
      dungeon_enum.Current.Layout = Layout:FindLayout("dungeon_grid_bk_off")
    else
      item_enum.Current.Layout = Layout:FindLayout("item_grid_sk_off")
      dungeon_enum.Current.Layout = Layout:FindLayout("dungeon_grid_keys_off")
    end
  end
end
