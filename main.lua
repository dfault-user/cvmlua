require "guac"
local defs = require"defs"
require "ev"
local wsc = require("websocket").client.ev()


wsc:on_open(function ()
    print('connected to ws');
end)

print(defs.nodes["vm6"])