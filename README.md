## 设置普通用户

brew 等工具要求用户不能是 root，因此我们需要为机器添加普通账户，并为他赋予 sudo 权限

1. 新建用户
   ```shell
   adduser username
   ```
2. 赋予 sudo 权限
   ```shell
   adduser username sudo
   ```
3. 修改 sudo 密码输入间隔
   在 /etc/sudoers 中增加 `Defaults:username timestamp_timeout=20`，其中 username 是用户名，20 是间隔时间，单位分钟。

## 安装字体

安装 nerd-font 字体，让 zsh 和 tmux 等工具更美观。

### Mac

下载并双击字体文件完成安装，具体可参考[文档](https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k)。

### Linux

clone 代码目录
```shell
git clone --depth=1 https://github.com/ryanoasis/nerd-fonts/
```

进入代码根目录，执行安装脚本。安装参数可参考[文档](https://github.com/ryanoasis/nerd-fonts/#option-3-install-script)。
```shell
./install.sh
```

### 为 vscode 配置新字体

在 vscode 设置中找到 `terminal.integrated.fontFamily`, 然后填入 `MesloLGS NF`。

## brew

brew 作为 mac 和 linux 下的软件包管理器，体验非常好。由于网络原因，安装和使用都必须设置国内的源。参考清华大学的[文档](https://mirrors.tuna.tsinghua.edu.cn/help/homebrew/)。

### 安装

终端中输入以下命令设置环境变量。
```shell
if [[ "$(uname -s)" == "Linux" ]]; then BREW_TYPE="linuxbrew"; else BREW_TYPE="homebrew"; fi
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/${BREW_TYPE}-core.git"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/${BREW_TYPE}-bottles"
```

运行以下命令安装 brew。
```shell
# 从本镜像下载安装脚本并安装 Homebrew / Linuxbrew
git clone --depth=1 https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/install.git brew-install
/bin/bash brew-install/install.sh
rm -rf brew-install

# 也可从 GitHub 获取官方安装脚本安装 Homebrew / Linuxbrew
/bin/bash -c "$(curl -fsSL https://github.com/Homebrew/install/raw/master/install.sh)"
```

### 配置

在 `~/.zshrc` 和 `~/.zprofile` 中设置环境变量，配置镜像源。
```shell
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/linuxbrew-core.git"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/linuxbrew-bottles"
```

## Zsh

参考[这篇文章](https://www.jazz321254.com/visual-studio-code-zsh/)，做如下设置：

1. 安装zsh
   * MacOS 中已经包含了 zsh，Ubuntu 使用 `apt-get install zsh` 安装
   * 将 zsh 设为默认 shell
     ```shell
     chsh -s $(which zsh)
     ```
   * 然后安装 oh-my-zsh 插件管理器
     ```shell
     sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
     ```
2. 安装 zsh 插件
   * zsh-autosuggestions 自动补全
     ```shell
     git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
     ```
   * zsh-syntax-highlighting 语法高亮
     ```shell
     git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
     ```
   * sudo 连按两次 ESC 在当前命令前加上 sudo
     * 只需在配置文件中加入插件名 `sudo` 即可
3. zsh 状态栏**不显示** user@machine 信息
   * 在 `~/.zshrc` 中加入下面的内容，关闭显示
      ```shell
      # Do NOT display the "user@machine" info.
      prompt_context() {}
      ```
4. 启用 zsh 插件
   * 在 ~/.zshrc 的 plugins 中加入安装的插件。注意，插件是用空格或者换行分隔，不要使用逗号。

> zsh 插件参考文章：https://zhuanlan.zhihu.com/p/334293505

## Powerlevel10k

Powerlevel10k 是一套比较美观的 zsh 主题。

### 安装

```shell
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
```

克隆后，在 `~/.zshrc` 中设置 `ZSH_THEME=powerlevel10k/powerlevel10k` 即可。

### 配置

执行脚本，进入交互式问答界面，回答几个问题后即可完成配置。
```shell
p10k configure
```

可修改 ~/.p10k.zsh 定制化 powerlevel10k 主题，作者的注释写得很清楚，按需修改即可。也可参阅相关的[中文教程](https://suixinblog.cn/2019/09/beautify-terminal.html)。

## tmux

### 安装

```shell
brew install tmux
```

### 配置

推荐 [oh-my-tmux](https://github.com/gpakosz/.tmux) 配置。执行下面的命令安装配置。
```shell
cd ~
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
```

Repo 中有一份当前 tmux 配置的备份。

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
