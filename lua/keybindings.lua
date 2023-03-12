-- neovim 快捷键设置
-- 设置 leader key 为自己常用的前缀，默认为空格 
-- 之后定义快捷键看到的<leader>就表示你设置的这个值
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--[[
  ===================== neovim 快捷键设置的一些相关说明 ==========================
  vim.api.nvim_set_keymap 用于全局快捷键设置
  vim.api.nvim_buf_set_keymap() Buffer 快捷键设置

  调用形式一般如下：
  vim.api.nvim_set_keymap('模式', '按键', '映射为', 'options')
  其中：
  1.模式参数用一个字母表示，常见的有：
    1.1 n Normal模式
    1.2 i Insert模式
    1.3 v Visual模式
    1.4 t Terminal模式
    1.5 c Command模式
  2.映射为 可以是多个按键组合，如5j就是连续点击5和j，也可以时一条命令比如:q<CR>，表示退出
  3.options 大部分会设置为{ noremap = true, silent = true }。noremap=true表示不会
    重新映射，比如有一个映射A->B，还有一个映射B->C，如果noremap=false，那么A就会被重新映
    射为A->C。slient=true表示不会输出多余信息
  ============================================================================
]]

-- 将 vim.api.nvim_set_keymap 保存为本地变量，便于之后复用
local map = vim.api.nvim_set_keymap
-- 将 options 部分设置保存为本地变量，便于之后复用
local opt = {noremap = true, silent = true }

-->>>>>>>>>>>>>>>>>>>>>>>>>>>> 全局快捷键设置 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<--
-- 取消 s 默认功能
map("n", "s", "", opt)
-- 分屏快捷键设置
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
-- 关闭当前窗口
map("n", "sc", "<C-w>c", opt)
-- 关闭其他窗口
map("n", "so", "<C-w>o", opt)
-- Alt(option) + hjkl 在窗口间进行跳转
-- 垂直分屏时 Alt(option) + h 向左边窗口移动
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
-- 水平分屏时 Alt(option) + k 向上边窗口移动
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)

-- 调整窗口比例快捷键设置
-- 左右比例控制
map("n", "<C-Left>", ":vertical resize -2<CR>", opt)
map("n", "<C-Right>", ":vertical resize +2<CR>", opt)
map("n", "s,", ":vertical resize -20<CR>", opt)
map("n", "s.", ":vertical resize +20<CR>", opt)
-- 上下比例
map("n", "sj", ":resize +10<CR>", opt)
map("n", "sk", ":resize -10<CR>", opt)
map("n", "<C-Down>", ":resize +2<CR>", opt)
map("n", "<C-Up>", ":resize -2<CR>", opt)
-- 等比例
map("n", "s=", "<C-w>=", opt)

-- Terminal模式下相关快捷键设置
map("n", "<leader>t", ":sp | terminal<CR>", opt)
map("n", "<leader>vt", ":vsp | terminal<CR>", opt)
map("t", "<Esc>", "<C-\\><C-n>", opt)
map("t", "<A-h>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<A-j>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<A-k>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<A-l>", [[ <C-\><C-N><C-w>l ]], opt)

-- Visual模式下相关快捷键设置
-- visual模式下使用 > 或 < 缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- visual模式下使用 J 和 K 上下移动代码
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)

-- 浏览代码相关快捷键设置（移动行数可以根据自己需要修改）
-- ctrl + j / ctrl + k 移动3行
map("n", "<C-j>", "3j", opt)
map("n", "<C-k>", "3k", opt)
-- ctrl u / ctrl + d  只移动10行，默认移动半屏
map("n", "<C-u>", "10k", opt)
map("n", "<C-d>", "10j", opt)

-- 在visual 模式里粘贴不要复制
map("v", "p", '"_dP', opt)
-- 退出
--map("n", "q", ":q<CR>", opt)
--map("n", "qq", ":q!<CR>", opt)
--map("n", "Q", ":qa!<CR>", opt)
-- insert 模式下，跳到行首行尾
map("i", "<C-h>", "<ESC>I", opt)
map("i", "<C-l>", "<ESC>A", opt)
-->>>>>>>>>>>>>>>>>>>>>>>>>>>> 全局快捷键设置 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<--

-->>>>>>>>>>>>>>>>>>>>>>>>>>>> 插件快捷键设置 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<--
local pluginKeys = {}

-- nvim-tree
-- alt(macos下是option键） + m 键打开关闭tree
map("n", "<A-m>", ":NvimTreeToggle<CR>", opt)
-- 列表快捷键
pluginKeys.nvimTreeList = {
  -- 打开文件或文件夹
  { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
  -- 分屏打开文件
  { key = "v", action = "vsplit" },
  { key = "h", action = "split" },
  -- 显示隐藏文件
  { key = "i", action = "toggle_custom" }, --对应plugin-config/nvim-tree.lua中filters下的custom
  { key = ".", action = "toggle_dotfiles" },
  -- 文件操作
  { key = "<F5>", action = "refresh" },
  { key = "a", action = "create" },
  { key = "d", action = "remove" },
  { key = "r", action = "rename" },
  { key = "x", action = "cut" },
  { key = "c", action = "copy" },
  { key = "p", action = "paste" },
  { key = "s", action = "system_open" }
}

-- bufferline
-- 左右Tab切换
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
-- 关闭
--"moll/vim-bbye"
map("n", "<C-w>", ":Bdelete!<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)

-- Telescope
-- 查找文件
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
map("n", "<C-f>", ":Telescope live_grep<CR>", opt)
-- Telescope 列表中 插入模式快捷键
pluginKeys.telescopeList = {
  i = {
    -- 上下移动
    ["<C-j>"] = "move_selection_next",
    ["<C-k>"] = "move_selection_previous",
    ["<Down>"] = "move_selection_next",
    ["<Up>"] = "move_selection_previous",
    -- 历史记录
    ["<C-n>"] = "cycle_history_next",
    ["<C-p>"] = "cycle_history_prev",
    -- 关闭窗口
    ["<C-c>"] = "close",
    -- 预览窗口上下滚动
    ["<C-u>"] = "preview_scrolling_up",
    ["<C-d>"] = "preview_scrolling_down",
  }
}

-- lsp 回调函数快捷键设置（所有Language Server通用）
pluginKeys.mapLSP = function(mapbuf)
  -->>>>>>>>>>> 将之前设置的快捷键替换为lspsaga 提供的命令 <<<<<<<<<<<<<<-- 
  -- 例如：
  -- mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
  -- 替换为:
  -- mapbuf("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opt)
  -------------------------------------------------------------------------

  --  变量重命名
  -- mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
  mapbuf("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opt)
  -- 
  --mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
  mapbuf("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opt)
  
  -- go xx
  -- 跳转到定义
  -- mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
  mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
  -- 悬停提示
  --mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
  mapbuf("n", "gh", "<cmd>Lspsaga hover_doc<cr>", opt)
  mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
  mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)

  -- 查找引用
  --mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
  mapbuf("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opt)
  
  -- diagnostic
  --[[
  mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
  mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
  mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
  --]]
  mapbuf("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
  mapbuf("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opt)
  mapbuf("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opt)
  mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.format{async=true}<CR>", opt)
  
  -- 没用到
  -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
  -- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
  -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
  -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

-- nvim-cmp 自动补全相关快捷键设置
-- nvim-cmp 自动补全
pluginKeys.cmp = function(cmp)
    return {
        -- alt(option) + . 出现补全弹窗
        ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
        -- alt(option) + . 取消补全弹窗
        ["<A-,>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        }),
        -- 上一个
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        -- 下一个
        ["<C-j>"] = cmp.mapping.select_next_item(),
        -- 确认
        ["<CR>"] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace
        }),
        -- 如果窗口内容太多，可以滚动
        ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
        ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
    }
end

-->>>>>>>>>>>>>>>>>>>>>>>>>>>> 插件快捷键设置 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<--
return pluginKeys
