scriptencoding utf-8
syntax on

filetype off
filetype plugin indent off

set nocompatible

" Cursor
set backspace=indent,eol,start  "Backspaceキーの影響範囲に制限を設けない
set whichwrap=b,s,h,l,<,>,[,]   "行頭行末の左右移動で行をまたぐ
set scrolloff=8                 "上下8行の視界を確保

" Common Settings
set number          "行番号を表示
set cursorline      "カーソル行の背景色を変える
set laststatus=2    "ステータス行を常に表示
set cmdheight=2     "メッセージ表示欄を2行確保
set showmatch       "対応する括弧を表示
set title           "編集中のファイル名を表示

" Files
set confirm         "保存されていないファイルがあるときは終了前に保存確認
set hidden          "保存されていないファイルがあるときでも別のファイルを開くことができる
set autoread        "外部でファイルが変更された場合は読み込みなおす
set nobackup        "ファイル保存時にバックアップファイルを作らない
set noswapfile      "ファイル編集中にスワップファイルを作らない

" Tab&Indent
set expandtab       "タブ入力を複数の空白入力に置き換える
set tabstop=2       "画面上でタブ文字が占める幅
set shiftwidth=2    "自動インデントでずれる幅
set softtabstop=2   "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent      "改行時に前の行のインデントを継続する
set smartindent     "改行時に入力された行の末尾に合わせて次の行のインデントを増減する

" Search&Replace
set hlsearch        "検索文字列をハイライトする
set incsearch       "インクリメントサーチをおこなう
set ignorecase      "大文字と小文字を区別しない
set smartcase       "大文字と小文字が混在した言葉で検索をおこなった場合に限り区別する
set wrapscan        "最後尾まで検索を終えたら次の検索で先頭に映る
set gdefault        "置換の時 g オプションをデフォルトで有効にする

" Mouse
set mouse=a

" Windows
set shellslash
set imdisable

" CommandLine
set wildmenu wildmode=list:longest,full "コマンドラインモードでTABキーによるファイル名補完を有効にする
set history=10000                       "コマンドラインの履歴を10,000件保存する

" Bell
set visualbell t_vb= "ビープ音すべてを無効にする
set noerrorbells "エラーメッセージの表示時にビープ音を鳴らさない

" ========
" dein.vim
" ========
if &compatible
    set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.vim')
    call dein#begin('~/.vim')

    " Let dein manage dein
    " Required:
    call dein#add('~/.vim/repos/github.com/Shougo/dein.vim')

    " Add or remove your plugins here like this:
    if filereadable(expand('~/.vimrc.dein'))
        source ~/.vimrc.dein
    endif

    " Required:
    call dein#end()
    call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
filetype plugin indent on
if dein#check_install()
    call dein#install()
endif

" ============
" local config
" ============
if filereadable(expand('~/.vimrc.local'))
    source ~/.vimrc.local
endif
