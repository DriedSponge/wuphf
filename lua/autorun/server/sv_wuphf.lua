include("autorun/sh_shared.lua")
local NetWorkChannels = {
		"wtoclient",
		"wtoserver",
		"clientnotify",
		"wdata",
	--	"deldata",
		"deldata2",
		"deldata3",
	--	"wdatawrite",
		"ShowData",
		"addinfo",
		"addinfo2",
		"wtoclientply",
		"toserverply",
		"wtoserver2",
		"playernotify",
		"nowuphf",
		"nowuphfadm",
		"writeapi",
		"w403error",
		"wuphfdistgl",
		"wuphfemailtgl",
		"wuphfwhwrite",
		"wtestwebhook",
		"wdeletewebhook",
		"waddwebhook",
		"wdelwebhook"
}

iswuphfdiscordenabled = CreateConVar( "wuphf_discord", "0", FCVAR_NONE, "Enables/Disabled the wuphf discord module" )

for k,v in pairs(NetWorkChannels) do
	util.AddNetworkString(v)
	
end



	hook.Add( "PlayerSay", "wuphfcmd", function( ply, text, team ) 
		--print( ULib.ucl.query(	ply, "WUPHF wuphf", true))
		if   string.lower( text ) == "!wuphf" and  ULib.ucl.query(	ply, "WUPHF wuphf", true) == true	then
			
            net.Start("wtoclient")
            net.Send( ply )
			else   if   string.lower( text ) == "!wuphf" then  
				           net.Start("nowuphf")
							net.Send( ply )
			end
        end
    end )
    hook.Add( "PlayerSay", "wuphfcmdply", function( ply, text, team ) 

        if   string.lower( text ) == "!wuphfplayer" and  ULib.ucl.query(	ply, "WUPHF wuphf", true)    then
            net.Start("wtoclientply")
            net.Send( ply )
			else   if   string.lower( text ) == "!wuphfplayer" then 
				net.Start("nowuphf")
				net.Send( ply )
			end
        end
    end )

	hook.Add( "Initialize", "wuphfapi", function()
		local defaultkey = "NOAPI" 
		if  sql.TableExists( "wuphfdata" ) == false then
			 sql.Query( "CREATE TABLE wuphfdata(apikey TEXT)" )
			 sql.Query( "INSERT INTO wuphfdata ( apikey ) VALUES( 'NOAPI' )")
end
	  end )

function WuphfUpdateApi() 
 wuphfdatatable = sql.Query( "SELECT apikey FROM 'wuphfdata'")
 wuphfapikey = wuphfdatatable[1].APIKEY
end
    hook.Add( "PlayerSay", "wuphfadm", function( ply, text, team )
		if   string.lower( text ) == "!wuphfadm" and ULib.ucl.query(	ply, "WUPHF admin", true) then
			WuphfUpdateApi()
            net.Start("wdata")
			net.WriteString(wuphfapikey)
            net.Send( ply )
		else   if   string.lower( text ) == "!wuphfadm" then 				          
			 net.Start("nowuphfadm")
			net.Send( ply )
			end
        end
    end )


net.Receive( "wtoserver2", function( len, ply )
	if ULib.ucl.query(	ply, "WUPHF wuphf", true) then
	 local papawuphf2 = net.ReadTable()
	  net.Start("playernotify")
	  net.WriteTable( papawuphf2 )
		 net.Broadcast()
	end
end )


net.Receive( "wuphfdistgl", function( len, ply )
	if ULib.ucl.query(	ply, "WUPHF admin", true) then
		local chng = net.ReadBool()
		iswuphfdiscordenabled:SetBool(chng)
	end
end )

net.Receive( "wuphfemailtgl", function( len, ply )
	if ULib.ucl.query(	ply, "WUPHF admin", true) then
		local chng = net.ReadBool()
		iswuphfemailon:SetBool(chng)
	end
end )
net.Receive( "wtoserver", function( len, ply )
if ULib.ucl.query(	ply, "WUPHF wuphf", true)  then
	 local msg = net.ReadString()
	 wuphfdatatable2 = sql.Query( "SELECT apikey FROM 'wuphfdata'")
	 wuphfapikey2 = wuphfdatatable2[1].APIKEY
	 if iswuphfdiscordenabled:GetBool() == true and wuphfapikey2 ~= "NOAPI" then
	 http.Fetch( "https://api.steampowered.com/ISteamUser/GetPlayerSummaries/v1/?key="..wuphfapikey2.."&steamids="..ply:SteamID64(),
	 function( body, len, headers, code )
		if code == 403 then
			net.Start("w403error")
			net.WriteString(ply:Name())
			net.Broadcast()
		else	
		local data = util.JSONToTable( body )
		for k,v in pairs(wuphfwbhooks) do
			if v == true then
		http.Post("https://driedsponge.net/discordrelay.php", {title = "WUPHF:",aname = ply:Name().." ("..ply:SteamID()..")",aurl = data.response.players.player[1].profileurl,	avatar = data.response.players.player[1].avatar, color = "#00E6B0", url = k, content = "__**"..msg.."**__"})

		end 
	end
end
	end,
	 function( error )
		print(error)
		 -- We failed. =(
	 end 
  )
end

--[[ if iswuphfemailon:GetBool() == true and apikey ~= "NOAPI" then
	http.Fetch( "https://api.steampowered.com/ISteamUser/GetPlayerSummaries/v1/?key="..apikey.."&steamids="..ply:SteamID64(),
	function( body, len, headers, code )
	   if code == 403 then
		   net.Start("w403error")
		   net.WriteString(tostring(code ))
		   net.Broadcast()
	   else	
	   local data2 = util.JSONToTable( body )
	   http.Post("https://driedsponge.net/email.php", {plyid2 = ply:SteamID(),plyid642 = ply:SteamID64(),aname2 = ply:Name(),prourl2 = data2.response.players.player[1].profileurl, realname = data2.response.players.player[1].realname,	avatar2 = data2.response.players.player[1].avatar, color2 = "#00E6B0",content2 = msg})

	   end 
   end,
	function( error )
	   print(error)
	end 
 )
end ]]




	PrintMessage( HUD_PRINTCENTER,"WUPHF: ".. msg ) 
	 PrintMessage( HUD_PRINTCONSOLE,"WUPHF: ".. msg )
	 net.Start("clientnotify")
	 net.WriteString( msg )
	 net.Broadcast()
	end
end )


--[[     hook.Add( "Initialize", "superadmin", function()
      local default = "superadmin" 
	 allowedGroups[default] = true
	 local json = util.TableToJSON(allowedGroups)
	file.Write(WUPHFfileName, json, "DATA")
        
	end ) ]]

--[[ 	hook.Add( "Initialize", "tempemail", function()
		local default = "" 
		wuphfemails[default] = true
	   local json = util.TableToJSON(wuphfemails)
	  file.Write(WUPHFfileName3, json, "DATA")
		  
	  end )
 ]]


	net.Receive( "writeapi", function( len, ply )
		if ULib.ucl.query(	ply, "WUPHF admin", true) then
		local apikey = net.ReadString() 
		sql.Query( "UPDATE wuphfdata SET apikey='"..apikey.."'" )
		WuphfUpdateApi()

		end
	end )

net.Receive( "wdatawrite", function( len, ply )
	if ULib.ucl.query(	ply, "WUPHF admin", true) then
	 local group = net.ReadString() 
	 allowedGroups[group] = true
	 local json = util.TableToJSON(allowedGroups)
	file.Write(WUPHFfileName, json, "DATA")
	end
end )

  
net.Receive( "waddwebhook", function( len, ply )
	if ULib.ucl.query(	ply, "WUPHF admin", true) then
	 local addhook = net.ReadString() 
	 wuphfwbhooks[addhook] = true
	 local json = util.TableToJSON(wuphfwbhooks)
	file.Write(WUPHFfileName2, json, "DATA")
	end
end )





net.Receive("wtestwebhook", function( len, ply )
	if ULib.ucl.query(	ply, "WUPHF admin", true) then
		local testhook = net.ReadString()
		wuphfdatatable3 = sql.Query( "SELECT apikey FROM 'wuphfdata'")
	 	wuphfapikey3 = wuphfdatatable2[1].APIKEY
		http.Fetch( "https://api.steampowered.com/ISteamUser/GetPlayerSummaries/v1/?key="..wuphfapikey3.."&steamids="..ply:SteamID64(),
		function( body, len, headers, code )
		   if code == 403 then
			   net.Start("w403error")
			   net.WriteString(tostring(code ))
			   net.Broadcast()
		   else	
		   local data = util.JSONToTable( body )
		   http.Post("https://driedsponge.net/discordrelay.php", {title = "WUPHF:",aname = ply:Name().." ("..ply:SteamID()..")",aurl = data.response.players.player[1].profileurl,	avatar = data.response.players.player[1].avatar, color = "#00E6B0", url = testhook, content = "__**This is a test for WUPHF discord webhooks**__"})
   
		   end 
	   end,
		function( error )
		   print(error)
			-- We failed. =(
		end 
	 )

end
end)

net.Receive( "deldata2", function( len, ply )
	if ULib.ucl.query(	ply, "WUPHF admin", true) then
	file.Delete( WUPHFfileName )
	end
end )

net.Receive( "wdelwebhook", function( len, ply )
	if ULib.ucl.query(	ply, "WUPHF admin", true) then
	file.Delete( WUPHFfileName2 )
	end
end )
 net.Receive( "deldata3", function( len, ply )
if ULib.ucl.query(	ply, "WUPHF admin", true) then
local num = net.ReadString() 
allowedGroups[num] = false
local json = util.TableToJSON(allowedGroups)
file.Write(WUPHFfileName, json, "DATA")
end

 end )
 net.Receive( "wdeletewebhook", function( len, ply )
	if ULib.ucl.query(	ply, "WUPHF admin", true) then
	local delhook = net.ReadString() 
	wuphfwbhooks[delhook] = false
	local json = util.TableToJSON(wuphfwbhooks)
	file.Write(WUPHFfileName2, json, "DATA")
	end
	
	 end )
 
print("WUPHF loaded")
timer.Create( "wuphfcredit", 600, 0, function() MsgC(Color( 255, 0, 0 ),"This server is using WUPHF For GMOD",Color( 255, 150, 0 ), "\nWorkshop: https://steamcommunity.com/sharedfiles/filedetails/?id=1805078462", Color(240, 255, 0),"\nCreator: DriedSponge (STEAM_1:0:198731264)", Color(0, 255, 24), "\nJoin the discord!: https://discord.com/invite/EEPXhqE", Color(0, 54, 255),"\nReport bugs and make suggestions on gitlab: https://gitlab.com/DriedSponge/wuphf") end)




