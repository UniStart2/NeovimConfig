-- nvim配置入口文件
-- 基础配置
require("basic")
-- Packer插件管理
require("plugins")
-- 快捷键映射
require("keybindings")
-- 主题设置
require("colorscheme")

-->>>>>>>>>>>>>>>>>>>> 插件配置 <<<<<<<<<<<<<<<<<<<<<<<--
-- nvim-tree 插件配置
require("plugin-config.nvim-tree")
-- bufferline 插件配置
require("plugin-config.bufferline")
-- lualine 插件配置
require("plugin-config.lualine")
-- telescope 插件配置
require("plugin-config.telescope")
-- dashboard 插件配置
require("plugin-config.dashboard")
require("plugin-config.project")
-- nvim-treesitter 插件配置
require("plugin-config.nvim-treesitter")
-->>>>>>>>>>>>>>>>>>>> 插件配置 <<<<<<<<<<<<<<<<<<<<<<<--
