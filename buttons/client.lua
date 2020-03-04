local arataHud = true


function isCursorInPosition(x,y,width,height)
	local sx, sy = GetActiveScreenResolution()
  local cx, cy = GetNuiCursorPosition ( )
  local cx, cy = (cx / sx), (cy / sy)
  
	local width = width / 2
	local height = height / 2
  
  if (cx >= (x - width) and cx <= (x + width)) and (cy >= (y - height) and cy <= (y + height)) then
	  return true
  else
	  return false
  end
end


function showToolTip(text)
	local sx, sy = GetActiveScreenResolution()
	local cx, cy = GetNuiCursorPosition()
	local cx, cy = (cx / sx) + 0.008, (cy / sy) + 0.027

	SetTextScale(0.28, 0.28)
	SetTextFont(0)
	SetTextProportional(1)
	SetTextColour(255, 255, 255, 255)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextEdge(0, 0, 0, 0, 255)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)	
	local stringLenght = string.len(text)
	
	local width = stringLenght * 0.0047
	DrawRect(cx, cy + 0.015, width, 0.03, 0,0,0,100)
	DrawText(cx, cy + 0.003)
end


function drawScreenText(x,y ,width,height,scale, text, r,g,b,a, outline, font, center)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
	SetTextCentre(center)
    if(outline)then
	    SetTextOutline()
	end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		drawScreenText(0.5, 0.976, 0,0, 0.25, "Press ~r~[comma] ~w~for the cursor", 255, 255, 255, 230, 1, 0, 1)
	end
end)


DiscordInvitatieLink = "Discord Link"
IPserver = "I.P Server"


isCursor = false
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		local discordAlpha = 180
		local ipAlpha = 180
		
		if(arataHud)then
			ascundeHudAlpha = 255
		else
			ascundeHudAlpha = 180
		end
		
		if(isCursor)then		
			ShowCursorThisFrame()
			
			DisableControlAction(0,24,true)
			DisableControlAction(0,47,true)
			DisableControlAction(0,58,true)
			DisableControlAction(0,263,true)
			DisableControlAction(0,264,true)
			DisableControlAction(0,257,true)
			DisableControlAction(0,140,true)
			DisableControlAction(0,141,true)
			DisableControlAction(0,142,true)
			DisableControlAction(0,143,true)
			DisableControlAction(0, 1, true)
			DisableControlAction(0, 2, true)
			
			if(arataHud)then
				if(isCursorInPosition(0.867,0.02, 0.02,0.03))then
					SetCursorSprite(5)
					if(arataHud)then
						showToolTip("Ascunde HUD - UL")
					else
						showToolTip("Arata HUD - UL")
					end
					if(IsDisabledControlJustPressed(0, 24))then
						arataHud = not arataHud
					end
				elseif(isCursorInPosition(0.844,0.020,0.017,0.026))then
					SetCursorSprite(5)
					showToolTip(DiscordInvitatieLink)
					discordAlpha = 255
					if(IsDisabledControlJustPressed(0, 24))then
						DiscordInvitatieLink = "Invite Link Copiat!"
						SetClipboard("https://discord.io/inviteLink")
						SetTimeout(1500, function()
							DiscordInvitatieLink = "Discord Server"
						end)
					end
				elseif(isCursorInPosition(0.820,0.020,0.017,0.026))then
					SetCursorSprite(5)
					showToolTip(IPserver)
					ipAlpha = 255
					if(IsDisabledControlJustPressed(0, 24))then
						IPserver = "I.P Server Copiat!"
						SetClipboard("Server I.P Adress")
						SetTimeout(1500, function()
							IPserver = "I.P Server"
						end)
					end
				else
					SetCursorSprite(1)
				end
			else
				if(isCursorInPosition(0.867,0.02,0.02,0.03))then
					SetCursorSprite(5)
					if(arataHud)then
						showToolTip("Ascunde HUD - UL")
					else
						showToolTip("Arata HUD - UL")
					end
					if(IsDisabledControlJustPressed(0, 24))then
						arataHud = not arataHud
					end
				else
					SetCursorSprite(1)
				end
			end
		end
	
		if(arataHud)then
			DrawSprite("hideHudG", "hideHudG",0.867, 0.021, 0.02, 0.03, 0.0, 255, 255, 255, ascundeHudAlpha)
			DrawSprite("discordIcon", "discordIcon", 0.844, 0.021, 0.017, 0.024, 0.0, 255, 255, 255, discordAlpha)
			DrawSprite("ipIcon", "ipIcon", 0.820, 0.02, 0.017, 0.026, 0.0, 255, 255, 255, ipAlpha)
		else
			DrawSprite("hideHud", "hideHud",0.867, 0.02, 0.02, 0.03, 0.0, 255, 255, 255, ascundeHudAlpha)
		end
		
		if(IsControlJustPressed(1, 82))then
			isCursor = not isCursor
		end
	end
end)


function SetClipboard(text)	
	SendNUIMessage({
		text = text
	})
end
