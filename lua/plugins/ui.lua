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
				height = { min = 10, max = 25 },
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
			open_for_directories = false,
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
			require("ibl").setup {
				scope = {
					enabled = true,
					highlight = highlight,
				},
				indent = {
					char = '┊',
					smart_indent_cap = true,
				},
				whitespace = {
					remove_blankline_trail = true,
				},
			}

			hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
		end,
	},
	-- Cursor Word Highlight
	{
		"RRethy/vim-illuminate",
		event = { "BufReadPost", "BufNewFile" },
		keys = { "_", "+" },
		opts = {
			providers = { "lsp", "treesitter", "regex" },
			delay = 100,
			filetypes_denylist = {
				"TelescopePrompt",
				"Trouble",
				"neo-tree",
				"neo-tree-popup",
				"DressingInput",
				"spectre_panel",
				"Outline",
				"checkhealth",
			},
			min_count_to_highlight = 2,
		},
		config = function(_, opts)
			-- Set Highlight Groups
			vim.api.nvim_set_hl(0, "IlluminatedWordText", { underline = true })
			vim.api.nvim_set_hl(0, "IlluminatedWordRead", { underline = true })
			vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { underline = true })

			local illuminate = require("illuminate")
			illuminate.configure(opts)

			local function map(buffer)
				vim.keymap.set("n", "+", function() illuminate.goto_next_reference(false) end, { buffer = buffer })
				vim.keymap.set("n", "_", function() illuminate.goto_prev_reference(false) end, { buffer = buffer })
			end

			map(nil)
			vim.api.nvim_create_autocmd("FileType", {
				callback = function() map(vim.api.nvim_get_current_buf()) end,
			})
		end,
	},
	-- Scroll Bar
	{
		"dstein64/nvim-scrollview",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			excluded_filetypes = {
				'neo-tree',
			},
			current_only = true,
			base = 'right',
			column = 1,
			winblend = 50,
			winblend_gui = 50,
			signs_on_startup = {},
			diagnostics_severities = {vim.diagnostic.severity.ERROR},
		},
	},
	-- Icons
	{
		"echasnovski/mini.icons",
		lazy = true,
		config = true,
	},
	-- Completely replaces the UI for messages, cmdline and the popupmenu
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			{ "MunifTanjim/nui.nvim", lazy = true },
			{ "rcarriga/nvim-notify", lazy = true, opts = { background_colour = "#000000" } },
		},
		opts = {
			cmdline = {
				format = {
					cmdline = { icon = ">" },
				},
			},
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				inc_rename = true,
				lsp_doc_border = true,
			},
			views = {
				mini = {
					win_options = { winblend = 0 },
				},
			},
			routes = {
				{
					filter = {
						event = "notify",
						any = {
							-- Neo-tree
							{ find = "Toggling hidden files: true" },
							{ find = "Toggling hidden files: false" },
							{ find = "Operation canceled" },

							-- Telescope
							{ find = "Nothing currently selected" },
						},
					},
					opts = { skip = true },
				},
				{
					filter = {
						event = "msg_show",
						kind = { "echo" },
					},
					opts = { skip = true },
				},
				{
					filter = {
						event = "msg_show",
						kind = "",
						any = {
							-- Save
							{ find = " bytes written" },

							-- Redo/Undo
							{ find = " changes; before #" },
							{ find = " changes; after #" },
							{ find = "1 change; before #" },
							{ find = "1 change; after #" },

							-- Yank
							{ find = " lines yanked" },

							-- Move lines
							{ find = " lines moved" },
							{ find = " lines indented" },

							-- Bulk edit
							{ find = " fewer lines" },
							{ find = " more lines" },
							{ find = "1 more line" },
							{ find = "1 line less" },

							-- General messages
							{ find = "Already at newest change" },
							{ find = "Already at oldest change" },
							{ find = "E21: Cannot make changes, 'modifiable' is off" },
						},
					},
					opts = { skip = true },
				},
				{
					filter = {
						event = "msg_show",
						kind = "emsg",
						any = {
							-- TODO: A bug workaround of Lspsaga's finder
							-- { find = "E134: Cannot move a range of lines into itself" },
						},
					},
					opts = { skip = true },
				},
				{
					filter = {
						event = "lsp",
						any = {
							{ find = "formatting" },
							{ find = "Diagnosing" },
							{ find = "Diagnostics" },
							{ find = "diagnostics" },
							{ find = "code_action" },
							{ find = "cargo check" },
							{ find = "Processing full semantic tokens" },
						},
					},
					opts = { skip = true },
				},
			},
		},
	},
	-- Toggle Terminal
	{
		"akinsho/toggleterm.nvim",
		event = "VeryLazy",
		opts = {
			open_mapping = '<F2>',
			direction = 'float',
			shade_terminals = true,
		},
	},
}
