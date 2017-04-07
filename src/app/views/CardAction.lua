local CardAction = class("CardAction", cc.load("mvc").ViewBase)

local plistFile = "GamePlayScene.plist"
local pngFile = "GamePlayScene.png"

function CardAction:onCreate()	
	self.spriteFrame = cc.SpriteFrameCache:getInstance()
	self.spriteFrame:addSpriteFrames(plistFile,pngFile) --加载图片进内存
	self:issue()
	self:stack()
end

--发牌的动作
function CardAction:issue()
	local j = 200
	local allCard = self.spriteFrame:getSpriteFrame("image_desk_part1.png")
	self._allCard = cc.Sprite:createWithSpriteFrame(allCard)
	self._allCard:setPosition(display.cx, display.cy + 200)
	self._allCard:addTo(self)
	
	for i = 1, 5 do
		local Time = 1
		local card_bg = self.spriteFrame:getSpriteFrame("image_hand_poker.png")
		self._cardBg = cc.Sprite:createWithSpriteFrame(card_bg)
		self._cardBg:setPosition( display.cx, display.cy + 200)
		self._cardBg:setScale(0)
		local actionMove = cc.MoveTo:create(Time,cc.p(j,display.cy - 100))
		local actionScale = cc.ScaleTo:create(Time, 1)
		local spawn = cc.Spawn:create(actionMove,actionScale)
		self._cardBg:addTo(self)
		self._cardBg:runAction(spawn)
		j = j + 150
	end
end


--注码：黄色5,绿色100,红色500,蓝色1000
function CardAction:stack()
	self.money = {}
	local j = 0
	for i = 1, 4 do
		local frameName = string.format("counters000%d.png", i + 5)
		local spFrame = self.spriteFrame:getSpriteFrame(frameName)
		local stackFrame = cc.Sprite:createWithSpriteFrame(spFrame)
		--stackFrame:setPosition(display.cx + j, display.cy)
		--stackFrame:addTo(self) 
		self.money[i] = stackFrame
		j = j + 100
	end
end



return CardAction