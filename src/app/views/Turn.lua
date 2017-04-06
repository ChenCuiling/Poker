local Turn = class("Turn", cc.load("mvc").ViewBase)

--翻牌
function Turn:onCreate()

	-- 卡牌旋转动画  
	-- 需要2张图，一张正面一张背面，否则会看到一张正面旋转了360度  
	  
	local cardFace = display.newSprite("Resourse/card_37.png")
	cardFace:setPosition(display.cx,display.cy)
	cardFace:addTo(self)
	
	local cardBack = display.newSprite("Resourse/card_0.png")
	cardBack:setPosition(display.cx,display.cy)
	cardBack:addTo(self)
	
	-- local cardFace = self.rootLayer:getChildByName('CARD')  
	-- local cardBack = self.rootLayer:getChildByName('CARD_BACK')  
	  
	-- 单面旋转  
	-- cardFace:runAction( cc.OrbitCamera:create(4, 1, 0, 0, 360*4, 0, 0) )  
	-- cardBack:runAction( cc.OrbitCamera:create(4, 1, 0, 0, 360*4, 0, 0) ) 
	  
	-- 第一个参数是旋转的时间
	-- 第二个参数是起始半径
	-- 第三个参数半径差
	-- 第四个参数是起始Z角
	-- 第五个参数是旋转Z角差
	-- 第六个参数是起始X角
	-- 最后一个参数旋转X角差
	  
	
	-- 正反面旋转  
	local aniTime = 0.5  
	---[[  
	self:runAction( cc.Repeat:create( cc.Sequence:create(   
		cc.CallFunc:create(  
			function ( sender )  
				cardFace:setVisible(true)  
				cardBack:setVisible(false)  
				cardFace:runAction( cc.OrbitCamera:create(aniTime/2, 1, 0, 0, 80, 0, 0) )  
			end),  
		cc.DelayTime:create(aniTime/2),  
		cc.CallFunc:create(  
			function ( sender )  
				cardFace:setVisible(false)  
				cardBack:setVisible(true)  
				cardBack:runAction( cc.OrbitCamera:create(aniTime, 1, 0, 80, 180, 0, 0) )  
			end),  
		cc.DelayTime:create(aniTime),  
		cc.CallFunc:create(  
			function ( sender )  
				cardFace:setVisible(true)  
				cardBack:setVisible(false)  
				cardFace:runAction( cc.OrbitCamera:create(aniTime/2, 1, 0, 270, 90, 0, 0) )  
			end),  
		cc.DelayTime:create(aniTime/2)  
		), 5) )  
	--]]  
end

return Turn