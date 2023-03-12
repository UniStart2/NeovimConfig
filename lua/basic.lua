-- 基础配置文件 basic。lua
-- utf8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = 'utf-8'
-- 设置使用 jkhl 移动时光标周围保留行数（默认8行）
vim.o.scrolloff = 8
vim.o.sidescrolloff = 8
-- 是否显示行号和相对行号
vim.wo.number = true
vim.wo.relativenumber = true
-- 是否高亮所在行（默认ture）
vim.wo.cursorline = true
-- 是否显示左侧图标指示列
vim.wo.signcolumn = "yes"
-- 设置右侧代码参考线（默认为100字符）
vim.wo.colorcolumn = "80"
-- 设置空格和缩进之间的关系（默认2个空格等于1个tab）
vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftround = true
-- 设置使用 >> << 进行缩进时移动长度（默认为2）
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2
-- 是否启用空格代替tab（默认true）
vim.o.expandtab = true
vim.bo.expandtab = true
-- 是否启动新行对齐当前行（默认true）
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smartindent = true
-- 是否启用搜索时大小写不敏感，除非包含大写（默认true）
vim.o.ignorecase = true
vim.o.smartcase = true
-- 是否启用搜索高亮（默认false）
vim.o.hlsearch = false
-- 是否启用边输入边搜索（默认true）
vim.o.incsearch = true
-- 设置命令行行高（默认为2）
vim.o.cmdheight = 2
-- 当文件被外部程序修改时，是否自动加载（默认true）
vim.o.autoread = true
vim.bo.autoread = true
-- 是否禁止折行（默认false）
vim.wo.wrap = false
-- 光标在行首尾时<Left><Right>可以跳到下一行
vim.o.whichwrap = '<,>[,]'
-- 是否允许隐藏被修改过的buffer（默认true）
vim.o.hidden = true
-- 设置鼠标支持
vim.o.mouse = "a"
-- 是否禁止创建备份文件（默认false）
vim.o.backup = false
vim.o.writebackup = false
vim.swapfile = false
-- 设置smaller updatetime
vim.o.updatetime = 500
-- 设置等待键盘快捷键连击时间
vim.o.timeoutlen = 1000
-- split window 分屏设置
vim.o.splitbelow = true
vim.o.splitright = true
-- 设置自动补全时不会自动选中
vim.g.completeopt = "menu,menuone,noselect,noinsert"
-- 样式设置
vim.o.background = "dark"
vim.o.termguicolors = true
vim.opt.termguicolors = true
-- 不可见字符的显示，把空格显示为一个点
vim.o.list = true
vim.o.listchars = "space:·"
-- 是否启用补全增强（默认true）
vim.o.wildmenu = true
-- Dont' pass messages to |ins-completin menu|
vim.o.shortmess = vim.o.shortmess .. 'c'
-- 设置补全提示最多显示的行数（默认10）
vim.o.pumheight = 10
-- 永远显示 tabline
vim.o.showtabline = 2
-- 使用增强状态栏插件后不再需要 vim 的模式提示
vim.o.showmode = false
