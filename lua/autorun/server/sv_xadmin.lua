---------------------------------------------------------------------------------
------------  By CrazY : https://steamcommunity.com/id/CrazyKille/   ------------
------------  TEAM XEON : https://steamcommunity.com/groups/xeonteam-fr ---------
---------------------------------------------------------------------------------

util.AddNetworkString("infoxadmin")

hook.Add( "PlayerSay", "CommandXadmin", function( ply, text, team )
   if ( ply:IsAdmin() ) then
     if( text == "!xadmin" ) then
      ply:ConCommand( "xadmin_open" )


	 end
 end

end )

function infoxadmin( ply )
  net.Start("infoxadmin")
  net.Send(ply)
end
hook.Add( "PlayerInitialSpawn", "XMotdInitialSpawn", infoxadmin )











