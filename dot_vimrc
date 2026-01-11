"---------------------
" Encoding
"---------------------
se encoding=utf-8                            " 読み込み時の文字コード
scriptencoding utf-8                          " Vim Script内でマルチバイトを使う場合
set fileencoding=utf-8                        " 保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac                  " 改行コードの自動判別. 左側が優先される

"---------------------
" Row
"---------------------
set number          " 行番号を表示
set cursorline      " カーソル行の背景色を変える
set wrap            " 折返し

"---------------------
" Indent
"---------------------
set expandtab       " タブ入力を複数の空白入力に置き換える
set tabstop=4       " 画面上でタブ文字が占める幅
set shiftwidth=4    " 自動インデントでずれる幅
set autoindent      " 改行時に前の行のインデントを継続する

"---------------------
" Files
"---------------------
set noswapfile      " ファイル編集中にスワップファイルを作らない
set nobackup        " ファイル保存時にバックアップファイルを作らない
set noundofile      " undoファイルを作らない
set confirm         " 保存されていないファイルがあるときは終了前に保存確認
set hidden          " 保存されていないファイルがあるときでも別のファイルを開くことができる
set autoread        " 外部でファイルが変更された場合は読み込みなおす

"---------------------
" Keymaps
"---------------------
" Window
"" split
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w
"" move
nmap <Space> <C-w>w
map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l
"" resize
nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-

"------------
" Vimfiler
"------------
nmap sF :VimFilerBufferDir<Return>
nmap sf :VimFilerExplorer -find<Return>
nmap sb :Unite buffer<Return>
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_enable_auto_cd = 0
let g:vimfiler_tree_leaf_icon = ''
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_marked_file_icon = '✓'




set nocompatible
" Cursor
set backspace=indent,eol,start  "Backspaceキーの影響範囲に制限を設けない
set whichwrap=b,s,h,l,<,>,[,]   "行頭行末の左右移動で行をまたぐ
set scrolloff=8                 "上下8行の視界を確保

" Common Settings
set laststatus=2    "ステータス行を常に表示
set cmdheight=2     "メッセージ表示欄を2行確保
set showmatch       "対応する括弧を表示
set title           "編集中のファイル名を表示

" Search&Replace
set hlsearch        "検索文字列をハイライトする
set incsearch       "インクリメントサーチをおこなう
set ignorecase      "大文字と小文字を区別しない
set smartcase       "大文字と小文字が混在した言葉で検索をおこなった場合に限り区別する
set wrapscan        "最後尾まで検索を終えたら次の検索で先頭に映る
set gdefault        "置換の時 g オプションをデフォルトで有効にする

" Windows
set shellslash
set imdisable

" CommandLine
set wildmenu wildmode=list:longest,full "コマンドラインモードでTABキーによるファイル名補完を有効にする
set history=10000                       "コマンドラインの履歴を10,000件保存する

" Bell
set visualbell t_vb= "ビープ音すべてを無効にする
set noerrorbells "エラーメッセージの表示時にビープ音を鳴らさない




"---------------------
" dein
"---------------------
" Setup
let s:dein_dir = expand('~/.vim')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

" Settings
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#add(s:dein_repo_dir)

  if filereadable(expand('~/.vimrc.dein'))
    source ~/.vimrc.dein
  endif

  call dein#end()
  call dein#save_state()
endif

" If you want to install not installed plugins on startup
if dein#check_install()
  call dein#install()
endif

"----------------------------------------
" Syntax Highlight
" * dein.vimの設定後に実行する必要がある
"----------------------------------------
filetype plugin indent on
syntax enable

"---------------------
" Local Config
"---------------------
if filereadable(expand('~/.vimrc.local'))
    source ~/.vimrc.local
endif

