AddCSLuaFile("autorun/sh_shared.lua")
AddCSLuaFile("autorun/client/groupmng.lua")
AddCSLuaFile("autorun/server/sv_wuphf.lua")
surface.CreateFont( "StanDardWuphfText", {
	font = "Roboto", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 30,
	weight = 900,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )


surface.CreateFont( "NORMALWuphfTxt", {
	font = "Arial", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 20,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )


net.Receive("wtoclient", function(ply)
		local frame = vgui.Create( "DFrame" )
		frame:SetSize( 400, 145 )
		frame:TDLib()
		frame:ClearPaint()
		frame:Center()
		frame:SetTitle( "" )
		frame:MakePopup()
		frame:DockPadding( 5, 0,5, 5 )
		frame:FadeIn(0.5)
		frame:ShowCloseButton()
		frame.lblTitle:SetFont("StanDardWuphfText")
		frame.lblTitle:SetTextColor(WuphfFrameTextColor)
		frame:Blur()
		frame:Background(WuphfFraneBGColor)
		frame:Outline(WuphfFrameOutLineColor)
		local wadmttl = vgui.Create( "DLabel", frame )
		wadmttl:Dock( TOP )
		wadmttl:SetContentAlignment( 5  )
		wadmttl:SetTextColor(WuphfFrameTextColor)
		wadmttl:SetFont("StanDardWuphfText")
		wadmttl:SetText( "WUPHF Something" )
		wadmttl:SizeToContentsY( 5 )
		wadmttl:DockPadding( 0, 0, 0, 0 )
				local DL3 = vgui.Create( "DLabel", frame )
				DL3:SetPos( 40, 40 )
				DL3:Dock( TOP )
				DL3:SetTextColor(Color(255, 255, 255))
				DL3:SetFont("NORMALWuphfTxt")
				DL3:SetText( "WUPHF something: " )
				DL3:SetContentAlignment(5)
		local TextEntry = vgui.Create( "DTextEntry", frame ) -- create the form as a child of frame
		TextEntry:SetPos( 25, 50 )
		TextEntry:SetSize( 75, 40 )
		TextEntry:SetTextColor(Color(0, 98, 255))
		TextEntry:SetFont("StanDardWuphfText")
		TextEntry:DockMargin( 0, 5,0, 0 )
		TextEntry:Dock( TOP )
		TextEntry:SetText( "" )
		TextEntry.OnEnter = function( self )
				frame:Close()
				net.Start( "wtoserver" )
				net.WriteString( self:GetValue() )
			net.SendToServer()
		end
		local closebtn= vgui.Create( "DButton", frame)
		closebtn:SetSize( 75, 40 )
		closebtn:TDLib()
		closebtn:ClearPaint()
		closebtn.OnCursorEntered = CloseButtonOnEnter
		closebtn.OnCursorExited = CloseButtonOnExit
		closebtn:Background(WuphfCLOSEbuttBGColor)
		closebtn:SetText("Close")
		closebtn:SetTextColor(WuphfCLOSEbuttTXTColor)
		closebtn:SetFont("StanDardWuphfText")
		closebtn:Dock( TOP )
		closebtn:DockMargin( 0, 5,0, 0 )
		closebtn.DoClick = function(self)
			local prnt = self:GetParent()	
			prnt:Close()
			
		end
		end)
		
		net.Receive("wtoclientply", function(ply)
			local frame = vgui.Create( "DFrame" )
			frame:SetSize( 400, 165 )
			frame:TDLib()
			frame:Center()
			frame:SetTitle( "" )
			frame:MakePopup()
			frame:FadeIn(0.5)
			frame:DockPadding( 5, 0,5, 5 )
			frame.lblTitle:SetFont("StanDardWuphfText")
			frame.lblTitle:SetTextColor(WuphfFrameTextColor)
			frame:ClearPaint()
			frame:ShowCloseButton(false)
			frame:Blur()
			frame:Background(WuphfFraneBGColor)
			frame:Outline(WuphfFrameOutLineColor)
			local wadmttl = vgui.Create( "DLabel", frame )
		wadmttl:Dock( TOP )
		wadmttl:SetContentAlignment( 5  )
		wadmttl:SetTextColor(WuphfFrameTextColor)
		wadmttl:SetFont("StanDardWuphfText")
		wadmttl:SetText( "WUPHF to a cetain player" )
		wadmttl:SizeToContentsY( 5 )
		wadmttl:DockPadding( 0, 0, 0, 0 )
			local DComboBox = vgui.Create( "DComboBox", frame )
					DComboBox:Dock( TOP )
					DComboBox:SetSize( 100, 20 )
					DComboBox:SetValue( "Select Player" )
					for k,v in pairs(player.GetAll()) do
					DComboBox:AddChoice( v:Name() )
					end
					DComboBox.OnSelect = function( self, index, who )

						wadmttl:SetText( "WUPHF to "..who )
							
				end
			local DL3 = vgui.Create( "DLabel", frame )
					DL3:SetPos( 40, 40 )
					DL3:Dock( TOP )
					DL3:SetTextColor(WuphflblTextColor)
					DL3:SetFont("NORMALWuphfTxt")
					DL3:DockMargin( 0, 5,0, 0 )
					DL3:SetText("What do you want to tell the player")
			local TextEntry = vgui.Create( "DTextEntry", frame ) -- create the form as a child of frame
			TextEntry:SetPos( 25, 50 )
			TextEntry:SetSize( 75, 40 )
			TextEntry:SetTextColor(Color(0, 98, 255))
			TextEntry:SetFont("StanDardWuphfText")
			TextEntry:Dock( TOP )
			TextEntry:SetText( "" )
			TextEntry.OnEnter = function( self )
				frame:Close()
				local papawuphf = {
					to = DComboBox:GetSelected(),
					what = TextEntry:GetValue()
				}
				chat.AddText( Color( 0, 230, 176 ),"Your message: ",Color(0, 98, 255 ), papawuphf.what, Color( 0, 230, 176 ), " has been sent to: ", Color(0, 98, 255 ), papawuphf.to)
				net.Start( "wtoserver2" )
				net.WriteTable( papawuphf )
				net.SendToServer() 
				
			end
			local closebtn= vgui.Create( "DButton", frame)
			closebtn:SetSize( 75, 40 )
			closebtn:TDLib()
			closebtn:ClearPaint()
			closebtn.OnCursorEntered = CloseButtonOnEnter
			closebtn.OnCursorExited = CloseButtonOnExit
			closebtn:Background(WuphfCLOSEbuttBGColor)
			closebtn:SetText("Close")
			closebtn:SetTextColor(WuphfCLOSEbuttTXTColor)
			closebtn:SetFont("StanDardWuphfText")
			closebtn:Dock( BOTTOM )
			closebtn:DockMargin( 0, 5,0, 0 )
			closebtn.DoClick = function(self)
				local prnt = self:GetParent()	
				prnt:Close()
			end
			end)

		net.Receive("clientnotify", function()
			local msg = net.ReadString()
			chat.AddText( Color( 0, 230, 176 ),"WUPHF: ",Color(0, 98, 255 ), msg)
			notification.AddLegacy( "WUPHF: "..msg, NOTIFY_GENERIC, 10 )
			notification.AddLegacy( "WUPHF: "..msg, NOTIFY_ERROR, 10 )
			notification.AddLegacy( "WUPHF: "..msg, NOTIFY_UNDO, 10 )
			notification.AddLegacy( "WUPHF: "..msg, NOTIFY_HINT, 10 )
			notification.AddLegacy( "WUPHF: "..msg, NOTIFY_CLEANUP, 10 )
			surface.PlaySound( "common/wuphf.ogg" )
			Derma_Message( "WUPHF: "..msg, "WUPHF!", "GOT IT" )
			surface.SetFont( "StanDardWuphfText" )
		local width, height = surface.GetTextSize( msg )
	
		local NotifyPanel = vgui.Create( "DNotify" )
		NotifyPanel:SetPos( 15, 15 )
		NotifyPanel:SetSize( width+30, 200 )
		NotifyPanel:SetLife( 10 )
	
		local bg = vgui.Create( "DPanel", NotifyPanel )
		bg:Dock( FILL )
		bg:TDLib()
		bg:ClearPaint()
		bg:Background(WuphfFraneBGColor)
		bg:Outline(WuphfFrameOutLineColor)
		local img = vgui.Create( "DImage", bg )
		img:SetPos( 10, 11 )
		img:SetSize( width-10, 100 )
		img:SetImage( "materials/wuphf/wuphf.png" )
		local lbl = vgui.Create( "DLabel", bg )
		lbl:SetPos( 11, 136 )
		lbl:SetSize( width, height+50 )
		lbl:SetText( "WUPHF: "..msg )
		lbl:SetFont( "StanDardWuphfText" )
		lbl:Dock( TOP )
		lbl:DockMargin( 5, 125,0, 0 )
		lbl:SetTextColor( WuphflblTextColor)
		lbl:SetWrap( true )
		NotifyPanel:AddItem( bg )
		 
	end)

	net.Receive("playernotify", function()
		local papawuphf3 = net.ReadTable()
		local msg = papawuphf3.what
		if LocalPlayer():Name() == papawuphf3.to then
			chat.AddText( Color( 0, 230, 176 ),"WUPHF: ",Color(0, 98, 255 ), msg)
		notification.AddLegacy( "WUPHF from: "..msg, NOTIFY_GENERIC, 10 )
		notification.AddLegacy( "WUPHF: "..msg, NOTIFY_ERROR, 10 )
		notification.AddLegacy( "WUPHF: "..msg, NOTIFY_UNDO, 10 )
		notification.AddLegacy( "WUPHF: "..msg, NOTIFY_HINT, 10 )
		notification.AddLegacy( "WUPHF: "..msg, NOTIFY_CLEANUP, 10 )
		surface.PlaySound( "common/wuphf.ogg" )
		Derma_Message( "WUPHF: "..msg, "WUPHF!", "GOT IT" )
		surface.SetFont( "StanDardWuphfText" )
	local width, height = surface.GetTextSize( msg )
	local NotifyPanel = vgui.Create( "DNotify" )
	NotifyPanel:SetPos( 15, 15 )
	NotifyPanel:SetSize( width+30, 200 )
	NotifyPanel:SetLife( 10 )
	local bg = vgui.Create( "DPanel", NotifyPanel )
	bg:Dock( FILL )
	bg:TDLib()
	bg:ClearPaint()
	bg:Background(WuphfFraneBGColor)
	bg:Outline(WuphfFrameOutLineColor)
	local img = vgui.Create( "DImage", bg )
	img:SetPos( 10, 11 )
	img:SetSize( width-10, 100 )
	img:SetImage( "materials/wuphf/wuphf.png" )
	local lbl = vgui.Create( "DLabel", bg )
	lbl:SetPos( 11, 136 )
	lbl:SetSize( width, height+50 )
	lbl:SetText( "WUPHF: "..msg )
	lbl:SetFont( "StanDardWuphfText" )
	lbl:Dock( TOP )
	lbl:DockMargin( 0, 125,0, 0 )
	lbl:SetTextColor(WuphflblTextColor)
	lbl:SetWrap( true )
	NotifyPanel:AddItem( bg )
		end
	
end)	 



--Add usergroup code
net.Receive("wdata", function(ply)
local steamapi = net.ReadString()
local frame = vgui.Create( "DFrame" )
frame:SetSize( 400, 400)
frame:MakePopup()
frame:Center()
frame:TDLib()
frame:ClearPaint()
frame:DockPadding( 5, 0,5, 5 )
--frame:FadeIn(0.5)
frame:SetTitle( "" )
frame:MakePopup()
frame:Blur()
frame.lblTitle:SetFont("StanDardWuphfText")
frame.lblTitle:SetTextColor(WuphfFrameTextColor)
frame:ShowCloseButton(false)
frame:Background(WuphfFraneBGColor)
frame:Outline(WuphfFrameOutLineColor)
local wadmttl = vgui.Create( "DLabel", frame )
wadmttl:Dock( TOP )
wadmttl:SetContentAlignment( 5  )
wadmttl:SetTextColor(WuphfFrameTextColor)
wadmttl:SetFont("StanDardWuphfText")
wadmttl:SetText( "WUPHF Settings" )
wadmttl:SizeToContentsY( 5 )
wadmttl:DockPadding( 0, 0, 0, 0 )
local DL = vgui.Create( "DLabel", frame )
DL:SetPos( 40, 40 )
DL:Dock( TOP )
DL:SetTextColor(WuphflblTextColor)
DL:SetFont("NORMALWuphfTxt")
DL:SetContentAlignment( 5  )
DL:SetText( "WUPHF something here: " )
local TE = vgui.Create( "DTextEntry", frame) -- create the form as a child of frame
TE:SetPos( 30, 150 )
TE:SetSize( 75, 40 )
TE:SetTextColor(Color(0, 98, 255))
TE:SetFont("StanDardWuphfText")
TE:Dock( TOP )
TE:DockPadding( 0, 50,0, 0 )
TE:SetText( "" )
TE.OnEnter = function( self )
		net.Start( "wtoserver" )
		net.WriteString( self:GetValue() )
	net.SendToServer() 
	self:SetText( "" )
end
	
--[[ local DL2 = vgui.Create( "DLabel", frame )
DL2:SetPos( 40, 40 )
DL2:Dock( TOP )
DL2:DockPadding( 0, 75,0, 0 )
DL2:SetContentAlignment( 5  )
DL2:SetTextColor(WuphflblTextColor)
DL2:SetFont("NORMALWuphfTxt")
DL2:SetText( "Add a usergroup to WUPHF:" )
local TE2= vgui.Create( "DTextEntry", frame) -- create the form as a child of frame
TE2:SetPos( 30, 150 )
TE2:SetSize( 75, 40 )
TE2:SetTextColor(Color(0, 98, 255))
TE2:SetFont("StanDardWuphfText")
TE2:Dock( TOP )
TE2:DockPadding( 0, 100,0, 0 )
TE2.OnEnter = function( self )
	net.Start( "wdatawrite" )
	net.WriteString( self:GetValue() )
	net.SendToServer()
	chat.AddText( Color( 0, 230, 176 ),"Users in the ",Color(0, 98, 255 ),self:GetValue(), Color( 0, 230, 176 ), " group can now use WUPHF!")
	TE2:SetText( "" )
end ]]
-- Discord Toggle button
local togdis= vgui.Create( "DButton", frame)
togdis:SetPos( 30, 150 )
togdis:SetSize( 75, 40 )
togdis:TDLib()
togdis:ClearPaint()
togdis:Background(WuphfbuttBGColor)
togdis:SetTextColor(WuphfbuttTXTColor)
if iswuphfdiscordenabled:GetBool() == true then
	togdis:SetText("Disable Discord")
else
	togdis:SetText("Enable Discord")
end
-- What happens when the cusor enters
togdis.OnCursorEntered = function() 
	if iswuphfdiscordenabled:GetBool() == true then
		togdis:SetTextColor(WuphfCLOSEbuttTXTColor)
	else
		togdis:SetTextColor(Color(0, 202, 67))
	end
end 
-- How about exits
togdis.OnCursorExited = function() 
	togdis:SetTextColor(WuphfbuttTXTColor)
end 
togdis:SetFont("StanDardWuphfText")
togdis:Dock( TOP )
togdis:DockMargin( 0, 5,0, 0 )
togdis.DoClick = function( self )
	if iswuphfdiscordenabled:GetBool() == true then
 togdis:SetText("Enable Discord")
 net.Start( "wuphfdistgl" )
 net.WriteBool( false )
 net.SendToServer()
 notification.AddLegacy( "WUPHF: Discord disabled", NOTIFY_GENERIC, 10 )
	else
		togdis:SetText("Disable Discord")
		net.Start( "wuphfdistgl" )
		net.WriteBool( true )
		net.SendToServer()
		notification.AddLegacy( "WUPHF: Discord enabled", NOTIFY_GENERIC, 10 )
	end
end

-- Email Toggle button
--[[ local togemail= vgui.Create( "DButton", frame)
togemail:SetPos( 30, 150 )
togemail:SetSize( 75, 40 )
togemail:TDLib()
togemail:ClearPaint()
togemail:Background(WuphfbuttBGColor)
togemail:SetTextColor(WuphfbuttTXTColor)
if iswuphfemailon:GetBool() == true then
	togemail:SetText("Disable Email")
else
	togemail:SetText("Enable Email")
end
-- What happens when the cusor enters
togemail.OnCursorEntered = function() 
	if iswuphfemailon:GetBool() == true then
		togemail:SetTextColor(WuphfCLOSEbuttTXTColor)
	else
		togemail:SetTextColor(Color(0, 202, 67))
	end
end 
-- How about exits
togemail.OnCursorExited = function() 
	togemail:SetTextColor(WuphfbuttTXTColor)
end 
togemail:SetFont("StanDardWuphfText")
togemail:Dock( TOP )
togemail:DockMargin( 0, 5,0, 0 )
togemail.DoClick = function( self )
	if iswuphfemailon:GetBool() == true then
 togemail:SetText("Enable Email")
 net.Start( "wuphfemailtgl" )
 net.WriteBool( false )
 net.SendToServer()
 notification.AddLegacy( "WUPHF: Emails disabled", NOTIFY_GENERIC, 10 )
	else
		togemail:SetText("Disable Email")
		net.Start( "wuphfemailtgl" )
		net.WriteBool( true )
		net.SendToServer()
		notification.AddLegacy( "WUPHF: Emails enabled", NOTIFY_GENERIC, 10 )
	end
end ]]

wuphfbuttons = {}
wuphfbuttons[1] = {name = "Steam API settings", does =
function (self)
	local apiframe = vgui.Create( "DFrame" )
	apiframe:SetSize( 400, 150)
	apiframe:Center()
	apiframe:TDLib()
	apiframe:FadeIn(0.5)
	apiframe:SetTitle( "" )
	apiframe:DockPadding( 5, 0,5, 5 )
	apiframe:MakePopup()
	apiframe.lblTitle:SetFont("StanDardWuphfText")
	apiframe.lblTitle:SetTextColor(WuphfFrameTextColor)
	apiframe:MakePopup()
	apiframe:ShowCloseButton(false)
	apiframe:ClearPaint()
	apiframe:Blur()
	apiframe:Background(WuphfFraneBGColor)
	apiframe:Outline(WuphfFrameOutLineColor)
	local wadmttl = vgui.Create( "DLabel", apiframe )
	wadmttl:Dock( TOP )
	wadmttl:SetContentAlignment( 5  )
	wadmttl:SetTextColor(WuphfFrameTextColor)
	wadmttl:SetFont("StanDardWuphfText")
	wadmttl:SetText( "SteamAPI - Settings" )
	wadmttl:SizeToContentsY( 5 )
	wadmttl:DockPadding( 0, 0, 0, 0 )
	local api = vgui.Create( "DButton", apiframe )
	api:SetPos( 40, 40 )
	api:Dock( TOP )
	api:DockPadding( 0, 75,0, 0 )
	api:SetTextColor(Color(255, 255, 255))
	api:SetFont("NORMALWuphfTxt")
	api:SetText( "Your steam API key, click here to get one" )
	api:TDLib()
	api:ClearPaint()
	api:Background(WuphfbuttBGColor)
	api:Outline(WuphfbuttOTColor)
	api.OnCursorEntered = ButtonOnHover
	api.OnCursorExited = ButtonOnExit
	api.DoClick = function()
	gui.OpenURL( "https://steamcommunity.com/dev/apikey" )
	end
	local apitxt= vgui.Create( "DTextEntry", apiframe) -- create the form as a child of frame
	apitxt:SetPos( 30, 150 )
	apitxt:SetSize( 75, 40 )
	apitxt:SetText(steamapi)
	apitxt:SetTextColor(Color(0, 98, 255))
	apitxt:SetFont("StanDardWuphfText")
	apitxt:Dock( TOP )
	apitxt:DockMargin( 0, 5,0, 0 )
	apitxt.OnEnter = function( self )
		apiframe:Remove()
		net.Start( "writeapi" )
		net.WriteString( self:GetValue() )
		net.SendToServer()
		chat.AddText( Color( 0, 230, 176 ),"Your steam api key:",Color(0, 98, 255 ),self:GetValue(), Color( 0, 230, 176 ), " has been integrated with wuphf!")
	end
	local closebtn= vgui.Create( "DButton", apiframe)
	closebtn:SetSize( 75, 40 )
	closebtn:TDLib()
	closebtn:ClearPaint()
	closebtn.OnCursorEntered = CloseButtonOnEnter
	closebtn.OnCursorExited = CloseButtonOnExit
	closebtn:Background(WuphfCLOSEbuttBGColor)
	closebtn:SetText("Close")
	closebtn:SetTextColor(WuphfCLOSEbuttTXTColor)
	closebtn:SetFont("StanDardWuphfText")
	closebtn:Dock( TOP )
	closebtn:DockMargin( 0, 5,0, 0 )
	closebtn.DoClick = function(self)
		local prnt = self:GetParent()	
		prnt:Close()
		
	end
	end


}
wuphfbuttons[2] = {name = "Manage Webhooks", does = WUPHFEDITWebhhoks }
--wuphfbuttons[3] = {name = "Manage Emails", does = WUPHFEDITEmails }
--wuphfbuttons[2] = {name = "Manage Webhooks", does = ManageWuphFGroups}
wuphfbuttons[3] = {name = "Additional Info", does = WuphfAdditionalInfo}
wuphfbuttons[4] = {name = "Need Help?", does = WuphfHelp}
local bLerp = 0
for k,v in pairs(wuphfbuttons)
do 
local wuphfbutton= vgui.Create( "DButton", frame) 
wuphfbutton:SetPos( 30, 150 )
wuphfbutton:SetSize( 75, 40 )
wuphfbutton:TDLib()
wuphfbutton:ClearPaint()
wuphfbutton:Background(WuphfbuttBGColor)
wuphfbutton:SetText(v.name)
wuphfbutton.OnCursorEntered = ButtonOnHover
wuphfbutton.OnCursorExited = ButtonOnExit
wuphfbutton:SetTextColor(WuphfbuttTXTColor)
wuphfbutton:SetFont("StanDardWuphfText")
wuphfbutton:Dock( TOP )
wuphfbutton:DockMargin( 0, 5,0, 0 )
wuphfbutton.DoClick = v.does
end	
					
			

	local closebtn= vgui.Create( "DButton", frame)
	closebtn:SetSize( 75, 40 )
	closebtn:TDLib()
	closebtn:ClearPaint()
	closebtn.OnCursorEntered = CloseButtonOnEnter
	closebtn.OnCursorExited = CloseButtonOnExit
	closebtn:Background(WuphfCLOSEbuttBGColor)
	closebtn:SetText("Close")
	closebtn:SetTextColor(WuphfCLOSEbuttTXTColor)
	closebtn:SetFont("StanDardWuphfText")
	closebtn:Dock( TOP )
	closebtn:DockMargin( 0, 5,0, 0 )
	closebtn.DoClick = function(self)
		local prnt = self:GetParent()	
		prnt:Close()
		
	end
	end)


net.Receive("nowuphf", function(ply)
	timer.Simple(  0.1, function() chat.AddText( Color( 255, 0, 0 ),"You are not allowed to WUPHF") end)
end)
net.Receive("nowuphfadm", function(ply)
timer.Simple( 0.1, function() chat.AddText( Color( 255, 0, 0 ),"You are not allowed to mange WUPHF") end)
end)
net.Receive("w403error", function(ply)
if LocalPlayer():GetUserGroup() == "superadmin" then
timer.Simple( 0.1, function() chat.AddText( Color( 255, 0, 0 ),"ERROR: 403. Looks like you have an invalid SteamAPI key. Here are some steps to fix this:\n",Color(0, 98, 255 ), "1. Disable discord in settings\n2.Change the api key to a valid one from steam") end)
end
end)



