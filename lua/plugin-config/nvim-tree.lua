-- neovim 侧边栏显示配置
local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
  vim.notify("Not found nvim-tree")
  return
end

-- 列表操作快捷键
local list_keys = require('keybindings').nvimTreeList
nvim_tree.setup({
  -- 完全禁止内置netrw
  disable_netrw = true,
  -- 不显示 git 状态图标
  git = {
    enable = false,
  },
  -- projecet plugin 配置
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  filters = {
    -- 隐藏 .文件
    dotfiles = true,
    -- 隐藏 node_modules文件夹
    -- custom = { 'node_modules' },
  },
  view = {
    width = 30, -- 宽度
    side = 'left', -- 靠左显示
    hide_root_folder = false, -- 隐藏根目录
    -- 自定义列表快捷键
    mappings = {
      custom_only = true, -- 只使用内置快捷键
      list = list_keys,
    },
    -- 不显示行号
    number = false, 
    relativenumber = false,
    signcolumn = "yes", -- 显示图标
  },
  actions = {
    open_file = {
      resize_window = true, -- 首次打开大小适配
      quit_on_open = false, -- 打开文件时关闭 tree
    },
  },
  system_open = {
    cmd = 'open' -- WSL下设置为wsl-open，并执行npm install -g wsl-open命令
  },  
})

-- 自动关闭
vim.cmd([[
  autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr()
]])

