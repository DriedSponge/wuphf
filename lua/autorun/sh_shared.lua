--[[ hook.Add( "OnGamemodeLoaded", "wuphfperms", function()
    CAMI.RegisterPrivilege(CAMI_WUPHF)
    MsgC(Color( 18, 255, 0 ),"[WUPHF]",Color(0, 246, 255),"permissions loaded")
    
  end ) ]]
WUPHFAddonInfo = {
    ["Addon Author"] = "DriedSponge (STEAM_1:0:198731264)",
    ["Addon Name"] = "WUPHF! For GMOD",
    ["Workshop URL"] = "https://steamcommunity.com/sharedfiles/filedetails/?id=1805078462",
    ["Addon ID"] = "1805078462",
    ["Threebow's Derma Library"] = "https://github.com/Threebow/tdlib",
    ["Version"] = "2.1"   
    }
    WUPHFLinks = {
        ["DriedSponge's Dev Discord"] = "https://discord.com/invite/EEPXhqE",
        ["Git Lab (For suggestions, bug reporting)"] = "https://gitlab.com/DriedSponge/wuphf"   
        }
        WUPHFHELPLinks = {
            ["Ask a question in the discord"] = "https://discord.com/invite/EEPXhqE",
            ["Report a bug on gitlab"] = "https://gitlab.com/DriedSponge/wuphf"   
            }
WuphfFraneBGColor = Color(0, 0, 0, 150) -- Set Frame BG colo
WuphfFrameOutLineColor = Color(0, 0, 0, 255) --Outline color of frame
WuphfFrameTextColor = Color(255, 255, 255) -- Color of frame title
WuphflblTextColor = Color(255, 255, 255) --Color of labels
WuphfteTextColor = Color(246, 255, 0) -- Color of text entry text
WuphfbuttBGColor = Color(255, 255, 255, 0) --Background color of button
WuphfbuttOTColor = Color(0, 0, 0, 0) -- Outline color of button
WuphfbuttUDColor = Color(255,255,255) -- Color of button under line
WuphfbuttTXTColor = Color(255, 255, 255) -- Color of button text
WuphfCLOSEbuttBGColor = Color(255, 255, 255, 0) -- BG Color of close button
WuphfCLOSEbuttTXTColor = Color(255, 255, 255) --Text Color of close button
WUPHFLISTBGColor = Color(172, 172, 172) --Text Color of close button


iswuphfdiscordenabled = CreateConVar( "wuphf_discord", "0", FCVAR_ARCHIVE, "Enables/Disabled the wuphf discord module" )
-- iswuphfemailon = CreateConVar( "wuphf_email", "0", FCVAR_ARCHIVE, "Enables/Disabled the wuphf discord module" )

ButtonOnHover = function(self)
    	--good green Color(0, 202, 67)
	--bLerp = Lerp(RealFrameTime()*.3,0,255)
    self:SetTextColor(Color(0, 202, 67))
end
ButtonOnExit = function(self)
    --good green Color(0, 202, 67)
--bLerp = Lerp(RealFrameTime()*.3,0,255)
self:SetTextColor(WuphfbuttTXTColor)
end
CloseButtonOnEnter = function(self)
 --good red color Color(214, 0, 0)
--bLerp = Lerp(RealFrameTime()*.3,0,255)
self:SetTextColor(Color(255, 70, 70))

end
CloseButtonOnExit = function(self)
--good red color Color(214, 0, 0)
--bLerp = Lerp(RealFrameTime()*.3,0,255)
	self:SetTextColor(WuphfCLOSEbuttTXTColor)
end
--DO NOT TOUCH 
-- WUPHFfileName = "allowedgroups.txt"
-- allowedGroupsJSON = file.Read(WUPHFfileName, "DATA") or "{}"
-- allowedGroups = util.JSONToTable(allowedGroupsJSON) or {}

WUPHFfileName2 = "wuphfwbhooks.txt"
wuphfwbhooksJSON = file.Read(WUPHFfileName2, "DATA") or "{}"
wuphfwbhooks = util.JSONToTable(wuphfwbhooksJSON) or {}