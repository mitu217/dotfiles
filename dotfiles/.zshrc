export PATH="$HOME/.rbenv/bin:$PATH"
export PATH=$HOME/.nodebrew/current/bin:$PATH

### load rbenv
if which rbenv > /dev/null; then 
  eval "$(rbenv init - zsh)"; 
fi

# エディタをVimに設定
export EDITOR=vim 
# 文字コードをUTF-8に設定
export LANG=ja_JP.UTF-8 
# KCODEにUTF-8を設定
export KCODE=u
# autotestでfeatureを動かす
export AUTOFEATURE=true

# ビープ音を鳴らさないようにする
setopt no_beep
# ディレクトリ名の入力のみで移動する
setopt auto_cd       
# cd時にディレクトリスタックにpushdする
setopt auto_pushd   
# コマンドのスペルを訂正する 
setopt correct      
# =以降も補完する(--prefix=/usrなど)
setopt magic_equal_subst
# プロンプト定義内で変数置換やコマンド置換を扱う
setopt prompt_subst 
# バックグラウンドジョブの状態変化を即時報告する    
setopt notify       
# =commandを`which command`と同じ処理にする
setopt equals      

### alias ###
alias ls="ls -GF"
alias gls="gls --color"

### 補完用 ###
autoload -U compinit
compinit
setopt auto_pushd
setopt pushd_ignore_dups
setopt correct

### 補完機能用 ###
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # ignore case
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*' list-separator '-'

zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''

### カラー設定 ###

### 右プロンプト設定 ###
# %F{～}は色指定、%fでリセット
# %nはログインユーザ名、%~はカレントディレクトリ
# "%(?..%F{red}-%?-)" は終了コードが0以外なら赤色で表示
# "%1(v|%F{yellow}%1v%F{green} |)" の部分がVCS情報 (psvarの長さが1以上なら黄色で表示)
RPROMPT="%(?..%F{red}-%?-)%F{cyan}[%1(v|%F{yellow}%1v%F{cyan} |)%n:%~]%f"

#gitブランチ名表示
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats '%c%u%b'
zstyle ':vcs_info:git:*' actionformats '%c%u%b|%a'

#カレントディレクトリ/コマンド記録
local _cmd=''
local _lastdir=''
preexec() {
  _cmd="$1"
  _lastdir="$PWD"
}

#git情報更新
update_vcs_info() {
  psvar=()
  LANG=en_US.UTF-8 vcs_info
  [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
#カレントディレクトリ変更時/git関連コマンド実行時に情報更新
precmd() {
  _r=$?
  case "${_cmd}" in
    git*|stg*) update_vcs_info ;;
    *) [ "${_lastdir}" != "$PWD" ] && update_vcs_info ;;
  esac
  return $_r
}
