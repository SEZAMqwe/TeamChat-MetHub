-- проверено на сборке MetHub
util.AddNetworkString('team-chat')

hook.Add( "PlayerSay", "ChatTeam", function( ply, text, bTeam)
	-- ply игрок который отправил сообщение
	if ( bTeam == true) then -- bTeam = возвращает false, если сообщение предназначено для всех, и true, если сообщение для команды.
		for k,v in pairs(player.GetAll()) do -- Перебираем всех игроков
			--------------------------------------------------------
			local teamply = team.GetName(ply:Team()) -- Возвращает название команды ply.
            --------------------------------------------------------
			local teamall = team.GetName(v:Team())   -- Возвращает название команды всех игроков.
			--------------------------------------------------------
			local getplayerteamall = string.Explode ( "|" , teamall) -- Разделяет строку там, где она находит заданный разделитель.
			--------------------------------------------------------
			local getplayerteamply = string.Explode ( "|" , teamply) -- Разделяет строку там, где она находит заданный разделитель.
			--------------------------------------------------------
			if ( getplayerteamply[1] == getplayerteamall[1] ) then -- получает 1 элемент таблицы
				net.Start('team-chat')
				net.WriteEntity( ply )
				net.WriteString( text )
                net.Send( v )
			end
		end
	return ""
    end
end)