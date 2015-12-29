function ulx.showMotdMenu(steamid)
	local html = vgui.Create("DHTML")
	html:OpenURL("http://104.207.142.196/motd/")
	html:SetSize(ScrW() * 0.8, ScrH() * 0.8)
	html:SetPos(ScrW() / 2 - html:GetWide() / 2, ScrH() / 2 - html:GetTall() / 2)
	html:MakePopup()
	
	html.startTime = SysTime()
	
	html.Paint = function(self, w, h)
		Derma_DrawBackgroundBlur(self, self.startTime)
	
		draw.RoundedBox(0, 0, 0, w, h, Color(255, 255, 255))
		
		-- Draw a shadow (fun)
		surface.DisableClipping(true)
		
		for i=1, 3 do
			draw.RoundedBox(3 + i, -i, i - 1, w + i * 2, h + i -1, Color(0, 0, 0, 25))
		end
		
		surface.DisableClipping(false)
	end
	
	html:AddFunction("game", "closewindow", function()
		html:Remove()
	end)
end