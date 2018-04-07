## Zsh

参考[这篇文章](https://www.jazz321254.com/visual-studio-code-zsh/)，做如下设置：

1. 安装zsh
   * MacOS 中已经包含了 zsh，我们先将 zsh 设为默认 shell
     ```shell
     chsh -s $(which zsh)
     ```
   * 然后安装 oh-my-zsh 插件管理器
     ```shell
     wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
     ```
2. 安装需要的 powerline 字体
   ```shell
   $git clone https://github.com/powerline/fonts.git --depth=1
   $cd fonts
   $./install.sh
   $cd ..
   $rm -rf fonts  
   ```
3. 使用 powerlevel9k 主题
   ```shell
   $git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
   $echo 'ZSH_THEME="powerlevel9k/powerlevel9k"' >> ~/.zshrc
   $source ~/.zshrc
   ```
4. 在 VSCode 中增加如下设置（快捷键：⌘ + , ）
   ```json
   {
    "terminal.integrated.fontFamily": "Source Code Pro for Powerline",
   }
   ```

## Screen

1. `.screenrc` 中的配置如下：
   ```shell
   vbell off
   startup_message off

   # bind ` key as the control key.
   escape ``

   # set the screen roll back to 1024 line.
   defscrollback 65536

   # Wait until at most 5 seconds when screen freezing.
   defnonblock 5

   altscreen on

   # show window list and clock on the bottom line.
   hardstatus on
   hardstatus alwayslastline
   hardstatus string "%{.bW}%-w%{.rY}%n %t%{-}%+w %=%{..G} %H(%l) %{..Y} %Y/%m/%d %c:%s "
   ```
2. 关闭 zsh 的自动更改标签命：在 .zshrc 中加入 `DISABLE_AUTO_TITLE="true"`

## Visual Studio Code

**Config Sync Setting**

* gist token: `092a92051b09156cd1681ed0f91f44de2a000e58`
* gist id: `4b068dce2830f4c016a74041174f2207`

## Docker

1. 镜像加速
