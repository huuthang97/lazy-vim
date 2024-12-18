return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup {
      size = function(term)
        if term.direction == "horizontal" then
          return vim.o.lines * 0.5 -- Terminal chiếm nửa chiều cao màn hình
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.5 -- Terminal chiếm nửa chiều rộng màn hình
        end
      end,
      open_mapping = [[<leader>tt]], -- Phím tắt để toggle terminal
      direction = "vertical", -- Terminal mở theo chiều dọc mặc định
      persist_size = false, -- Không ghi nhớ kích thước terminal
      shade_terminals = false, -- Không làm tối terminal
      dir = vim.fn.getcwd(), -- Terminal luôn mở tại thư mục hiện tại (cwd)
    }

    -- Keymap để toggle terminal hiện tại
    vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal" })

    -- Keymap để mở terminal mới
    local function new_terminal()
      local Terminal = require("toggleterm.terminal").Terminal
      local term = Terminal:new({ direction = "vertical" }) -- Tạo terminal mới theo chiều dọc
      term:toggle()
    end
    vim.keymap.set("n", "<leader>to", new_terminal, { desc = "Open new terminal" })
    vim.keymap.set("t", "<leader>to", new_terminal, { desc = "Open new terminal in terminal mode" })

    -- Di chuyển tới terminal trước đó
    vim.keymap.set("t", "<leader>tp", function()
      vim.api.nvim_command("wincmd p")
    end, { desc = "Previous terminal" })

    -- Di chuyển tới terminal tiếp theo
    vim.keymap.set("t", "<leader>tn", function()
      vim.api.nvim_command("wincmd w")
    end, { desc = "Next terminal" })


    -- Keymap để đóng terminal hiện tại
    vim.keymap.set("t", "<leader>td", function()
      vim.api.nvim_command("close")
      -- vim.api.nvim_command("ToggleTerm") -- Tắt terminal hiện tại
    end, { desc = "Close current terminal" })

    -- Keymap cho các terminal ID cụ thể (multi-terminal)
    vim.keymap.set("n", "<leader>t1", "<cmd>1ToggleTerm<cr>", { desc = "Toggle Terminal 1" })
    vim.keymap.set("n", "<leader>t2", "<cmd>2ToggleTerm<cr>", { desc = "Toggle Terminal 2" })
    vim.keymap.set("n", "<leader>t3", "<cmd>3ToggleTerm<cr>", { desc = "Toggle Terminal 3" })
  end,
}
