local function getDiscord(_src)
   for k,v in pairs(GetPlayerIdentifiers(source))do         
       if string.sub(v, 1, string.len("discord:")) == "discord:" then
          return v
       end
   end
end
local function OnPlayerConnecting(name, setKickReason, deferrals)
     deferrals.defer()
     local _src = source
     local discord = getDiscord(_src)
     if discord ~= nil then
          if BlackList.Player[discord] then
               print("Player ^3"..GetPlayerName(_src).."^0 is ^1BlackList^0 ! ")
               deferrals.done("\n\n"..GetPlayerName(_src)..", vous êtes BlackList de ce serveur !\n\n")   
               CancelEvent()
               return
          else
               print("Player ^3"..GetPlayerName(_src).."^0 is not ^2BlackList^0 ! ")
               deferrals.done()
          end
     else
          print("Player "..GetPlayerName(_src).." is not connected to discord from fivem !")
          CancelEvent()
          deferrals.done("\n\nVeuillez accepter FiveM sur discord .\n\n")
     end
end
 
AddEventHandler("playerConnecting", OnPlayerConnecting)