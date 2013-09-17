local Module = {}


local function parse(cmd)
	local fd = io.popen(cmd)
	local output = fd:read("*all")
	fd:close()

	local status = {}
	status.volume = {}
	local i = 1
	for val in string.gmatch(output, "%[(%d+)%%%]") do
		status.volume[i] = val
		i = i + 1
	end
	status.muted = string.find(output, "[off]", 1, true) ~= nil
	return status
end


function Module.get(channel)
	local cmd = string.format("amixer get %s", channel)

	return parse(cmd)
end


function Module.set(cannel, val)
	local cmd = string.format("amixer set %s %d%%", channel, val)

	return parse(cmd)
end


function Module.inc(channel, val)
	local cmd = string.format("amixer set %s %d%%+", channel, val)

	return parse(cmd)
end


function Module.dec(channel, val)
	local cmd = string.format("amixer set %s %d%%-", channel, val)

	return parse(cmd)
end


function Module.mute(Channel)
	local cmd = string.format("amixer set %s mute", channel)

	return parse(cmd)
end


function Module.unmute(channel)
	local cmd = string.format("amixer set %s unmute", channel)

	return parse(cmd)
end


function Module.toggle(channel)
	local cmd = string.format("amixer set %s toggle", channel)

	return parse(cmd)
end


return Module
