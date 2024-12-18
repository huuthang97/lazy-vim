-- Cấu hình phím tắt Ctrl + P để tìm file trong Telescope
vim.api.nvim_set_keymap("n", "<C-p>", ":Telescope find_files<CR>", { noremap = true, silent = true })
