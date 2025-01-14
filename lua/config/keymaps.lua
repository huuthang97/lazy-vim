-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Pane resizing
map("n", "=", "5<C-w>>", opts)
map("n", "-", "5<C-w><", opts)
map("n", "+", "5<C-w>+", opts)
map("n", "_", "5<C-w>-", opts)
