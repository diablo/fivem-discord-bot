local discord_webhook = {
    url = "webhookURL",
    image = "https://cdn.discordapp.com/attachments/794207356388376578/814680516006510623/iconfinder_twitter_circle_294709.png"
}


AddEventHandler('chatMessage', function(source, author, text)
    local embed = {
        {
            ["description"] = string.sub(text,5),
            ["timestamp"] = os.date('!%Y-%m-%dT%H:%M:%S'),
            ["color"] = 44270
            },
        }
	sm = stringsplit(text, " ");
	if sm[1] == "/twt" then
		CancelEvent()
        TriggerClientEvent('chatMessage', -1, "Twitter 🐦" .. author, { 28,183,235,255 }, string.sub(text,5))
		PerformHttpRequest(discord_webhook.url, function(err, text, headers) end, 'POST', json.encode({username = author, avatar_url=discord_webhook.image, embeds = embed}), {['Content-Type'] = 'application/json'}) 
	end
end)

function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end