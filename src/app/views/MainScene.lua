
local MainScene = class("MainScene", cc.load("mvc").ViewBase)

MainScene.RESOURCE_FILENAME = "MainScene.csb"

-- 获取UI控件
MainScene.RESOURCE_BINDING = {
	["btn_enter"]   = {["varname"] = "btn"},
}

function MainScene:onCreate()

	cc.Director:getInstance():setDisplayStats(false)
	
	-- 按钮使用
	self.btn:addClickEventListener(function()
		self:getApp():enterScene("PlayScene","fade",0.6,display.COLOR_BLACK)
		print("进入游戏")
	end)

end

return MainScene
