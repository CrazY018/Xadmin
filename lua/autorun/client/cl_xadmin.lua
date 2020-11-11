AddCSLuaFile('lua/autorun/config.lua')
include('config.lua')

---------------------------------------------------------------------------------
------------  By CrazY : https://steamcommunity.com/id/CrazyKille/   ------------
------------  TEAM XEON : https://steamcommunity.com/groups/xeonteam-fr ---------
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
-----------                        Xadmin V2                          -----------
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
-----------                    SIGNALER UN BUG:                       -----------
-----------         https://steamcommunity.com/id/CrazyKille/         -----------
---------------------------------------------------------------------------------



concommand.Add( "xadmin_open",  function(  ply, cmd, args )
	
	function xadminrankautorized(ply)
		local admins = XADMIN_AUTORIZED
	  for index, value in ipairs(admins) do 
			if ply:GetUserGroup() == value then
				return true
			end
		end
		return false
	end

	if interface == true then
		defaultinterface = false
     else 
		defaultinterface = true
	end
	



	if xadminrankautorized(ply) then
	local xadmin = vgui.Create( "DFrame" )
	xadmin:SetSize( 900, 450 )
	xadmin:Center()
	xadmin:SetTitle( "" )
	xadmin:SetDraggable( false )
	xadmin:ShowCloseButton( defaultinterface )
	xadmin:MakePopup()
function xadmin:Paint( w, h )
	draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 150 ) )
end

if interface == true then -- Interfarce améliore O/N
local style_s = vgui.Create( "DFrame", xadmin )
	style_s:SetSize( 900, 25 )
	style_s:SetPos( 510, 310 )
	style_s:SetTitle( "" )
	style_s:SetDraggable( false )
	style_s:ShowCloseButton( false )
	style_s:MakePopup()

function style_s:Paint( w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 49, 136, 247 ) )
 end

 function style_s:Think()
	self:MoveToFront()
end


DermaImageButton = vgui.Create( "DImageButton", style_s )
DermaImageButton:SetPos( 870, 0 )				
DermaImageButton:SetSize( 24, 24 )			
DermaImageButton:SetImage( "lua/materials/xadmin/closee.png" )	-- texture workshop: 'materials/xadmin/closee.png'
DermaImageButton.DoClick = function()
	xadmin:Close()
end


	local serverName = vgui.Create("DLabel", style_s)
	serverName:SetText( GetHostName() )
	serverName:SetFont( "xeoncommunity")
	serverName:SizeToContents()
	serverName:SetPos( 4, 3 )

end





local xadmin_tab = vgui.Create("DListView") 
	xadmin_tab:SetParent(xadmin)
	xadmin_tab:SetPos(0, 20)
	xadmin_tab:SetSize(900, 400)
	xadmin_tab:SetMultiSelect(false)
	xadmin_tab:AddColumn("Name")
	xadmin_tab:AddColumn("Health")
	xadmin_tab:AddColumn("Kill")
	xadmin_tab:AddColumn("Deaths")
	xadmin_tab:AddColumn("SteamID")
	xadmin_tab:AddColumn("Rank")

-------------------------------------------------------
-------------       MODIFICATION ICI      -------------
-------------------------------------------------------



	xadmin_tab.OnRowRightClick = function ( lst, index, pnl )
 	   

      name = pnl:GetColumnText( 1 )

	  local xadmin_button = DermaMenu()
	  local xadmin_button_option = xadmin_button:AddSubMenu( "Ban" ) -- BOUTON BAN 
	  xadmin_button_option:AddOption( freekilltitle, function() RunConsoleCommand( "ulx", "ban", name, freekilltime, freekillreason ) end  ):SetIcon( menuiconban )
	  xadmin_button_option:AddOption( freetazetitle, function() RunConsoleCommand( "ulx", "ban", name, freetazetime, freetazereason ) end ):SetIcon( menuiconban )
	  xadmin_button_option:AddOption( carkilltitle, function() RunConsoleCommand( "ulx", "ban", name, carkilltime, carkillreason ) end ):SetIcon( menuiconban )
	  xadmin_button_option:AddOption( insultetitle, function() RunConsoleCommand( "ulx", "ban", name, insultetime, insultereason ) end ):SetIcon( menuiconban )
	  xadmin_button_option:AddOption( nofearrptitle, function() RunConsoleCommand( "ulx", "ban", name, nofearrptime, nofearrpreason ) end ):SetIcon( menuiconban )
	  xadmin_button_option:AddOption( metagamingtitle, function() RunConsoleCommand( "ulx", "ban", name, metagamingtime, metagamingreason ) end ):SetIcon( menuiconban )
	  xadmin_button_option:AddOption( spamtitle, function() RunConsoleCommand( "ulx", "ban", name, spamtime, spamreason ) end ):SetIcon( menuiconban )
	  xadmin_button_option:AddOption( usebugtitle, function() RunConsoleCommand( "ulx", "ban", name, usebugtime, userbugreason ) end ):SetIcon( menuiconban )
	  xadmin_button_option:AddOption( freedemotetitle, function() RunConsoleCommand( "ulx", "ban", name, freedemotetime, freedemotereason ) end ):SetIcon( menuiconban )
	  xadmin_button_option:AddOption( hacktitle, function() RunConsoleCommand( "ulx", "ban", name, hacktime, hackreason ) end ):SetIcon( menuiconban )
	  xadmin_button_option:AddOption( hrpvocaltitle, function() RunConsoleCommand( "ulx", "ban", name, hrpvocaltime, hrpvocalreason ) end ):SetIcon( menuiconban )
	  xadmin_button_option:AddOption( pubtitle, function() RunConsoleCommand( "ulx", "ban", name, pubtime, pubreason ) end ):SetIcon( menuiconban )
	  xadmin_button_option:AddOption( nlrtitle, function() RunConsoleCommand( "ulx", "ban", name, nlrtime, nlrreason ) end ):SetIcon( menuiconban )
	  xadmin_button_option:AddOption( norptitle, function() RunConsoleCommand( "ulx", "ban", name, norptime, norpreason ) end ):SetIcon( menuiconban )
	  xadmin_button_option:AddOption( trolltitle, function() RunConsoleCommand( "ulx", "ban", name, trolltime, trollreason ) end ):SetIcon( menuiconban )
	  xadmin_button_option:AddOption( streamstalktitle, function() RunConsoleCommand( "ulx", "ban", name, streamstalktime, streamstalkreason ) end ):SetIcon( menuiconban )
	  xadmin_button_option:AddSpacer()
	  xadmin_button_option:AddOption( "Permanent", function() RunConsoleCommand( "ulx", "ban", name, "0", "Vous avez était banni permanant !" ) end ):SetIcon( menuiconban )




	  local xadmin_button_option_kick = xadmin_button:AddSubMenu( "Kick" ) -- BOUTON KICK
	  xadmin_button_option_kick:AddOption( freekillkicktitle, function() RunConsoleCommand( "ulx", "kick", name, freekillkickreason ) end  ):SetIcon( menuiconkick )
	  xadmin_button_option_kick:AddOption( freetazekicktitle, function() RunConsoleCommand( "ulx", "kick", name, freetazekickreason ) end  ):SetIcon( menuiconkick )
	  xadmin_button_option_kick:AddOption( carkillkicktitle, function() RunConsoleCommand( "ulx", "kick", name, carkillkickreason ) end  ):SetIcon( menuiconkick )
	  xadmin_button_option_kick:AddOption( insultekicktitle, function() RunConsoleCommand( "ulx", "kick", name, insultekickreason ) end  ):SetIcon( menuiconkick )
	  xadmin_button_option_kick:AddOption( norpkicktitle, function() RunConsoleCommand( "ulx", "kick", name, norpkickreason ) end  ):SetIcon( menuiconkick )
	  xadmin_button_option_kick:AddOption( nofearrpkicktitle, function() RunConsoleCommand( "ulx", "kick", name, nofearrpkickreason ) end  ):SetIcon( menuiconkick )
	  xadmin_button_option_kick:AddOption( metagamingkicktitle, function() RunConsoleCommand( "ulx", "kick", name, metagamingkickreason ) end  ):SetIcon( menuiconkick )
	  xadmin_button_option_kick:AddOption( spamkicktitle, function() RunConsoleCommand( "ulx", "kick", name, spamkickreason ) end  ):SetIcon( menuiconkick )
	  xadmin_button_option_kick:AddOption( usebugkicktitle, function() RunConsoleCommand( "ulx", "kick", name, usebugkickreason ) end  ):SetIcon( menuiconkick )
	  xadmin_button_option_kick:AddOption( freedemotekicktitle, function() RunConsoleCommand( "ulx", "kick", name, freedemotekickreason ) end  ):SetIcon( menuiconkick )
	  xadmin_button_option_kick:AddOption( hackkicktitle, function() RunConsoleCommand( "ulx", "kick", name, hackkickreason ) end  ):SetIcon( menuiconkick )
	  xadmin_button_option_kick:AddOption( hrpvocalkicktitle, function() RunConsoleCommand( "ulx", "kick", name, hrpvocalkickreason ) end  ):SetIcon( menuiconkick )
	  xadmin_button_option_kick:AddOption( pubkicktitle, function() RunConsoleCommand( "ulx", "kick", name, pubkickreason ) end  ):SetIcon( menuiconkick )
	  xadmin_button_option_kick:AddOption( nlrkicktitle, function() RunConsoleCommand( "ulx", "kick", name, nlrkickreason ) end  ):SetIcon( menuiconkick )
	  xadmin_button_option_kick:AddOption( trollkicktitle, function() RunConsoleCommand( "ulx", "kick", name, trollkickreason ) end  ):SetIcon( menuiconkick )
	  xadmin_button_option_kick:AddOption( streamstalkkicktitle, function() RunConsoleCommand( "ulx", "kick", name, streamstalkkickreason ) end  ):SetIcon( menuiconkick )
	  

	  xadmin_button:AddSpacer()

	  local xadmin_button_warn = xadmin_button:AddSubMenu( "Warn" ) -- BOUTON WARN
	  xadmin_button_warn:AddOption( freekillwarntitle, function() RunConsoleCommand( "awarn_warn", name, freekillwarnreason ) end  ):SetIcon( menuiconwarn )
	  xadmin_button_warn:AddOption( freetazewarntitle, function() RunConsoleCommand( "awarn_warn", name, freetazewarnreason ) end  ):SetIcon( menuiconwarn )
	  xadmin_button_warn:AddOption( carkillwarntitle, function() RunConsoleCommand( "awarn_warn", name, carkillwarnreason ) end  ):SetIcon( menuiconwarn )
	  xadmin_button_warn:AddOption( insultewarntitle, function() RunConsoleCommand( "awarn_warn", name, insultewarnreason ) end  ):SetIcon( menuiconwarn )
	  xadmin_button_warn:AddOption( nofearrpwarntitle, function() RunConsoleCommand( "awarn_warn", name, nofearrpwarnreason ) end  ):SetIcon( menuiconwarn )
	  xadmin_button_warn:AddOption( metagamingwarntitle, function() RunConsoleCommand( "awarn_warn", name, metagamingwarnreason ) end  ):SetIcon( menuiconwarn )
	  xadmin_button_warn:AddOption( spamwarntitle, function() RunConsoleCommand( "awarn_warn", name, spamwarnreason ) end  ):SetIcon( menuiconwarn )
	  xadmin_button_warn:AddOption( usebugwarntitle, function() RunConsoleCommand( "awarn_warn", name, usebugwarnreason ) end  ):SetIcon( menuiconwarn )
	  xadmin_button_warn:AddOption( freedemotewarntitle, function() RunConsoleCommand( "awarn_warn", name, freedemotewarnreason ) end  ):SetIcon( menuiconwarn )
	  xadmin_button_warn:AddOption( hackwarntitle, function() RunConsoleCommand( "awarn_warn", name, hackwarnreason ) end  ):SetIcon( menuiconwarn )
	  xadmin_button_warn:AddOption( hrpvocalwarntitle, function() RunConsoleCommand( "awarn_warn", name, hrpvocalwarnreason ) end  ):SetIcon( menuiconwarn )
	  xadmin_button_warn:AddOption( pubwarntitle, function() RunConsoleCommand( "awarn_warn", name, pubwarnreason ) end  ):SetIcon( menuiconwarn )
	  xadmin_button_warn:AddOption( nlrwarntitle, function() RunConsoleCommand( "awarn_warn", name, nlrwarnreason ) end  ):SetIcon( menuiconwarn )
	  xadmin_button_warn:AddOption( norpwarntitle, function() RunConsoleCommand( "awarn_warn", name, norpwarnreason ) end  ):SetIcon( menuiconwarn )
	  xadmin_button_warn:AddOption( trollwarntitle, function() RunConsoleCommand( "awarn_warn", name, trollwarnreason ) end  ):SetIcon( menuiconwarn )
	  xadmin_button_warn:AddOption( streamstalkwarntitle, function() RunConsoleCommand( "awarn_warn", name, streamstalkwarnreason ) end  ):SetIcon( menuiconwarn )
      


      xadmin_button:Open() 
	  
		
    end

	
	xadmin_tab.Paint = function(i,w,h)
		draw.RoundedBox( 0, 0, 0, w, h, Color( 150, 150, 150, 150 ) )
	end

	for k,v in pairs(player.GetAll()) do
	    xadmin_tab:AddLine(v:Nick(),v:Health(),v:Frags(),v:Deaths(),v:SteamID(),v:GetUserGroup())
	end
	


	local reportbug = vgui.Create( "DButton", xadmin ) 
	reportbug:SetText( "Report Bug" )
	reportbug:SetTextColor( Color( 255, 255, 255, 150 ) )		
	reportbug:SetIcon( "icon16/bug.png" )			
	reportbug:SetPos( 5, 422.5 )					
	reportbug:SetSize( 100, 25 )				
	reportbug.DoClick = function()			
		gui.OpenURL( "https://steamcommunity.com/id/CrazyKille/" )
	end
	function reportbug:Paint( w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 150 ) )
	end

	local xadmin_credit = vgui.Create( "DLabel", xadmin )
	xadmin_credit:SetPos( 375, 425 )
	xadmin_credit:SetText( "Xadmin V2 - By CrazY" )
	xadmin_credit:SetFont( "xeoncommunity" )
	xadmin_credit:SizeToContents()

if interface == false then
	local serverName = vgui.Create("DLabel", xadmin)
	serverName:SetText( GetHostName() )
	serverName:SetFont( "xeoncommunity")
	serverName:SizeToContents()
	serverName:SetPos( 4, 3 )
end



	wikibutton = vgui.Create( "DImageButton", xadmin )
	wikibutton:SetPos( 870, 422.5 )							
    wikibutton:SetImage( "lua/materials/xadmin/wiki.png" )	-- texture workshop: 'materials/xadmin/wiki.png'
    wikibutton:SizeToContents()				
    wikibutton.DoClick = function()
		gui.OpenURL( "https://steamcommunity.com/groups/xeonteam-fr/discussions/0/1640915206477754901/" )
	end
	function wikibutton:Paint( w, h )
		draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 150 ) )
	end
	


	

else 

    if errorchat == true then
	chat.AddText( errorchatcolor, errorchatmsg )
	end

	if errornotif == true then
	notification.AddLegacy( errornotifsmg, NOTIFY_GENERIC, 5 )
	end

	if errorsound == true then
	surface.PlaySound( "buttons/button24.wav" )
	end

	

end 






end ) 

net.Receive( "infoxadmin", function( len, pl )

	local ply = LocalPlayer()
	chat.AddText( Color( 255, 255, 255 ), "Ce serveur utilise ", Color( 255, 255, 0 ), "Xadmin ", Color( 255, 255, 255 ), "créé par ", Color( 100, 255, 100 ), "CrazY", Color( 255,255,255 ), "."  )

end)









	surface.CreateFont( "xeoncommunity", {
		font = "Arial",
		extended = false,
		size = 17,
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


	surface.CreateFont( "xeoncommunitytwo", {
		font = "Arial",
		extended = false,
		size = 16,
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




---                    Par Crazy: http://steamcommunity.com/id/CrazyKille
--                     Team Xeon: https://steamcommunity.com/groups/xeonteam-fr
--                                     © XeonCommunity
