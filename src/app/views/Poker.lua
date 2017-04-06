local Poker = class("Poker", cc.load("mvc").ViewBase)

--扑克牌类
local plistFile = "GamePlayScene.plist"
local pngFile = "GamePlayScene.png"

local card = {}
local _type = ""
--local VisibleSize = cc.Director:getInstance():getWinSize()

function Poker:onCreate()	
	self.spriteFrame = cc.SpriteFrameCache:getInstance()
	self.spriteFrame:addSpriteFrames(plistFile,pngFile) --加载图片进内存
	self:addCard()
	self:shuffle()
	self:distribute()
end

--将52张扑克牌存进二维数组里
--i：1为黑桃，2为红桃，3为梅花，4为方块
--j：牌面数字，11为J，12为Q，13为K
function Poker:addCard()
	for i = 1, 4 do
		card[i] = {}
		local y = 0
		if i == 1 then
			_type = "blackspades"
		elseif i==2 then
			_type = "redhearts"
		elseif i==3 then
			_type = "blackclubs"
		else
			_type = "reddiamonds"
		end
			
		for j = 1, 13 do
			local pic = string.format("%s%d.png", _type, j - 1)
			local SpFrame = self.spriteFrame:getSpriteFrame(pic)
			self._frame = cc.Sprite:createWithSpriteFrame(SpFrame)
			--self._frame:setPosition( i*100 , display.cy + 100 - y )
			self._frame:addTo(self)
			card[i][j] = self._frame
			print(i..","..j)
			print(pic)
			y = y + 30
		end
	end
end

--洗牌
function Poker:shuffle()
	self.clone_card = clone(card)
	for i = 4, 1, -1 do
		for j = 13, 1, -1 do
			local index_i = math.random(1,4)
			local index_j = math.random(1,13)
			local tempNum = self.clone_card[i][j]
			self.clone_card[i][j] = self.clone_card[index_i][index_j]
			self.clone_card[index_i][index_j]= tempNum
			print(index_i..","..index_j)
		end
	end
end

--发牌,五个玩家 没人两张底牌，三张翻牌,一张转牌,一张河牌
function Poker:distribute()
	for i = 1, 5 do
		local common = self.clone_card[1][i]
		common:setPosition( i*100 , display.cy + 100 )
	end
	for j = 1, 10 do
		local buttom = self.clone_card[2][j]
		if j%2 ~= 0 then
			buttom:setPosition( j*100 , display.cy - 100 )
		else
			buttom:setPosition( j*100-50, display.cy - 100 )
		end
	end
end


--牌型组合比较,三次比较
function Poker:compare()

end

--皇家同花顺
function Poker:RoyalFlush()

end

--同花顺
function Poker:StraightFlush()

end

--四条
function Poker:FourOfAkind()

end

--满堂红(葫芦)
function Poker:FullHouse()

end

--同花
function Poker:Flush()

end

--顺子
function Poker:Straight()

end

--三条
function Poker:ThreeOfAkind()

end

--两对
function Poker:TwoPairs()

end

--一对
function Poker:OnePairs()

end

--高牌
function Poker:HighCard()

end



return Poker