local TimeAction = class("TimeAction", cc.load("mvc").ViewBase)

local plistFile = "GamePlayScene.plist"
local pngFile = "GamePlayScene.png"

-- cc.PROGRESS_TIMER_TYPE_BAR ���� 
-- cc.PROGRESS_TIMER_TYPE_RADIAL Բ�� 

function TimeAction:onCreate()	
	self.spriteFrame = cc.SpriteFrameCache:getInstance()
	self.spriteFrame:addSpriteFrames(plistFile,pngFile) --����ͼƬ���ڴ�
	self:timeProgress()
end


--ʱ������� Բ��
function TimeAction:timeProgress()
	--Ѫ������  
	-- local emptyBg = self.spriteFrame:getSpriteFrame("button_raise.png")
    -- local bloodEmptyBg = cc.Sprite:createWithSpriteFrame(emptyBg)  
	local bloodEmptyBg = cc.Sprite:create("bfn_raise.png")
    bloodEmptyBg:setAnchorPoint(cc.p(0.5,0.5))  
    local bloodEmptyBgSize = bloodEmptyBg:getContentSize()  
    --bloodEmptyBg:setPosition(cc.p(bloodEmptyBgSize.width/2,bloodEmptyBgSize.height/2))  
	bloodEmptyBg:setPosition(cc.p(display.cx, display.cy))
    self:addChild(bloodEmptyBg)  
  
    --Ѫ��   
	-- local bodyBg = self.spriteFrame:getSpriteFrame("image_left_line.png")
    -- local bloodBody = cc.Sprite:createWithSpriteFrame(bodyBg)
	local bloodBody = cc.Sprite:create("bfn_time.png")
	
    --����������  
    local bloodProgress = cc.ProgressTimer:create(bloodBody)  
    bloodProgress:setType(cc.PROGRESS_TIMER_TYPE_RADIAL) --����Ϊ����
    -- bloodProgress:setMidpoint(cc.p(0,0)) --�������Ϊ�������·�  
    -- bloodProgress:setBarChangeRate(cc.p(1,0))  --����Ϊ��ֱ����  
    bloodProgress:setPercentage(0) -- ���ó�ʼ����Ϊ0  
    --bloodProgress:setPosition(cc.p(--bloodProgress:setPosition(cc.p(bloodEmptyBgSize.width/2,bloodEmptyBgSize.height/2))  
    bloodProgress:setPosition(cc.p(display.cx,display.cy))
	self:addChild(bloodProgress)  
  
    --�ý�����һֱ��0--100�ظ���act  
    local progressTo = cc.ProgressTo:create(10, 100)  --��һ������Ϊ����ʱ�䣬�ڶ�������Ϊ����
    local clear = cc.CallFunc:create(function ()  
        bloodProgress:setPercentage(0)  
    end)  
    local seq = cc.Sequence:create(progressTo,clear)  
    bloodProgress:runAction(cc.RepeatForever:create(seq))  
end

--����,����
function TimeAction:quit()
	
end

--��ע,��ע
function TimeAction:addFollow()

end

return TimeAction