# 个人Neovim配置

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
  	3. 使用ssh的方式下载插件（记得在`~/.ssh/known_hosts`文件中添加[GitHub's SSH key fingerprints](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/githubs-ssh-key-fingerprints)，该文件没有的话可以自行创建)

## 使用说明
1. 确保已经安装[Neovim](https://github.com/neovim/neovim/wiki/Installing-Neovim)（0.8.0及以上）
2. 确保已经安装一种[Nerd fonts](https://www.nerdfonts.com/font-downloads)字体
3. 克隆仓库配置文件到本地
  - Linux/MacOS: 克隆到 ~/.config/nvim 文件夹中
4. 确保安装Neovim插件包管理工具[packer.nvim](https://github.com/wbthomason/packer.nvim)
5. 使用nvim命令打开编辑器，直接运行`:PackerSync`命令（第一次打开编辑器会报错，是因为配置的插件还没有通过packer拉取下来）

![Alt](https://repobeats.axiom.co/api/embed/6d031ecba34776c0f2eb6598f016986e3e84a765.svg "Repobeats analytics image")
