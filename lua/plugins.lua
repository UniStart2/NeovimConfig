local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("Not found packer")
  return
end

packer.startup({
  function(use)
    -- packer可以管理自身
    use 'wbthomason/packer.nvim'
    -- 我们通常使用 use 'name/repo'来安装插件，name/repo对应github的地址
    -- 例如上面使用的 use 'wbthomason/packer.nvim'，对应的就是 
    -- https://github.com/wbthomason/packer.nvim 地址
    
    --------------------- colorscheme 插件 -------------------------
    -- tokyonight
    -- use "folke/tokyonight.nvim" 
    use "EdenEast/nightfox.nvim"
    use "sainnhe/sonokai"
    use "Mofiqul/dracula.nvim"
    ----------------------------------------------------------------
    
    -- plugin: nvim-notify
    --use {
    --  "rcarriga/nvim-notify",
    --  config = function()
    --    require("plugin-config.nvim-notify")
    --  end,
    --}

    -- plugin: nvim-tree
    use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons'
      },
      config = function() 
        require("plugin-config.nvim-tree")
      end,
    }
    
    -- plugin: bufferline  
    use {
      'akinsho/bufferline.nvim',
      requires = { 
        'nvim-tree/nvim-web-devicons',
        'moll/vim-bbye'
      },
      config = function() 
        require("plugin-config.bufferline")
      end,
    }

    -- plugin: lualine
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 
        'nvim-tree/nvim-web-devicons'
      },
      config = function() 
        require("plugin-config.lualine")
      end,
    }
    use 'arkav/lualine-lsp-progress'
    
    -- plugin: telescope
    use {
      'nvim-telescope/telescope.nvim',
      requires = {
        -- telescope extensions
        'LinArcX/telescope-env.nvim',
        'nvim-telescope/telescope-ui-select.nvim',
      },
      config = function()
        require("plugin-config.telescope")
      end,
    }

    -- plugin: dashboard-nvim
    use { 
      'glepnir/dashboard-nvim',
      config = function()
        require("plugin-config.dashboard")
      end,    
    }

    -- plugin: project
    use {
      'ahmedkhalf/project.nvim',
      config = function() 
        require("plugin-config.project")
      end,
    }
    
    -- plugin: nvim-treesitter
    use {
      'nvim-treesitter/nvim-treesitter',
      run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
      end,
      requires = {
        'p00f/nvim-ts-rainbow',
        'JoosepAlviste/nvim-ts-context-commentstring',
        'windwp/nvim-ts-autotag',
        'nvim-treesitter/nvim-treesitter-refactor',
        'nvim-treesitter/nvim-treesitter-textobjects',
      },
      config = function()
        require("plugin-config.nvim-treesitter")
      end,
    } 
    
    -->>>>>>>>>>>>>>>>>>  UI 增强 <<<<<<<<<<<<<<<<--
    use 'onsails/lspkind-nvim'
    use 'tami5/lspsaga.nvim'
    -- 代码格式化
    -- 方案一
    --use 'mhartington/formatter.nvim'
    -- 方案二
    use {
      'jose-elias-alvarez/null-ls.nvim',
      requires = {
        'nvim-lua/plenary.nvim',
      },
    }    

    -- plugin: indent-blankline
    use { 
      'lukas-reineke/indent-blankline.nvim',
      config = function()
        require("plugin-config.indent-blankline")
      end,
    }
    -->>>>>>>>>>>>>>>> UI 增强 <<<<<<<<<<<<<<<<<--
    
    -- plugin: toggleterm
    --use {
    --  "akinsho/toggleterm.nvim",
    --  config = function()
    --    require("plugin-config.toggleterm")
    --  end,
    --}

    ----------------- LSP ----------------------
    -- lspconfig
    use 'neovim/nvim-lspconfig' 
    -- installer: mason 替代 lsp-installer
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    -- 补全引擎
    use 'hrsh7th/nvim-cmp'
    -- snippet 引擎
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    -- 补全源
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/cmp-nvim-lsp' -- 使用lsp内置补全
    use 'hrsh7th/cmp-buffer' -- { name = 'buffer' }
    use 'hrsh7th/cmp-path' -- { name = 'path' }
    use 'hrsh7th/cmp-cmdline' -- { name = 'cmdline' }
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    -- 常见编程语言代码片段
    use 'rafamadriz/friendly-snippets'
    -- crates.io dependencies补全
    use {
      'saecki/crates.nvim',
      event = { "BufRead Cargo.toml" },
      requires = { { 'nvim-lua/plenary.nvim' } },
      config = function()
          require('crates').setup()
      end,
    }

    -->>>>>>>>>> 特定编程语言增强 <<<<<<<<<<<<--
    -- typescript 增强
    use { 
      'jose-elias-alvarez/nvim-lsp-ts-utils',
      requires = { 
        "nvim-lua/plenary.nvim" 
      },
    }
    use 'jose-elias-alvarez/typescript.nvim'
    -- lua增强
    use 'folke/neodev.nvim'
    -- jsont增强
    use 'b0o/schemastore.nvim'
    -- rust增强
    use 'simrat39/rust-tools.nvim'
    -->>>>>>>>>> 特定编程语言增强 <<<<<<<<<<<<--
    ----------------- LSP ----------------------
    
  end,
  -- 如果网络不好，可以配置config参数，使用代理站点
  config = {
    -- 并发限制
    max_jobs = 16,
    -- 自定义源
    git = {
      --default_url_format = "git@github.com:%s",
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

-- 防止代码折叠失效
pcall(
  vim.cmd,
  [[
    augroup fold_fix
    autocmd!
    autocmd BufRead * autocmd BufWinEnter * ++once normal! zx zR
    augroup end
  ]]
)
