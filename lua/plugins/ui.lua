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
				-- Some useful symbols: {"▎", "", "┃" }
				add          = { text = '▓' },
				change       = { text = '░' },
				delete       = { text = '▒' },
				topdelete    = { text = '▒' },
				changedelete = { text = '░' },
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
			winblend = 0,
			winblend_gui = 0,
			signs_on_startup = { "all" },
			diagnostics_severities = {vim.diagnostic.severity.ERROR},
		},
	},
	-- Improve the default `vim.ui` interfaces
	{
		"stevearc/dressing.nvim",
		lazy = true,
		opts = {
			input = {
				insert_only = false,
				win_options = { winblend = 0 },
				mappings = {
					n = {
						["<Esc>"] = "Close",
						["<CR>"] = "Confirm",
					},
					i = {
						["<CR>"] = "Confirm",
						["<C-u>"] = "HistoryPrev",
						["<C-e>"] = "HistoryNext",
					},
				},
			},
			select = {
				get_config = function(opts)
					if opts.kind == "codeaction" then
						return {
							backend = "telescope",
							telescope = require("telescope.themes").get_cursor {
								-- initial_mode = "normal",
								layout_config = { height = 15 },
							},
						}
					end

					return { backend = "telescope", telescope = nil }
				end,
			},
		},
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
	-- Manage LSP/DAP servers
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		opts = {
			pip = {
				upgrade_pip = true,
			},
			ui = {
				border = "rounded",
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
				keymaps = {},
			},
		},
	},
	-- Fuzz Finder
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim", lazy = true },
			{ "nvim-telescope/telescope-fzy-native.nvim", lazy = true },
		},
		keys = function()
			local extr_args = {
				"--hidden", -- Search hidden files that are prefixed with `.`
				"--no-ignore", -- Don’t respect .gitignore
				"-g",
				"!.git/",
				"-g",
				"!node_modules/",
				"-g",
				"!.idea/",
				"-g",
				"!pnpm-lock.yaml",
				"-g",
				"!package-lock.json",
				"-g",
				"!go.sum",
				"-g",
				"!lazy-lock.json",
				"-g",
				"!.zsh_history",
			}

			return {
				{ ",a", function() require("telescope.builtin").buffers() end },
				{ "<leader>;", function() require("telescope.builtin").command_history() end },

				-- Search
				{ "<leader>e", function() require("telescope.builtin").find_files() end },
				{
					"<leader>E",
					function()
						require("telescope.builtin").find_files {
							find_command = { "rg", "--color=never", "--smart-case", "--files", unpack(extr_args) },
						}
					end,
				},
				{ "<leader>/", function() require("telescope.builtin").live_grep() end },
				{ "<leader>?", function() require("telescope.builtin").live_grep { additional_args = extr_args } end },

				-- LSP
				{
					"<leader>l",
					function() require("telescope.builtin").lsp_references { initial_mode = "normal", reuse_win = true } end,
				},
				{
					"<leader>b",
					function() require("telescope.builtin").lsp_definitions { initial_mode = "normal", reuse_win = true } end,
				},
				{
					"<leader>m",
					function() require("telescope.builtin").lsp_type_definitions { initial_mode = "normal", reuse_win = true } end,
				},
				{
					"<leader>i",
					function() require("telescope.builtin").lsp_implementations { initial_mode = "normal", reuse_win = true } end,
				},
				{ "<leader>u", function() require("telescope.builtin").lsp_dynamic_workspace_symbols() end },
			}
		end,
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local trouble = require("trouble.sources.telescope")

			telescope.setup {
				defaults = {
					scroll_strategy = "limit",
					prompt_prefix = " ",
					selection_caret = " ",
					multi_icon = " ",
					mappings = {
						-- https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/mappings.lua#L133
						i = {
							["<C-n>"] = false, -- disable default keybinding

							["<C-u>"] = actions.cycle_history_prev,
							["<C-e>"] = actions.cycle_history_next,
							["<M-u>"] = actions.preview_scrolling_up,
							["<M-e>"] = actions.preview_scrolling_down,
							["<C-s>"] = actions.select_vertical,
							["<C-h>"] = actions.select_horizontal,
							["<C-t>"] = actions.select_tab,
							["<C-q>"] = trouble.open,
						},
						n = {
							["k"] = false, -- disable default keybinding
							["<S-Tab>"] = false, -- disable default keybinding

							["<Tab>"] = actions.toggle_selection,
							["<BS>"] = actions.delete_buffer,
							["u"] = actions.move_selection_previous,
							["e"] = actions.move_selection_next,
							["U"] = function(prompt_bufnr) require("telescope.actions.set").shift_selection(prompt_bufnr, -5) end,
							["E"] = function(prompt_bufnr) require("telescope.actions.set").shift_selection(prompt_bufnr, 5) end,
							["<C-u>"] = actions.cycle_history_prev,
							["<C-e>"] = actions.cycle_history_next,
							["<M-u>"] = actions.preview_scrolling_up,
							["<M-e>"] = actions.preview_scrolling_down,
							["s"] = actions.select_vertical,
							["h"] = actions.select_horizontal,
							["t"] = actions.select_tab,
							["<C-q>"] = trouble.open,
						},
					},
					buffer_previewer_maker = function(filepath, bufnr, opts)
						require("plenary.job")
							:new({
								command = "file",
								args = { "-b", "--mime", filepath },
								on_exit = function(j)
									if j:result()[1]:find("charset=binary", 1, true) then
										vim.schedule(function() vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" }) end)
									else
										require("telescope.previewers").buffer_previewer_maker(filepath, bufnr, opts)
									end
								end,
							})
							:sync()
					end,
				},
				pickers = {
					find_files = { previewer = false },
					live_grep = { theme = "ivy" },

					lsp_references = { theme = "ivy" },
					lsp_definitions = { theme = "ivy" },
					lsp_type_definitions = { theme = "ivy" },
					lsp_implementations = { theme = "ivy" },
					lsp_dynamic_workspace_symbols = {
						sorter = telescope.extensions.fzy_native.native_fzy_sorter(),
					},
				},
				extensions = {
					fzy_native = {
						override_generic_sorter = true,
						override_file_sorter = true,
					},
				},
			}

			telescope.load_extension("fzy_native")
			telescope.load_extension("noice")
		end,
	},
	-- Telescope smart-open plugin
	{
		"danielfalk/smart-open.nvim",
		dependencies = {
			{ "kkharji/sqlite.lua", lazy = true },
			{ "nvim-telescope/telescope-fzy-native.nvim", lazy = true },
		},
		keys = {
			{
				"<leader><leader>",
				function()
					require("telescope").extensions.smart_open.smart_open(
						require("telescope.themes").get_dropdown { cwd_only = true, previewer = false }
					)
				end,
			},
		},
		config = function() require("telescope").load_extension("smart_open") end,
	},
}
