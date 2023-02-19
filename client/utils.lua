Utils = {};

-- 3dText
function Utils:Draw3dText(coords, text)
    SetDrawOrigin(coords)
    
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(text)
    SetTextCentre(1)
    SetTextFont(4)
    SetTextScale(0.35, 0.35)
    EndTextCommandDisplayText(0.0, 0.0)
  
    BeginTextCommandGetWidth("STRING")
    AddTextComponentSubstringPlayerName(text)
    SetTextFont(4)
    SetTextScale(0.35, 0.35)
    local textWidth = EndTextCommandGetWidth(1)
    local width = textWidth + 0.0015
    local characterHeight = GetRenderedCharacterHeight(0.35, 4) * 1.3
    DrawRect(0.0, characterHeight/2, width, characterHeight, 45, 45, 45, 150)
    
    ClearDrawOrigin()
end

exports('Draw3dText', function(coords, text)
    return Utils:Draw3dText(coords, text)
end)

exports('GetUtils', function()
    return Utils
end)
-- 

