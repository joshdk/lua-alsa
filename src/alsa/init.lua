local os = os


local Module = {}


local function parse(cmd)
	local fd = io.popen(cmd)
	local output = fd:read("*all")
	fd:close()

	local status = {}
	status.volume = string.match(output, "(%d?%d?%d)%%") or "0"
	status.muted = string.find(output, "[off]", 1, true) ~= nil
	return status
end


function Module.get(channel)
	-- local channel = channel or "Master"
	local cmd = string.format("amixer get %s", channel)

	return parse(cmd)
end


function Module.set(cannel, val)
	-- local channel = channel or "Master"
	local cmd = string.format("amixer set %s %d%%", channel, val)

	return parse(cmd)
end


function Module.inc(channel, val)
	-- local channel = channel or "Master"
	local cmd = string.format("amixer set %s %d%%+", channel, val)

	return parse(cmd)
end


function Module.dec(channel, val)
	-- local channel = channel or "Master"
	local cmd = string.format("amixer set %s %d%%-", channel, val)

	return parse(cmd)
end


function Module.mute(Channel)
	-- local channel = channel or "Master"
	local cmd = string.format("amixer set %s mute", channel)

	return parse(cmd)
end


function Module.unmute(channel)
	-- local channel = channel or "Master"
	local cmd = string.format("amixer set %s unmute", channel)

	return parse(cmd)
end


function Module.toggle(channel)
	-- local channel = channel or "Master"
	local cmd = string.format("amixer set %s toggle", channel)

	return parse(cmd)
end


return Module
