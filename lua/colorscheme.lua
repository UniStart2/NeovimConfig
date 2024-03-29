local colorscheme = "dracula"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end


-->>>>>>>>>>>>>>>>>>>> dracula colorscheme <<<<<<<<<<<<<<<<<<<<--
local dracula = require("dracula")
dracula.setup({
  -- 自定义 dracula 调色板
  colors = {
    bg = "#282A36",
    fg = "#F8F8F2",
    selection = "#44475A",
    comment = "#6272A4",
    red = "#FF5555",
    orange = "#FFB86C",
    yellow = "#F1FA8C",
    green = "#50fa7b",
    purple = "#BD93F9",
    cyan = "#8BE9FD",
    pink = "#FF79C6",
    bright_red = "#FF6E6E",
    bright_green = "#69FF94",
    bright_yellow = "#FFFFA5",
    bright_blue = "#D6ACFF",
    bright_magenta = "#FF92DF",
    bright_cyan = "#A4FFFF",
    bright_white = "#FFFFFF",
    menu = "#21222C",
    visual = "#3E4452",
    gutter_fg = "#4B5263",
    nontext = "#3B4048",
  },
  -- 在buffers结束后显示 ～ 字符
  -- show_end_of_buffer = true, -- default false
  -- 使用透明背景
  -- transparent_bg = true, -- default false
  -- 设置自定义 lualine 背景颜色
  -- lualine_bg_color = "#44475a", -- default nil
  -- 设置斜体注释
  -- italic_comment = true, -- default false
  -- 覆盖默认高亮
  overrides = {
    -- Examples
    -- NonText = { fg = dracula.colors().white }, -- set NonText fg to white
    -- NvimTreeIndentMarker = { link = "NonText" }, -- link to NonText highlight
    -- Nothing = {} -- clear highlight of Nothing
  },
})
-->>>>>>>>>>>>>>>>>>>> dracula colorscheme <<<<<<<<<<<<<<<<<<<<--

