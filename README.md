s# 个人Neovim配置

## 参考
- [Neovim IDE from Scratch](https://www.youtube.com/watch?v=ctH-a-1eUME&t=11s "Youtube - 
chris@machine")
- 一键式配置: [Nvchad](https://nvchad.com/)
- Neovim版本管理工具：[bob
](https://github.com/MordechaiHadad/bob)

## ⚠️注意
- 使用[packer.nvim](https://github.com/wbthomason/packer.nvim)作为Neovim插件管理工具
- Neovim安装插件时出现git超时问题解决
	1. 使用代理
	2. 修改packe.nvim使用的镜像，参考[issue](https://github.com/nshen/learn-neovim-lua/issues/18)
  	3. 使用ssh的方式下载插件

## 使用说明
1. 确保已经安装[Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)（0.8.0及以上）
2. 确保已经安装一种[Nerd fonts](https://www.nerdfonts.com/font-downloads)字体
3. 克隆仓库配置文件到本地
  - Linux/MacOS: 克隆到 ~/.config/nvim 文件夹中
4. 确保安装Neovim插件包管理工具[packer.nvim](https://github.com/wbthomason/packer.nvim)
5. 使用nvim命令打开编辑器，运行`:PackerSync`命令

![Alt](https://repobeats.axiom.co/api/embed/6d031ecba34776c0f2eb6598f016986e3e84a765.svg "Repobeats analytics image")
