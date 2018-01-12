surface.CreateFont("MOTDCloseButton", {
	font = "Roboto Cn",
	size = 25,
	weight = 600,
	blursize = 0,
	scanlines = 0,
	antialias = true
})

function ulx.showMotdMenu(steamid)
	local container = vgui.Create("Panel")
	container.startTime = SysTime()
	container:SetPos(0, 0)
	container:SetSize(ScrW(), ScrH())
	container.Paint = function(self, w, h)
		Derma_DrawBackgroundBlur(self, self.startTime)
	end

	local html = vgui.Create("DHTML", container)
	html:OpenURL("http://etherealisles.com/motd/")
	html:SetSize(ScrW() * 0.8, ScrH() * 0.8)
	html:SetPos(ScrW() / 2 - html:GetWide() / 2, ScrH() / 2 - html:GetTall() / 2)
	html:MakePopup()

	html.startTime = SysTime()

	html.Paint = function(self, w, h)
		draw.RoundedBox(0, 0, 0, w, h, Color(255, 255, 255))

		surface.DisableClipping(true)

		-- Draw a shadow (fun)
		for i=1, 3 do
			draw.RoundedBox(3 + i, -i, i - 1, w + i * 2, h + i -1, Color(0, 0, 0, 25))
		end

		surface.DisableClipping(false)
	end

	html:AddFunction("game", "closewindow", function()
		container:Remove()
		hook.Call("MOTDClosed")
	end)

	local closeButton = vgui.Create("DButton", container)
	closeButton:SetFont("MOTDCloseButton")
	closeButton:SetText("CLOSE")
	closeButton:SizeToContents()
	closeButton:SetPos(select(1, html:GetPos()) + html:GetWide() - closeButton:GetWide(), select(2, html:GetPos()) - closeButton:GetTall() - 10)
	closeButton:SetColor(Color(238,110,115))
	closeButton.Paint = function(self, w, h)
	end
	closeButton.UpdateColours = function(skin)
	end

	closeButton.DoClick = function()
		container:Remove()
		hook.Call("MOTDClosed")
	end
end
