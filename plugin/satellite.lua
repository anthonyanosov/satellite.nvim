local ok, satellite = pcall(require, "satellite")
if not ok then
	return
end

vim.api.nvim_create_user_command("Satellite", function()
	satellite.show_complexity()
end, {
	desc = "Show Go function complexity virtual text",
})

vim.api.nvim_create_user_command("SatelliteClear", function()
	satellite.clear()
end, {
	desc = "Clear Satellite virtual text",
})

local group = vim.api.nvim_create_augroup("SatelliteAuto", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
	group = group,
	pattern = "*.go",
	desc = "Auto-refresh Go complexity hints",
	callback = function()
		satellite.show_complexity()
	end,
})
