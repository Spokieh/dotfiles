return {
	"nvim-telescope/telescope-file-browser.nvim",
	keys = {
		{
			"<leader>sB",
			":Telescope file_browser path=%:p:h hidden=true<cr>",
			desc = "Browse Files",
		},
	},
	config = function()
		require("telescope").setup({
			extensions = {
				file_browser = {
					hidden = true,
				},
			},
		})
		require("telescope").load_extension("file_browser")
	end,
}
