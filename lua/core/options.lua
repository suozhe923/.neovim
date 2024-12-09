local opt = vim.opt
--设置局部变量以简化编写
opt.relativenumber = true
opt.number = true
--设置行号
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
--设置缩进
opt.wrap = false
--防止包裹  
opt.cursorline = true
--光标行
opt.mouse:append("a")
--启用鼠标
opt.clipboard:append("unnamedplus")
-- 系统剪贴板
opt.splitright = true
opt.splitbelow = true
-- 默认新窗口右或下
opt.termguicolors = true --终端色
--opt.signcolumn = "yes" --左侧多一行便于debug
opt.background = "light"
--设置背景颜色
opt.smartcase = true
opt.ignorecase = true
--设置搜索时忽略大小写，在输入大写时不忽略
