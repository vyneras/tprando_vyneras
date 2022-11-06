Setting = CustomItem:extend()

function Setting:init(name, code, image_path)
  self:createItem(name)
  self.code = code
  self.imageBase = ImageReference:FromPackRelativePath(image_path)
  self.ItemInstance.Icon = self.imageBase
  self:setState(false)
end

function Setting:setState(state)
    self:setProperty("state", state)
end

function Setting:getState()
    return self:getProperty("state")
end

function Setting:updateIcon()
  if self:getState() then
    self.ItemInstance.Icon = ImageReference:FromImageReference(self.imageBase, "overlay|images/removed_label.png")
  else
    self.ItemInstance.Icon = ImageReference:FromImageReference(self.imageBase)
  end
end

function Setting:onLeftClick()
  self:setState(not self:getState())
end

function Setting:onRightClick()
  self:setState(not self:getState())
end

function Setting:canProvideCode(code)
  return code == self.code
end

function Setting:propertyChanged(key, value)
  if key == "state" then
      self:updateIcon()
      if TRACKER_READY then
        update_item_dungeon_layouts(self)
      end
  end
end