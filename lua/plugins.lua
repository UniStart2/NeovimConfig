local packer = require("packer")

packer.startup({
  function(use)
    -- packer可以管理自身
    use 'wbthomason/packer.nvim'
    -- 我们通常使用 use 'name/repo'来安装插件，name/repo对应github的地址
    -- 例如上面使用的 use 'wbthomason/packer.nvim'，对应的就是 
    -- https://github.com/wbthomason/packer.nvim 地址
    
    --------------------- colorscheme 插件 -------------------------
    -- tokyonight
    use "folke/tokyonight.nvim" 
    ----------------------------------------------------------------

    -- plugin: nvim-tree
    use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons'
      },
    }
    
    -- plugin: bufferline  
    -- using packer.nvim
    use {
      'akinsho/bufferline.nvim',
      requires = { 
        'nvim-tree/nvim-web-devicons',
        'moll/vim-bbye'
      },
      tag = 'v3.*',
    }

    -- plugin: lualine
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 
        'nvim-tree/nvim-web-devicons'
      }
    }
    use 'arkav/lualine-lsp-progress'
    
    -- plugin: telescope
    use {
      'nvim-telescope/telescope.nvim',
      requires = {
        'nvim-lua/plenary.nvim'
      }
    }
    -- telescope extension
    use 'LinArcX/telescope-env.nvim'
    use 'ahmedkhalf/project.nvim'

    -- plugin: dashboard-nvim
    use 'glepnir/dashboard-nvim'
    
    -- plugin: nvim-treesitter/nvim-treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

  end,
  -- 如果网络不好，可以配置config参数，使用代理站点
  config = {
    -- 并发限制
    max_jobs = 16,
    -- 自定义源
    git = {
      --default_url_format = "git@github.com:%s",
      --default_url_format = "https://hub.fastgit.xyz/%s",
    },
    -- 以浮动窗口打开安装列表
    display = {
      open_fn = function()
          return require("packer.util").float({ border = "single" })
      end,
    },
  }
})
-- 每次保存 plugins.lua 自动安装插件
pcall(
  vim.cmd,
  [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)
