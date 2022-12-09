local status, db = pcall(require, "dashboard")
if not status then
  vim.notify("Not found dashboard")
  return
end

-- 自定义底部显示文字
db.custom_footer = {
  "",
  "",
  "",
}

db.custom_center = {
  {
    icon = "  ",
    desc = "Projects                            ",
    action = "Telescope projects",
  },
  {
    icon = "  ",
    desc = "Recently files                      ",
    action = "Telescope oldfiles",
  },
  {
    icon = "  ",
    desc = "Edit keybindings                    ",
    action = "edit ~/.config/nvim/lua/keybindings.lua",
  },
  {
    icon = "  ",
    desc = "Edit Projects                       ",
    action = "edit ~/.local/share/nvim/project_nvim/project_history",
  },
  {
    icon = "  ",
    desc = "Edit .zshrc                         ",
    action = "edit ~/.zshrc",
  },
  -- {
  --   icon = "  ",
  --   desc = "Find text                           ",
  --   action = "Telescopecope live_grep",
  -- },
}

-- 自定义顶部显示ASCII图片
db.custom_header = {
  [[                                                   ]],
  [[███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
  [[████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
  [[██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
  [[██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
  [[██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
  [[╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
  [[                                                   ]],
 }
