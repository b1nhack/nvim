return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"nvim-dap-ui",
		"nvim-treesitter",
		"nvim-dap-virtual-text",
	},
	keys = {
		"<Leader>b",
		"<Leader>d",
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

		local sign = vim.fn.sign_define
		sign("DapBreakpoint", { text = " ", texthl = "DapBreakpoint", linehl = "", numhl = "" })
		sign("DapBreakpointCondition", { text = " ", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
		sign("DapLogPoint", { text = " ", texthl = "DapLogPoint", linehl = "", numhl = "" })
		sign("DapStopped", { text = " ", texthl = "DapStopped", linehl = "", numhl = "" })
		sign("DapBreakpointRejected", { text = " ", texthl = "DapBreakpointRejected", linehl = "", numhl = "" })

		vim.keymap.set("n", "<Leader>b", function()
			require("dap").toggle_breakpoint()
		end, { desc = "Toggle Breakpoint" })

		vim.keymap.set("n", "<Leader>d", function()
			require("dap").continue()
		end, { desc = "Dap Continue" })
	end,
}
