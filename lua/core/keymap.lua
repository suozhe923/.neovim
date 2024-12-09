vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local km = vim.keymap

--三个参数分别为模式，修改后按键，原按键

-- visual 模式
km.set("v","J", ":m '>+1<CR>gv=gv") 
km.set("v","K", ":m '<-2<CR>gv=gv")
--实现了拖动选中的文本
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)
--用< 和 >改变缩进

-- normal 模式
km.set("n", "<leader>nh", ":nohl<CR>")
--no highlight, 关掉/查找后的高光
km.set("n", "<C-h>", "<C-w>h", opts)
km.set("n", "<C-j>", "<C-w>j", opts)
km.set("n", "<C-k>", "<C-w>k", opts)
km.set("n", "<C-l>", "<C-w>l", opts)
--用Ctrl+h/j/k/l快捷切换窗口
vim.api.nvim_set_keymap('n', '<leader>t', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
--用 t快速打开和关闭tree
vim.api.nvim_set_keymap('n', '<leader>f', ':NvimTreeFocus<CR>', { noremap = true, silent = true })







