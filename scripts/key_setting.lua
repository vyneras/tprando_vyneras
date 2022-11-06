KeySetting = CustomItem:extend()

function KeySetting:init(name, code, image_path)
  self:createItem(name)
  self.code = code
  self.imageBase = ImageReference:FromPackRelativePath(image_path)
  self.ItemInstance.Icon = self.imageBase
  self:setState(false)
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
  return code == self.code
end

function KeySetting:propertyChanged(key, value)
  if key == "state" then
      self:updateIcon()
      if TRACKER_READY then
        update_item_dungeon_layouts(self)
      end
  end
end