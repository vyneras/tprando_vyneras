KeySetting = CustomItem:extend()

function KeySetting:init(name, code, image_path)
  self:createItem(name)
  self.code = code
  self.imageBase = ImageReference:FromPackRelativePath(image_path)
  self.ItemInstance.Icon = self.imageBase
  self:setState(false)
  self:updateIcon()
end

function KeySetting:setState(state)
    self:setProperty("state", state)
end

function KeySetting:getState()
    return self:getProperty("state")
end

function KeySetting:updateIcon()
  if self:getState() then
    self.ItemInstance.Icon = ImageReference:FromImageReference(self.imageBase, "overlay|images/removed_label.png")
  else
    self.ItemInstance.Icon = ImageReference:FromImageReference(self.imageBase)
  end
end

function KeySetting:onLeftClick()
  self:setState(not self:getState())
end

function KeySetting:onRightClick()
  self:setState(not self:getState())
end

function KeySetting:canProvideCode(code)
  return self.code == code
end

function KeySetting:save()
  local saveData = {}
  saveData["state"] = self:getState()
  return saveData
end

function KeySetting:load(data)
  if data["state"] ~= nil then
    self:setState(data["state"])
  end

  self:updateIcon()
  update_item_dungeon_layouts(self)

  return true
end

function KeySetting:propertyChanged(key, value)
  if TRACKER_READY then
    if key == "state" then
      self:updateIcon()
      update_item_dungeon_layouts(self)
    end
  end
end