local WinAction = class("WinAction", cc.load("mvc").ViewBase)

local plistFile = "GamePlayScene.plist"
local pngFile = "GamePlayScene.png"

function WinAction:onCreate()	
	self.spriteFrame = cc.SpriteFrameCache:getInstance()
	self.spriteFrame:addSpriteFrames(plistFile,pngFile) --����ͼƬ���ڴ�
	local spriteTest = self.spriteFrame:getSpriteFrame("WIN0001.png")
	self._win = cc.Sprite:createWithSpriteFrame(spriteTest)
	self._win:setPosition(display.cx,display.cy)
	self:addChild(self._win,0)
	self:WinRun()
	
end

function WinAction:WinRun()
	local animation = cc.Animation:create()
	for i = 1, 9 do
		local frameName = string.format("WIN000%d.png",i)
		local blinkFrame = self.spriteFrame:getSpriteFrame(frameName)
		animation:addSpriteFrame(blinkFrame)
	end
	
	animation:setDelayPerUnit(0.1) --����ÿ֡�Ĳ��ż��
	animation:setRestoreOriginalFrame(true)  --���ò�����ɺ��Ƿ�ع����״̬
	local action = cc.Animate:create(animation)
	self._win:runAction(cc.RepeatForever:create(action))
end

return WinAction