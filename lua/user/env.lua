local M = {}
local handle = io.popen("powershell.exe -command \"$Env:UserName\"")
local result = handle:read("*a")
handle:close()
M.user = result
return M
