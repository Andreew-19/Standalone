Citizen.CreateThread(function()
    while true do Wait(1)
        NiPsEeNvaletulMeu = GetPlayerPed(-1)
        viata = (GetEntityHealth(NiPsEeNvaletulMeu)-100)
	if viata >= 35 then 
    	text(0.035, 0.96, 0.35, 4, "~g~VIATA: ~w~".. viata .." ~g~HP", 255, 255, 255, true)
	else
    	text(0.035, 0.96, 0.35, 4, "~r~VIATA: ~w~".. viata .." ~r~HP", 255, 255, 255, true)
        end

    armura = (GetPedArmour(NiPsEeNvaletulMeu))

    if armura > 1 then
        text(0.110, 0.96, 0.35, 4, "~b~ARMURA: ~w~".. armura .." ~b~%", 255, 255, 255, true)
        end
    end
end)

function text(x, y, scale, font, text, r, g, b, outline)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r,g,b, 255)
    SetTextDropShadow(0,0,0,0,255)
    SetTextEdge(2, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x , y)
end
