return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"nvim-dap-ui",
		"nvim-treesitter",
		"nvim-dap-virtual-text",
		"mason-nvim-dap.nvim",
	},
	keys = {
		"<Leader>db",
		"<Leader>dd",
	},

	config = function()
		local dap, dapui = require("dap"), require("dapui")
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		require("dap.ext.vscode").json_decode = require("json5").parse

		-- stylua: ignore start
		local sign = vim.fn.sign_define
		sign("DapBreakpoint", { text = " ", texthl = "DapBreakpoint", linehl = "", numhl = "DapBreakpoint" })
		sign("DapBreakpointCondition", { text = " ", texthl = "DapBreakpointCondition", linehl = "", numhl = "DapBreakpointCondition" })
		sign("DapLogPoint", { text = " ", texthl = "DapLogPoint", linehl = "", numhl = "DapLogPoint" })
		sign("DapStopped", { text = " ", texthl = "DapStopped", linehl = "", numhl = "DapStopped" })
		sign("DapBreakpointRejected", { text = " ", texthl = "DapBreakpointRejected", linehl = "", numhl = "DapBreakpointRejected" })
		-- stylua: ignore end

		vim.keymap.set("n", "<Leader>db", function()
			require("dap").toggle_breakpoint()
		end, { desc = "Toggle Breakpoint" })

		vim.keymap.set("n", "<Leader>dd", function()
			require("dap").continue()
		end, { desc = "Dap Continue" })
	end,
}
