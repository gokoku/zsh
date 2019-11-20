#--------------------------------------------------------------------------------
# General
#--------------------------------------------------------------------------------
PATH=$PATH:$HOME/bin
PATH=$PATH:/Library/TeX/texbin
PATH=/usr/local/sbin:$PATH
PATH=/usr/local/bin:$PATH
PATH=$HOME/.anyenv/bin:$PATH
PATH=/usr/local/opt/mysql@5.6/bin:$PATH
PATH=$PATH:$HOME/.composer/vendor/bin

export PATH
export SDKMAN_DIR="/Users/george/.sdkman"
export PGDATA='/usr/local/var/postgres'

# keyバインドをEmacs
bindkey -e
# ピープ音をならさないようにする
setopt no_beep
#--------------------------------------------------------------------------------
# r コマンドを無効にする。(R をインストールしたので)
#--------------------------------------------------------------------------------
disable r
#--------------------------------------------------------------------------------
# anyenv
#--------------------------------------------------------------------------------
eval "$(anyenv init -)"
#--------------------------------------------------------------------------------
# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
#--------------------------------------------------------------------------------
[[ -s "/Users/george/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/george/.sdkman/bin/sdkman-init.sh"
#--------------------------------------------------------------------------------
# fzf インタラクティブフィルター関数
#--------------------------------------------------------------------------------
[ -f ~/zsh/.fzf.zsh ] && source ~/zsh/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS='
--height 40% --layout=reverse --border
--color fg:188,bg:233,hl:103,fg+:222,bg+:234,hl+:104
--color info:183,prompt:110,spinner:107,pointer:167,marker:215
'

#--------------------------------------------------------------------------------
# 履歴
#--------------------------------------------------------------------------------
## 履歴の保存
HISTFILE=$HOME/.zshistory
HISTSIZE=10000
SAVEHIST=10000
##   履歴の重複を記録しない
setopt hist_ignore_dups
#   履歴を共有
setopt share_history
##   履歴をインクリメンタルに追加
setopt inc_append_history
##   開始と終了を記録 (?)
setopt EXTENDED_HISTORY
#--------------------------------------------------------------------------------
# Help
#--------------------------------------------------------------------------------
autoload run-help
HELPDIR=/usr/local/share/zsh/helpfiles

#--------------------------------------------------------------------------------
# プロンプト設定
#--------------------------------------------------------------------------------
PROMPT="%F{39}%  %m@%n%f %{${reset_color}%}%# "
RPROMPT="%F{240}%/%f %{${reset_color}%}"
#--------------------------------------------------------------------------------
# Complement
#--------------------------------------------------------------------------------
# 強力 補完
fpath=(/usr/local/share/zsh-completions/src $fpath)
autoload -U compinit
compinit

# 予測機能
# cdのタイミングで自動的にpushd
setopt auto_pushd
# pushdしたとき、ディレクトリがすでにスタックに含まれていれば追加しない
setopt pushd_ignore_dups
# ディレクトリ名だけでディレクトリの移動する
setopt auto_cd
# 拡張 glob を有効にする `man zshexpn`のFILENAME GENERATION 参照
setopt extended_glob
# 自動修正
setopt correct
setopt cdable_vars
# 補完候補表示時にピープ音を鳴らさない
setopt nolistbeep
# 補完時に大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
#    <TAB>で補完候補を表示したあと、続けて<TAB>を押すと選択できる
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' verbose yes
zstyle ':completion:*' list-colors 'di=36'
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*:messages' format '%F{YELLOW}%d' $DEFAULT
zstyle ':completion:*:warnings' format '%F{RED}No matches for:''%F{YELLOW} %d'$DEFAULT
zstyle ':completion:*:descriptions' format '%F{YELLOW}completing %B%d%b'$DEFAULT
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'$DEFAULT

zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*:manuals' separate-sections true


#--------------------------------------------------------------------------------
# Alias
#--------------------------------------------------------------------------------
# interactive operation...
alias rm='rm -i'
alias cp='cp -i '
alias mv='mv -i'
#
# Default to human readable figures
alias df='df -h'
alias du='du -h'
#
# Misc :)
alias less='less -r'              # raw control characters
alias whence='type -a'            # where, of asort
alias grep='grep --color'         # show differences in color
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias find_word='find . -print0 | xargs -0 grep ' # recursive search word in files
#
# Some shortcuts for different directory listings
alias ll='ls -lG'
alias la='ls -laG'
# Some tools shortcuts
alias g='git'
alias ec='emacsclient'
# extention
alias -s php='emacsclient'
alias -s rb='emacsclient'
alias -s txt=less
alias -s xml=less
#--------------------------------------------------------------------------------
# suffixで自動実行する alias -s
#--------------------------------------------------------------------------------
alias -s rb='ruby'
alias -s sh='bash'
#--------------------------------------------------------------------------------
# Function
#--------------------------------------------------------------------------------
# man 強化版
function zman() {
    PAGER="less -g -s '+/^       "$1"'" man zshall
}
#
# 256色表示できるか確認
function 256colortest() {
    local code
    local n
    echo "\n"
    for code in {0..255}; do
        printf "\e[38;05;${code}m %03d:TEST " $code
        ((n = code % 10))
        if [ $n -eq 0 ]
        then
            printf "\n"
        fi
    done
}
#--------------------------------------------------------------------------------
# Emacs で Zsh を使う設定らしい
#--------------------------------------------------------------------------------
case "$TERM" in
    dumb | emacs )
        PROMPT="$ "
        unsetopt zle
        ;;
esac

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"