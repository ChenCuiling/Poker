local Poker = class("Poker", cc.load("mvc").ViewBase)

--�˿�����
local plistFile = "GamePlayScene.plist"
local pngFile = "GamePlayScene.png"

local card = {}
local _type = ""
--local VisibleSize = cc.Director:getInstance():getWinSize()

function Poker:onCreate()	
	self.spriteFrame = cc.SpriteFrameCache:getInstance()
	self.spriteFrame:addSpriteFrames(plistFile,pngFile) --����ͼƬ���ڴ�
	self:addCard()
	self:shuffle()
	self:distribute()
end

--��52���˿��ƴ����ά������
--i��1Ϊ���ң�2Ϊ���ң�3Ϊ÷����4Ϊ����
--j���������֣�11ΪJ��12ΪQ��13ΪK
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

--ϴ��
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

--����,������ û�����ŵ��ƣ����ŷ���,һ��ת��,һ�ź���
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


--������ϱȽ�,���αȽ�
function Poker:compare()

end

--�ʼ�ͬ��˳
function Poker:RoyalFlush()

end

--ͬ��˳
function Poker:StraightFlush()

end

--����
function Poker:FourOfAkind()

end

--���ú�(��«)
function Poker:FullHouse()

end

--ͬ��
function Poker:Flush()

end

--˳��
function Poker:Straight()

end

--����
function Poker:ThreeOfAkind()

end

--����
function Poker:TwoPairs()

end

--һ��
function Poker:OnePairs()

end

--����
function Poker:HighCard()

end



return Poker