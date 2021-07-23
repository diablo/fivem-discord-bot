local discord_webhook = {
    url = "webhookURL",
    image = "https://cdn.discordapp.com/attachments/716946859918098435/814707990120366091/58430e1ea6515b1e0ad75b56.png"
}


AddEventHandler('chatMessage', function(source, author, text)
    local author = "Dark Web 💀"
    local embed = {
        {
            ["description"] = string.sub(text,6),
            ["timestamp"] = os.date('!%Y-%m-%dT%H:%M:%S')
            },
        }
	sm = stringsplit(text, " ");
	if sm[1] == "/anon" then
		CancelEvent()
        TriggerClientEvent('chatMessage', -1, author, { 00, 000, 000 }, string.sub(text,6))
		PerformHttpRequest(discord_webhook.url, function(err, text, headers) end, 'POST', json.encode({ username = author, avatar_url=discord_webhook.image, embeds = embed }), {['Content-Type'] = 'application/json'}) 
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
