local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
  vim.notify("Not found nvim-treesitter")
  return
end

treesitter.setup({
  -- 安装 language parser
  -- :TSInstallaInfo 命令查看支持的语言
  ensure_installed = { 
    "html", "css", "jq", "javascript", "typescript", "tsx", "vue", "scss",
    "bash", "make", "cmake", "cpp", "c_sharp", "arduino", "lua",
    "java", "rust", "ruby", "go", "erlang", "elixir", "dart", "php", "python",
    "kotlin", "julia", "swift", "scala", "markdown",
    "json", "json5", "dockerfile", "yaml", "toml"
  },
  -- 启用代高亮
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  -- 启用增量选择
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      -- 外扩
      node_incremental = "<CR>",
      -- 内收
      node_decremental = "<DEL>",
      scope_incremental = "<TAB>",
    },
  },
  -- 启用代码缩进（使用=号进行自动缩进）
  indent = {
    enable = true
  },
})

-- 开启 Folding 模块
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- 默认不要折叠
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.opt.foldlevel = 99
