return {
	-- Key Mappings Hint
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			icons = {
				-- set icon mappings to true if you have a Nerd Font
				mappings = vim.g.have_nerd_font,
			},
			win = {
				border = "rounded",
				width = { min = 20, max = 50 },
				height = { min = 4, max = 25 },
				padding = { 0, 0 }, -- extra window padding [top, right, bottom, left],
				-- margin = { 1, 0, 0, 0.6 },
			},
			layout = {
				spacing = 0,
			},
		},
		keys = {},
	},
	-- Status line
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = {
			options = {
				icons_enabled = true,
				-- theme = 'dracula-nvim',
				theme = 'catppuccin',
				component_separators = '┃',
				section_separators = { left = "", right = "" },
				ignore_focus = {},
				globalstatus = true,
			},
			sections = {
				lualine_a = {
					{ "mode", separator = { left = "" }, right_padding = 2 },
				},
				-- lualine_b = { "string.format('R:%3d C:%-2d', vim.fn.line('.'), vim.fn.virtcol('.'))" },
				lualine_b = {
					{
						function()
							local loc = require("lualine.components.location")()
							local sel = require("lualine.components.selectioncount")()
							if sel ~= "" then
								loc = loc .. " (" .. sel .. " sel)"
							end
							return loc
						end,
						separator = { right = "" },
						left_padding = 2,
					},
				},
				lualine_c = { 'filename' },
				lualine_x = {},
				lualine_y = { 'branch', 'diff', 'diagnostics' },
				lualine_z = {
					{ "filesize", separator = { right = "" }, left_padding = 2 },
				},
			},
			extensions = {
				"neo-tree",
			},
		},
	},
	-- Status line
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = {
			options = {
				icons_enabled = true,
				-- theme = 'dracula-nvim',
				theme = 'catppuccin',
				component_separators = '│',
				section_separators = { left = "", right = "" },
				ignore_focus = {},
				globalstatus = true,
			},
			sections = {
				lualine_a = {
					{ "mode", separator = { left = "" }, right_padding = 2 },
				},
				-- lualine_b = { "string.format('R:%3d C:%-2d', vim.fn.line('.'), vim.fn.virtcol('.'))" },
				lualine_b = {
					{
						function()
							local loc = require("lualine.components.location")()
							local sel = require("lualine.components.selectioncount")()
							if sel ~= "" then
								loc = loc .. " (" .. sel .. " sel)"
							end
							return loc
						end,
						separator = { right = "" },
						left_padding = 2,
					},
				},
				lualine_c = { 'filename' },
				lualine_x = {},
				lualine_y = { 'branch', 'diff', 'diagnostics' },
				lualine_z = {
					{ "filesize", separator = { right = "" }, left_padding = 2 },
				},
			},
			extensions = {
				"neo-tree",
			},
		},
	},
	-- Neovim plugin for yazi
	{
		"mikavilpas/yazi.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{
				"<F1>",
				"<cmd>Yazi toggle<CR>",
				desc = "Yazi File Manager",
			},
		},
		opts = {
			-- Open yazi instead of netrw for directories
			open_for_directories = true,
			keymaps = {
			  show_help = '`',
			},
		},
	},
	-- Git integration for buffers
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			signs = {
				-- Some useful symbols: {"▎", "" }
				add          = { text = '+' },
				change       = { text = '░' },
				delete       = { text = '┃' },
				topdelete    = { text = '┃' },
				changedelete = { text = '▒' },
				untracked    = { text = '┆' },
			},
			-- on_attach = function(bufnr)
			-- 	local gs = package.loaded.gitsigns
			-- 	local opts = { buffer = bufnr }
			-- 	vim.keymap.set({ "n", "v" }, "<leader>gs", gs.stage_hunk, opts)
			-- 	vim.keymap.set("n", "<leader>gS", gs.stage_buffer, opts)
			-- 	vim.keymap.set("n", "<leader>gl", gs.undo_stage_hunk, opts)
			--
			-- 	vim.keymap.set({ "n", "v" }, "<leader>gr", gs.reset_hunk, opts)
			-- 	vim.keymap.set("n", "<leader>gR", gs.reset_buffer, opts)
			--
			-- 	vim.keymap.set("n", "<leader>gp", gs.preview_hunk, opts)
			-- 	vim.keymap.set("n", "<leader>gb", function() gs.blame_line { full = true } end, opts)
			--
			-- 	vim.keymap.set("n", "<leader>gd", gs.diffthis, opts)
			-- 	vim.keymap.set("n", "<leader>gD", function() gs.diffthis("~") end, opts)
			--
			-- 	opts = { expr = true, buffer = bufnr }
			-- 	vim.keymap.set("n", "[[", function()
			-- 		if vim.wo.diff then
			-- 			return "[["
			-- 		end
			-- 		vim.schedule(function() gs.prev_hunk() end)
			-- 		return "<Ignore>"
			-- 	end, opts)
			--
			-- 	vim.keymap.set("n", "]]", function()
			-- 		if vim.wo.diff then
			-- 			return "]]"
			-- 		end
			-- 		vim.schedule(function() gs.next_hunk() end)
			-- 		return "<Ignore>"
			-- 	end, opts)
			-- end,
		},
	},
	-- Display indentation guides
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = "VeryLazy",
		opts = {
			indent = {
				char = '┊',
				smart_indent_cap = true,
			},
			whitespace = {
				remove_blankline_trail = true,
			},
			scope = {
				enabled = true,
			},
		},
		config = function()
			local highlight = {
				"RainbowRed",
				"RainbowYellow",
				"RainbowBlue",
				"RainbowOrange",
				"RainbowGreen",
				"RainbowViolet",
				"RainbowCyan",
			}
			local hooks = require "ibl.hooks"
			-- create the highlight groups in the highlight setup hook, so they are reset
			-- every time the colorscheme changes
			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
				vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
				vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
				vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
				vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
				vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
				vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
			end)

			vim.g.rainbow_delimiters = { highlight = highlight }
			require("ibl").setup(opts)

			hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
		end,
	},
}
