-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- VSCode-like shortcuts
vim.keymap.set("n", "<D-s>", ":w<CR>", { desc = "Save file (Cmd+S)" })
vim.keymap.set("i", "<D-s>", "<Esc>:w<CR>a", { desc = "Save file (Cmd+S)" })
vim.keymap.set("v", "<D-s>", "<Esc>:w<CR>", { desc = "Save file (Cmd+S)" })

vim.keymap.set("n", "<D-z>", "u", { desc = "Undo (Cmd+Z)" })
vim.keymap.set("i", "<D-z>", "<Esc>u", { desc = "Undo (Cmd+Z)" })

vim.keymap.set("n", "<D-S-z>", "<C-r>", { desc = "Redo (Cmd+Shift+Z)" })
vim.keymap.set("i", "<D-S-z>", "<Esc><C-r>", { desc = "Redo (Cmd+Shift+Z)" })

vim.keymap.set("n", "<D-a>", "ggVG", { desc = "Select all (Cmd+A)" })
vim.keymap.set("i", "<D-a>", "<Esc>ggVG", { desc = "Select all (Cmd+A)" })

vim.keymap.set("v", "<D-c>", '"+y', { desc = "Copy (Cmd+C)" })
vim.keymap.set("n", "<D-v>", '"+p', { desc = "Paste (Cmd+V)" })
vim.keymap.set("i", "<D-v>", '<C-r>+', { desc = "Paste (Cmd+V)" })
vim.keymap.set("v", "<D-v>", '"+p', { desc = "Paste (Cmd+V)" })

vim.keymap.set("v", "<D-x>", '"+d', { desc = "Cut (Cmd+X)" })

vim.keymap.set("n", "<D-f>", "/", { desc = "Find (Cmd+F)" })
vim.keymap.set("i", "<D-f>", "<Esc>/", { desc = "Find (Cmd+F)" })

-- Additional VSCode-like shortcuts
vim.keymap.set("n", "<D-w>", ":bd<CR>", { desc = "Close buffer/tab (Cmd+W)" })
vim.keymap.set("i", "<D-w>", "<Esc>:bd<CR>", { desc = "Close buffer/tab (Cmd+W)" })

vim.keymap.set("n", "<D-n>", ":enew<CR>", { desc = "New file (Cmd+N)" })
vim.keymap.set("i", "<D-n>", "<Esc>:enew<CR>", { desc = "New file (Cmd+N)" })

vim.keymap.set("n", "<D-p>", "<leader>ff", { desc = "File picker (Cmd+P)", remap = true })
vim.keymap.set("i", "<D-p>", "<Esc><leader>ff", { desc = "File picker (Cmd+P)", remap = true })

vim.keymap.set("n", "<D-S-p>", "<leader>:", { desc = "Command palette (Cmd+Shift+P)", remap = true })
vim.keymap.set("i", "<D-S-p>", "<Esc><leader>:", { desc = "Command palette (Cmd+Shift+P)", remap = true })

