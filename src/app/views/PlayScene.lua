
local PlayScene = class("PlayScene", cc.load("mvc").ViewBase)

PlayScene.RESOURCE_FILENAME = "PlayScene.csb"

-- 获取UI控件
PlayScene.RESOURCE_BINDING = {
	["btn_return"]   = {["varname"] = "btn_return"},
	["btn_news"] = {["varname"] = "btn_news"},
}

function PlayScene:onCreate()
	-- 按钮使用
	self.btn_return:addClickEventListener(function()
		self:getApp():enterScene("MainScene","fade",0.6,display.COLOR_BLACK)
		print("退出游戏")
	end)
	

	self.btn_news:addClickEventListener(function()
		if self.CardType then
			--self.CardType:removeFromParent()
			self:removeChild(self.CardType)
			print("移除子节点")
		else
			self.CardType = cc.CSLoader:createNode("CardTypeLayer.csb")
			self:addChild(self.CardType)
			print("添加牌型")
		end
	end)

end

return PlayScene
