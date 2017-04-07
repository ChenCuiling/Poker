local TimeAction = class("TimeAction", cc.load("mvc").ViewBase)

local plistFile = "GamePlayScene.plist"
local pngFile = "GamePlayScene.png"

-- cc.PROGRESS_TIMER_TYPE_BAR 条形 
-- cc.PROGRESS_TIMER_TYPE_RADIAL 圆形 

function TimeAction:onCreate()	
	self.spriteFrame = cc.SpriteFrameCache:getInstance()
	self.spriteFrame:addSpriteFrames(plistFile,pngFile) --加载图片进内存
	self:timeProgress()
end


--时间进度条 圆形
function TimeAction:timeProgress()
	--血条背景  
	-- local emptyBg = self.spriteFrame:getSpriteFrame("button_raise.png")
    -- local bloodEmptyBg = cc.Sprite:createWithSpriteFrame(emptyBg)  
	local bloodEmptyBg = cc.Sprite:create("bfn_raise.png")
    bloodEmptyBg:setAnchorPoint(cc.p(0.5,0.5))  
    local bloodEmptyBgSize = bloodEmptyBg:getContentSize()  
    --bloodEmptyBg:setPosition(cc.p(bloodEmptyBgSize.width/2,bloodEmptyBgSize.height/2))  
	bloodEmptyBg:setPosition(cc.p(display.cx, display.cy))
    self:addChild(bloodEmptyBg)  
  
    --血条   
	-- local bodyBg = self.spriteFrame:getSpriteFrame("image_left_line.png")
    -- local bloodBody = cc.Sprite:createWithSpriteFrame(bodyBg)
	local bloodBody = cc.Sprite:create("bfn_time.png")
	
    --创建进度条  
    local bloodProgress = cc.ProgressTimer:create(bloodBody)  
    bloodProgress:setType(cc.PROGRESS_TIMER_TYPE_RADIAL) --设置为条形
    -- bloodProgress:setMidpoint(cc.p(0,0)) --设置起点为条形左下方  
    -- bloodProgress:setBarChangeRate(cc.p(1,0))  --设置为竖直方向  
    bloodProgress:setPercentage(0) -- 设置初始进度为0  
    --bloodProgress:setPosition(cc.p(--bloodProgress:setPosition(cc.p(bloodEmptyBgSize.width/2,bloodEmptyBgSize.height/2))  
    bloodProgress:setPosition(cc.p(display.cx,display.cy))
	self:addChild(bloodProgress)  
  
    --让进度条一直从0--100重复的act  
    local progressTo = cc.ProgressTo:create(10, 100)  --第一个参数为持续时间，第二个参数为进度
    local clear = cc.CallFunc:create(function ()  
        bloodProgress:setPercentage(0)  
    end)  
    local seq = cc.Sequence:create(progressTo,clear)  
    bloodProgress:runAction(cc.RepeatForever:create(seq))  
end

--弃牌,让牌
function TimeAction:quit()
	
end

--加注,跟注
function TimeAction:addFollow()

end

return TimeAction