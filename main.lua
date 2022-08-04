require "guac"
require "defs"
local ev = require("ev")
local wsc = require("websocket").client.ev()
local defs = require("defs")

wsc:on_open(function ()
    print('connected to ws');
end)

wsc:connect()