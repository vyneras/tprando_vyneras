BombBag = CustomItem:extend()

local images = {
  "images/bomb_bag.png",
  "images/giant_bomb_bag.png"
}

local badges = {
  "@disabled",
  "overlay|images/number_1_label.png",
  "overlay|images/number_2_label.png",
  "overlay|images/number_3_max_label.png"
}

function BombBag:init()
  self:createItem("Bomb Bag")
  self.code = "bombs"
  self:setActive(false)
  self:setStage(1)
  self:setBadgeNum(1)
  self.stageCount = 2
  self.badgeCount = 4
  self.imageBase = ImageReference:FromPackRelativePath(images[1])
  self.ItemInstance.Icon = self.imageBase
  self:updateIcon()
end

function BombBag:setActive(active)
  self:setProperty("active", active)
end

function BombBag:getActive()
  return self:getProperty("active")
end

function BombBag:setStage(stage)
  self:setProperty("stage", stage)
end

function BombBag:getStage()
  return self:getProperty("stage")
end

function BombBag:setBadgeNum(badgeNum)
  self:setProperty("badgeNum", badgeNum)
end

function BombBag:getBadgeNum()
  return self:getProperty("badgeNum")
end

function BombBag:updateIcon()
  local img = images[self:getStage()]
  local badegeImg = badges[self:getBadgeNum()]

  self.ItemInstance.Icon = ImageReference:FromPackRelativePath(img, badegeImg)
end

function BombBag:updateActive()
  if self:getBadgeNum() >= 2 then
    self:setActive(true)
  else
    self:setActive(false)
  end
end

function BombBag:onLeftClick()
  self:setBadgeNum(self:getProperty("badgeNum") % self.badgeCount + 1)
end

function BombBag:onRightClick()
  self:setStage(self:getProperty("stage") % self.stageCount + 1)
end

function BombBag:canProvideCode(code)
  return self.code == code
end

function BombBag:providesCode(code)
  if self:getActive() and self:canProvideCode(code) then
    return true
  end

  return false
end

function BombBag:advanceToCode(code)
  if code == nil or self:canProvideCode(code) then
      self:setActive(true)
  end
end

function BombBag:save()
  local saveData = {}
  saveData["active"] = self:getActive()
  saveData["stage"] = self:getStage()
  saveData["badgeNum"] = self:getBadgeNum()
  return saveData
end

function BombBag:load(data)
  if data["active"] ~= nil then
    self:setActive(data["active"])
  end

  if data["stage"] ~= nil then
    self:setStage(data["stage"])
  end

  if data["badgeNum"] ~= nil then
    self:setBadgeNum(data["badgeNum"])
  end

  self:updateIcon()
  self:updateActive()

  return true
end

function BombBag:propertyChanged(key, value)
  if TRACKER_READY then
    if key == "stage" or key == "badgeNum" then
      self:updateIcon()
    end
      
    if key == "badgeNum" then
      self:updateActive()
    end
  end
end