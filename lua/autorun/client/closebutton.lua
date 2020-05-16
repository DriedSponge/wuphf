local PANEL = {}
local sCloseButton = Material("awesome/organisations/close-btns.png", "noclamp smoot")

function PANEL:Init()
    self.header = self:Add( "Panel" )
    self.header:Dock( TOP )
    self.header.Paint = function(pnl, w, h)
        draw.RoundedBoxEx(8, 0, 0, w, h, AwesomeOrg.Theme.Header.Background, true, true, false, false)
    end

    self.header.CloseBtn = self.header:Add("DButton")
    self.header.CloseBtn:Dock( RIGHT )
    self.header.CloseBtn.DoClick = function(pnl)
        self:Remove()
    end
    self.header.CloseBtn:SetText("")
    self.header.CloseBtn.margin = 6
    self.header.CloseBtn.Paint = function(pnl, w, h)
        local margin = pnl.margin
        surface.SetDrawColor( AwesomeOrg.Theme.Header.CloseButton )
        surface.SetMaterial( sCloseButton )
        surface.DrawTexturedRect( margin, margin, w - ( margin * 2 ), h - ( margin * 2 ) )
    end

    self.header.Title = self.header:Add("DLabel")
    self.header.Title:Dock( LEFT )
    self.header.Title:SetFont("AWORG::Header")
    self.header.Title:SetTextColor( AwesomeOrg.Theme.Header.Text )
    self.header.Title:SetTextInset(16, 0)
end
function PANEL:SetTitle(Text)
    self.header.Title:SetText(Text)
end

function PANEL:PerformLayout(w, h)
    self.header:SetTall( AwesomeOrg.GUISizes.Navbar.height )
    self.header.CloseBtn:SetWide( self.header:GetTall() )
    self.header.Title:SizeToContents()

end

function PANEL:Paint(w, h)
    local aX, aY = self:LocalToScreen()

    BSHADOWS.BeginShadow()
        draw.RoundedBox(8, aX, aY, w, h, AwesomeOrg.Theme.Background )
    BSHADOWS.EndShadow( 1, 2, 2 ) 

end


vgui.Register("AwesomeOrgFrame", PANEL, "EditablePanel")
