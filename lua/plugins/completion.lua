return {
	-- Auto-pairing brackets
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {
			disable_filetype = { "TelescopePrompt", "vim" },
			check_ts = true,
			enable_check_bracket_line = true,
			fast_wrap = {
				-- map = "<M-e>",
				chars = { "{", "(", "[", "<", '"', "'", "`" },
			},
		},
		-- TODO: remove this block when https://github.com/windwp/nvim-autopairs/pull/363 is merged
		config = function(opts)
			local autopairs = require("nvim-autopairs")
			local Rule = require("nvim-autopairs.rule")
			local cond = require("nvim-autopairs.conds")
			autopairs.setup(opts)
			autopairs.add_rules {
				Rule("<", ">"):with_pair(cond.before_regex("%a+")):with_move(function(o) return o.char == ">" end),
			}
		end,
		-- END TODO
	},
	-- Switch between single-line and multiline forms of code
	{
		"Wansmer/treesj",
		keys = {
			{ "<leader>s", ":TSJToggle<CR>", silent = true, desc = "Single-line/Multiline forms" },
		},
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {
			use_default_keymaps = false,
			max_join_length = 999,
		},
	},
	-- Sorting plugin that supports line-wise and delimiter sorting
	{
		"sQVe/sort.nvim",
		keys = {
			{ "go", ":Sort<CR>", mode = "n", silent = true, desc = "Sort Line"
			},
			{ "go", "<Esc>:Sort<CR>", mode = "v", silent = true, desc = "Sort" },
			{ "gO", ":Sort!<CR>", mode = "n", silent = true, desc = "Reverse Sort Line"
			},
			{ "gO", "<Esc>:Sort!<CR>", mode = "v", silent = true, desc = "Reverse Sort" },
		},
	},
	-- Surround Plugin
	{
		"kylechui/nvim-surround",
		event = { "BufReadPost", "BufNewFile" },
		config = true,
	},
}
