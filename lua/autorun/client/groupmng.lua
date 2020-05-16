AddCSLuaFile("autorun/sh_shared.lua")
AddCSLuaFile("autorun/client/cl_wuphf.lua")
AddCSLuaFile("autorun/server/sv_wuphf.lua")

 
  

--[[ ManageWuphFGroups = function (self)
    local f = vgui.Create( "DFrame" )
    f:SetSize( 350, 350 )
    f:Center()
    f:MakePopup()
    f:TDLib()
    f:FadeIn(0.5)
    f:ClearPaint()
    f:Blur()
    f:DockPadding( 5, 0,5, 5 )
    f:ShowCloseButton(false)
    f:Background(WuphfFraneBGColor)
    f:Outline(WuphfFrameOutLineColor)
    f:SetTitle( "" )
    f.lblTitle:SetFont("StanDardWuphfText")
    f.lblTitle:SetTextColor(WuphfFrameTextColor)
    local wadmttl = vgui.Create( "DLabel", f )
    wadmttl:Dock( TOP )
    wadmttl:SetContentAlignment( 5  )
    wadmttl:SetTextColor(WuphfFrameTextColor)
    wadmttl:SetFont("StanDardWuphfText")
    wadmttl:SetText( "WUPHF Groups Manager" )
    wadmttl:SizeToContentsY( 5 )
    wadmttl:DockPadding( 0, 0, 0, 0 )
    local GroupList = vgui.Create( "DListView", f )
    GroupList:Dock( TOP )
    GroupList:SetSize( 250, 225 )	
    GroupList:TDLib()
    GroupList:ClearPaint()
    GroupList:Background(WUPHFLISTBGColor)
    GroupList:SetMultiSelect( false )
    GroupList:AddColumn( "Usergroups that can use WUPHF (Right click for more options)" )
    for k, v in pairs(allowedGroups) do
        if v == true then
    GroupList:AddLine( k )		
                end end
    GroupList.OnRowSelected = function( _, line, me )
    local opt = DermaMenu()
    opt:TDLib()
    opt:ClearPaint()
    opt:Background(WuphfFraneBGColor)
    local btnWithIcon = opt:AddOption( "Delete" )
    btnWithIcon:SetIcon( "icon16/delete.png" )
    btnWithIcon:SetTextColor(WuphfbuttTXTColor)
    opt.OptionSelected = function( option, optionText )
        net.Start( "deldata3" )
        net.WriteString( me:GetValue( 1 ) )
        net.SendToServer()
    GroupList:RemoveLine( line )
    end
    opt:Open(  gui.MouseX(), gui.MouseY(), "", ownerpanel )end
                local DB = vgui.Create( "DButton", f )
    DB:SetText( "Delete all groups" )	
    DB:Dock( TOP )		
    DB:SetTextColor(WuphfbuttTXTColor)
    DB:TDLib()	
    DB.OnCursorEntered = CloseButtonOnEnter
	DB.OnCursorExited = CloseButtonOnExit
    DB:ClearPaint()
    DB:Background(WuphfbuttBGColor)
    DB:Outline(WuphfbuttOTColor)
    DB:SetFont("StanDardWuphfText")		
    DB:SetSize( 250, 40 )			
    DB.DoClick = function()		
        local confirm = vgui.Create( "DFrame" )
        confirm:SetSize( 300, 100 )
        confirm:Center()
        confirm:MakePopup()
        confirm:TDLib()
        confirm:ClearPaint()
        confirm:ShowCloseButton(false)
        confirm:Blur()
        confirm:Background(WuphfFraneBGColor)
        confirm:Outline(WuphfFrameOutLineColor)
        confirm:SetTitle( "Are you sure?" )
        confirm.lblTitle:SetFont("StanDardWuphfText")
        confirm.lblTitle:SetTextColor(Color(255, 0, 0))
                local DB = vgui.Create( "DButton", confirm )
                DB:SetText( "No" )	
                DB:Dock( BOTTOM )		
                DB:SetTextColor(WuphfbuttTXTColor)
                DB:TDLib()	
                DB.OnCursorEntered = CloseButtonOnEnter
                DB.OnCursorExited = CloseButtonOnExit
                DB:ClearPaint()
                DB:Background(WuphfbuttBGColor)
                DB:Outline(WuphfbuttOTColor)
                DB:SetFont("StanDardWuphfText")		
                DB:SetSize( 250, 30 )			
                DB.DoClick = function()				
                    print("Deletion Canceld")
                    confirm:Close()
                        end
                        local DB2 = vgui.Create( "DButton", confirm )
                        DB2:SetText( "Yes" )	
                        DB2:Dock( TOP )		
                        DB2:SetTextColor(WuphfbuttTXTColor)
                        DB2:TDLib()	
                        DB2.OnCursorEntered = ButtonOnHover
                        DB2.OnCursorExited = ButtonOnExit
                        DB2:ClearPaint()
                        DB2:Background(WuphfbuttBGColor)
                        DB2:Outline(WuphfbuttOTColor)
                        DB2:SetFont("StanDardWuphfText")		
                        DB2:SetSize( 250, 30 )			
                        DB2.DoClick = function()				
                        confirm:Close()
                        net.Start( "deldata2" )
                        net.SendToServer()
                        notification.AddLegacy( "Operation complete! All groups are deleted! (Requires server restart to take effect)", NOTIFY_GENERIC, 10 )
                                end
        
                            end
                            local closebtn= vgui.Create( "DButton", f)
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
    
    
            end ]]
       -- MANAGEAPIKEY = 

WuphfAdditionalInfo = function(self)
                    local infoframe = vgui.Create( "DFrame" )
                    infoframe:SetSize( 525, 625 )
                    infoframe:Center()
                    infoframe:TDLib()
                    infoframe:FadeIn(0.5)
                    infoframe:SetTitle( "")
                    infoframe:MakePopup()
                    infoframe:DockPadding( 5, 0,5, 5 )
                    infoframe:ShowCloseButton(false)
                    infoframe.lblTitle:SetFont("StanDardWuphfText")
                    infoframe.lblTitle:SetTextColor(WuphfFrameTextColor)
                    infoframe:ClearPaint()
                    infoframe:Blur()
                    infoframe:Background(WuphfFraneBGColor)
                    infoframe:Outline(WuphfFrameOutLineColor)
                    local wadmttl = vgui.Create( "DLabel", infoframe )
                    wadmttl:Dock( TOP )
                    wadmttl:SetContentAlignment( 5  )
                    wadmttl:SetTextColor(WuphfFrameTextColor)
                    wadmttl:SetFont("StanDardWuphfText")
                    wadmttl:SetText( "Additional Info" )
                    wadmttl:SizeToContentsY( 5 )
                    wadmttl:DockPadding( 0, 0, 0, 0 )
                    local DScrollPanel = vgui.Create( "DScrollPanel", infoframe )
                    DScrollPanel:Dock( FILL )
                    for k, v in pairs(WUPHFAddonInfo) do
                            local lbl = DScrollPanel:Add( "DLabel" )
                            lbl:SetText("")
                            lbl:TDLib()
                            lbl:ClearPaint()
                            lbl:SetSize( 400, 50 )
                            lbl:Dock( TOP )
                            lbl:DockMargin( 0, 20, 0, 0 )
                            lbl:ClearPaint()
                            lbl:DualText(
                                k,
                                "StanDardWuphfText",
                                WuphfFrameTextColor,
                        
                                v,
                                "NORMALWuphfTxt",
                                WuphflblTextColor
                            )
                        end
                        for k, v in pairs(WUPHFLinks) do
                            local link = DScrollPanel:Add( "DButton" ) 
                            link:SetText( k )	
                            link:TDLib()
                            link:ClearPaint()
                            link:Background(WuphfbuttBGColor)
                            link:Outline(WuphfbuttOTColor)
                            link.OnCursorEntered = ButtonOnHover
                            link.OnCursorExited = ButtonOnExit
                            link:Dock( TOP )
                            link:DockMargin( 0, 20, 0, 0 )	
                            link:SetTextColor(WuphfbuttTXTColor)
                            link:SetFont("StanDardWuphfText")
                            link:SetSize( 250, 40 )				
                            link.DoClick = function()	
                                gui.OpenURL( v )
                            end
                        end
                        local closebtn= vgui.Create( "DButton", infoframe)
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
                    end
                

        WuphfHelp = function(self)			
    local helpframe = vgui.Create( "DFrame" )
    helpframe:SetSize( 450, 200 )
    helpframe:Center()
	helpframe:TDLib()
	helpframe:FadeIn(0.5)
    helpframe:SetTitle( "")
    helpframe:MakePopup()
    helpframe.lblTitle:SetFont("StanDardWuphfText")
    helpframe.lblTitle:SetTextColor(WuphfFrameTextColor)
    helpframe:ClearPaint()
    helpframe:DockPadding( 5, 0,5, 5 )
    helpframe:Blur()
    helpframe:ShowCloseButton(false)
    helpframe:Background(WuphfFraneBGColor)
    helpframe:Outline(WuphfFrameOutLineColor)
    local wadmttl = vgui.Create( "DLabel", helpframe)
    wadmttl:Dock( TOP )
    wadmttl:SetContentAlignment( 5  )
    wadmttl:SetTextColor(WuphfFrameTextColor)
    wadmttl:SetFont("StanDardWuphfText")
    wadmttl:SetText( "WUPHF! For GMOD - Help" )
    wadmttl:SizeToContentsY( 5 )
    wadmttl:DockPadding( 0, 0, 0, 0 )
    local DScrollPanel = vgui.Create( "DScrollPanel", helpframe )
    DScrollPanel:Dock( FILL )
		for k, v in pairs(WUPHFHELPLinks) do
			local helplink = DScrollPanel:Add( "DButton" ) 
			helplink:SetText( k )	
			helplink:TDLib()
			helplink:ClearPaint()
			helplink:Background(WuphfbuttBGColor)
			helplink:Outline(WuphfbuttOTColor)
            helplink:Dock( TOP )
            helplink.OnCursorEntered = ButtonOnHover
            helplink.OnCursorExited = ButtonOnExit
			helplink:DockMargin( 0, 10, 0, 0 )	
			helplink:SetTextColor(WuphfbuttTXTColor)
			helplink:SetFont("StanDardWuphfText")
			helplink:SetSize( 250, 40 )				
			helplink.DoClick = function()	
				gui.OpenURL( v )
            end

        end
        local closebtn= vgui.Create( "DButton", helpframe)
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
	end	
   -- net.Receive("sendWHtable", function(ply)
    --WUPHFHOOKtbl = net.ReadTable()
WUPHFEDITWebhhoks = function()
    local f = vgui.Create( "DFrame" )
    f:SetSize( 350, 420 )
    f:Center()
    f:MakePopup()
    f:TDLib()
    f:FadeIn(0.5)
    f:ClearPaint()
    f:Blur()
    f:DockPadding( 5, 0,5, 5 )
    f:ShowCloseButton(false)
    f:Background(WuphfFraneBGColor)
    f:Outline(WuphfFrameOutLineColor)
    f:SetTitle( "" )
    f.lblTitle:SetFont("StanDardWuphfText")
    f.lblTitle:SetTextColor(WuphfFrameTextColor)
    local wadmttl = vgui.Create( "DLabel", f )
    wadmttl:Dock( TOP )
    wadmttl:SetContentAlignment( 5  )
    wadmttl:SetTextColor(WuphfFrameTextColor)
    wadmttl:SetFont("StanDardWuphfText")
    wadmttl:SetText( "WUPHF Webhooks Manager" )
    wadmttl:SizeToContentsY( 5 )
    wadmttl:DockPadding( 0, 0, 0, 0 )
    local webhooklist = vgui.Create( "DListView", f )
    webhooklist:Dock( TOP )
    webhooklist:SetSize( 250, 225 )	
    webhooklist:TDLib()
    webhooklist:ClearPaint()
    webhooklist:Background(WUPHFLISTBGColor)
    webhooklist:SetMultiSelect( false )
    webhooklist:AddColumn( "Current Webhooks" )
    for k, v in pairs(wuphfwbhooks) do
        if v == true then
            webhooklist:AddLine( k )		
                end end
                webhooklist.OnRowSelected = function( _, line, me )
    local opt = DermaMenu()
    local selhook = me:GetValue( 1 )
    local curline = line
    opt:TDLib()
    opt:ClearPaint()
    opt:Background(WuphfFraneBGColor)
    local testhook = opt:AddOption("Test", function(me)
        if iswuphfdiscordenabled:GetBool() == true and  file.Read( "wuphfapikey.txt","DATA" ) ~= "NOAPI" then
        net.Start( "wtestwebhook" )
        net.WriteString(selhook)
        net.SendToServer()
        else 
        if file.Read( "wuphfapikey.txt","DATA" ) ~= "NOAPI" then
            timer.Simple( 0.1, function() chat.AddText( Color( 255, 0, 0 ),"In order for testing to work, you must have discord enabled!") end)
        else
            timer.Simple( 0.1, function() chat.AddText( Color( 255, 0, 0 ),"You need to add your steam API key to WUPHF!") end) 
        end
    end
    end)
    testhook:SetTextColor(WuphfbuttTXTColor)
    testhook:SetIcon("icon16/application_xp_terminal.png")
    local delhook = opt:AddOption("Delete", function(me)
        net.Start( "wdeletewebhook" )
        net.WriteString(selhook)
        net.SendToServer()
        webhooklist:RemoveLine( curline )
    end)
    delhook:SetTextColor(WuphfbuttTXTColor)
    delhook:SetIcon("icon16/delete.png")

    
    opt:Open(  gui.MouseX(), gui.MouseY(), "", ownerpanel )end
    local DL = vgui.Create( "DLabel", f)
DL:SetPos( 40, 40 )
DL:Dock( TOP )
DL:SetTextColor(WuphflblTextColor)
DL:SetFont("NORMALWuphfTxt")
DL:SetContentAlignment( 5  )
DL:DockMargin( 0, 5,0, 0 )
DL:SetText( "Paste new webhook here:" )
local TE = vgui.Create( "DTextEntry", f) -- create the form as a child of frame
TE:SetPos( 30, 150 )
TE:SetSize( 75, 40 )
TE:SetTextColor(Color(0, 98, 255))
TE:SetFont("StanDardWuphfText")
TE:Dock( TOP )
TE:DockMargin( 0, 5,0, 0 )
TE:SetText( "" )
TE.OnEnter = function( self )
    net.Start("waddwebhook")
    net.WriteString(self:GetValue())
    net.SendToServer()
    webhooklist:AddLine( self:GetValue() )
    chat.AddText( Color( 0, 230, 176 ),"Your webhook: ",Color(0, 98, 255 ),self:GetValue(), Color( 0, 230, 176 ), " has been integrated with WUPHF!")
    TE:SetText( "" )

 end
                local DB = vgui.Create( "DButton", f )
    DB:SetText( "Delete all webhooks" )	
    DB:Dock( TOP )		
    DB:SetTextColor(WuphfbuttTXTColor)
    DB:TDLib()	
    DB.OnCursorEntered = CloseButtonOnEnter
	DB.OnCursorExited = CloseButtonOnExit
    DB:ClearPaint()
    DB:Background(WuphfbuttBGColor)
    DB:Outline(WuphfbuttOTColor)
    DB:SetFont("StanDardWuphfText")		
    DB:SetSize( 250, 40 )			
    DB.DoClick = function()		
        local confirm = vgui.Create( "DFrame" )
        confirm:SetSize( 300, 100 )
        confirm:Center()
        confirm:MakePopup()
        confirm:TDLib()
        confirm:ClearPaint()
        confirm:ShowCloseButton(false)
        confirm:Blur()
        confirm:Background(WuphfFraneBGColor)
        confirm:Outline(WuphfFrameOutLineColor)
        confirm:SetTitle( "Are you sure?" )
        confirm.lblTitle:SetFont("StanDardWuphfText")
        confirm.lblTitle:SetTextColor(Color(255, 0, 0))
                local DB = vgui.Create( "DButton", confirm )
                DB:SetText( "No" )	
                DB:Dock( BOTTOM )		
                DB:SetTextColor(WuphfbuttTXTColor)
                DB:TDLib()	
                DB.OnCursorEntered = CloseButtonOnEnter
                DB.OnCursorExited = CloseButtonOnExit
                DB:ClearPaint()
                DB:Background(WuphfbuttBGColor)
                DB:Outline(WuphfbuttOTColor)
                DB:SetFont("StanDardWuphfText")		
                DB:SetSize( 250, 30 )			
                DB.DoClick = function()				
                    print("Deletion Canceld")
                    confirm:Close()
                        end
                        local DB2 = vgui.Create( "DButton", confirm )
                        DB2:SetText( "Yes" )	
                        DB2:Dock( TOP )		
                        DB2:SetTextColor(WuphfbuttTXTColor)
                        DB2:TDLib()	
                        DB2.OnCursorEntered = ButtonOnHover
                        DB2.OnCursorExited = ButtonOnExit
                        DB2:ClearPaint()
                        DB2:Background(WuphfbuttBGColor)
                        DB2:Outline(WuphfbuttOTColor)
                        DB2:SetFont("StanDardWuphfText")		
                        DB2:SetSize( 250, 30 )			
                        DB2.DoClick = function()				
                        confirm:Close()
                        net.Start( "wdelwebhook" )
                        net.SendToServer()
                        notification.AddLegacy( "Operation complete! All webhooks are deleted! (Requires server restart to take effect)", NOTIFY_GENERIC, 10 )
                                end
        
                            end
                            local closebtn= vgui.Create( "DButton", f)
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
                
 --[[            WUPHFEDITEmails = function()
                local f = vgui.Create( "DFrame" )
                f:SetSize( 350, 420 )
                f:Center()
                f:MakePopup()
                f:TDLib()
                f:FadeIn(0.5)
                f:ClearPaint()
                f:Blur()
                f:DockPadding( 5, 0,5, 5 )
                f:ShowCloseButton(false)
                f:Background(WuphfFraneBGColor)
                f:Outline(WuphfFrameOutLineColor)
                f:SetTitle( "" )
                f.lblTitle:SetFont("StanDardWuphfText")
                f.lblTitle:SetTextColor(WuphfFrameTextColor)
                local wadmttl = vgui.Create( "DLabel", f )
                wadmttl:Dock( TOP )
                wadmttl:SetContentAlignment( 5  )
                wadmttl:SetTextColor(WuphfFrameTextColor)
                wadmttl:SetFont("StanDardWuphfText")
                wadmttl:SetText( "WUPHF Email Manager" )
                wadmttl:SizeToContentsY( 5 )
                wadmttl:DockPadding( 0, 0, 0, 0 )
                local wemaillist = vgui.Create( "DListView", f )
                wemaillist:Dock( TOP )
                wemaillist:SetSize( 250, 225 )	
                wemaillist:TDLib()
                wemaillist:ClearPaint()
                wemaillist:Background(WUPHFLISTBGColor)
                wemaillist:SetMultiSelect( false )
                wemaillist:AddColumn( "Current Emails" )
                for k, v in pairs(wuphfemails) do
                    if v == true then
                        wemaillist:AddLine( k )		
                            end end
                            wemaillist.OnRowSelected = function( _, line, me )
                local opt = DermaMenu()
                local selhook = me:GetValue( 1 )
                local curline = line
                opt:TDLib()
                opt:ClearPaint()
                opt:Background(WuphfFraneBGColor)
                local testhook = opt:AddOption("Test", function(me)
                    if iswuphfdiscordenabled:GetBool() == true and  file.Read( "wuphfapikey.txt","DATA" ) ~= "NOAPI" then
                    net.Start( "wtestwebhook" )
                    net.WriteString(selhook)
                    net.SendToServer()
                    else 
                    if file.Read( "wuphfapikey.txt","DATA" ) ~= "NOAPI" then
                        timer.Simple( 0.1, function() chat.AddText( Color( 255, 0, 0 ),"In order for testing to work, you must have discord enabled!") end)
                    else
                        timer.Simple( 0.1, function() chat.AddText( Color( 255, 0, 0 ),"You need to add your steam API key to WUPHF!") end) 
                    end
                end
                end)
                testhook:SetTextColor(WuphfbuttTXTColor)
                testhook:SetIcon("icon16/application_xp_terminal.png")
                local delhook = opt:AddOption("Delete", function(me)
                    net.Start( "wdeletewebhook" )
                    net.WriteString(selhook)
                    net.SendToServer()
                    wemaillist:RemoveLine( curline )
                end)
                delhook:SetTextColor(WuphfbuttTXTColor)
                delhook:SetIcon("icon16/delete.png")
            
                
                opt:Open(  gui.MouseX(), gui.MouseY(), "", ownerpanel )end
                local DL = vgui.Create( "DLabel", f)
            DL:SetPos( 40, 40 )
            DL:Dock( TOP )
            DL:SetTextColor(WuphflblTextColor)
            DL:SetFont("NORMALWuphfTxt")
            DL:SetContentAlignment( 5  )
            DL:DockMargin( 0, 5,0, 0 )
            DL:SetText( "Paste new email here:" )
            local TE = vgui.Create( "DTextEntry", f) -- create the form as a child of frame
            TE:SetPos( 30, 150 )
            TE:SetSize( 75, 40 )
            TE:SetTextColor(Color(0, 98, 255))
            TE:SetFont("StanDardWuphfText")
            TE:Dock( TOP )
            TE:DockMargin( 0, 5,0, 0 )
            TE:SetText( "" )
            TE.OnEnter = function( self )
                net.Start("waddwebhook")
                net.WriteString(self:GetValue())
                net.SendToServer()
                wemaillist:AddLine( self:GetValue() )
                chat.AddText( Color( 0, 230, 176 ),"Your webhook: ",Color(0, 98, 255 ),self:GetValue(), Color( 0, 230, 176 ), " has been integrated with WUPHF!")
                TE:SetText( "" )
            
             end
                            local DB = vgui.Create( "DButton", f )
                DB:SetText( "Delete all emails" )	
                DB:Dock( TOP )		
                DB:SetTextColor(WuphfbuttTXTColor)
                DB:TDLib()	
                DB.OnCursorEntered = CloseButtonOnEnter
                DB.OnCursorExited = CloseButtonOnExit
                DB:ClearPaint()
                DB:Background(WuphfbuttBGColor)
                DB:Outline(WuphfbuttOTColor)
                DB:SetFont("StanDardWuphfText")		
                DB:SetSize( 250, 40 )			
                DB.DoClick = function()		
                    local confirm = vgui.Create( "DFrame" )
                    confirm:SetSize( 300, 100 )
                    confirm:Center()
                    confirm:MakePopup()
                    confirm:TDLib()
                    confirm:ClearPaint()
                    confirm:ShowCloseButton(false)
                    confirm:Blur()
                    confirm:Background(WuphfFraneBGColor)
                    confirm:Outline(WuphfFrameOutLineColor)
                    confirm:SetTitle( "Are you sure?" )
                    confirm.lblTitle:SetFont("StanDardWuphfText")
                    confirm.lblTitle:SetTextColor(Color(255, 0, 0))
                            local DB = vgui.Create( "DButton", confirm )
                            DB:SetText( "No" )	
                            DB:Dock( BOTTOM )		
                            DB:SetTextColor(WuphfbuttTXTColor)
                            DB:TDLib()	
                            DB.OnCursorEntered = CloseButtonOnEnter
                            DB.OnCursorExited = CloseButtonOnExit
                            DB:ClearPaint()
                            DB:Background(WuphfbuttBGColor)
                            DB:Outline(WuphfbuttOTColor)
                            DB:SetFont("StanDardWuphfText")		
                            DB:SetSize( 250, 30 )			
                            DB.DoClick = function()				
                                print("Deletion Canceld")
                                confirm:Close()
                                    end
                                    local DB2 = vgui.Create( "DButton", confirm )
                                    DB2:SetText( "Yes" )	
                                    DB2:Dock( TOP )		
                                    DB2:SetTextColor(WuphfbuttTXTColor)
                                    DB2:TDLib()	
                                    DB2.OnCursorEntered = ButtonOnHover
                                    DB2.OnCursorExited = ButtonOnExit
                                    DB2:ClearPaint()
                                    DB2:Background(WuphfbuttBGColor)
                                    DB2:Outline(WuphfbuttOTColor)
                                    DB2:SetFont("StanDardWuphfText")		
                                    DB2:SetSize( 250, 30 )			
                                    DB2.DoClick = function()				
                                    confirm:Close()
                                    net.Start( "wdelwebhook" )
                                    net.SendToServer()
                                    notification.AddLegacy( "Operation complete! All webhooks are deleted! (Requires server restart to take effect)", NOTIFY_GENERIC, 10 )
                                            end
                    
                                        end
                                        local closebtn= vgui.Create( "DButton", f)
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
                                    
                
                        end  ]]