scriptencoding utf-8
syntax on

filetype off
filetype plugin indent off

set nocompatible

" --------
" key maps
" --------
:map! <C-e> <Esc>$a
:map! <C-a> <Esc>^a
:map <C-e> <Esc>$a
:map <C-a> <Esc>^a

" --------------
" basic settings
" --------------
set number		    "行番号を表示
set cursorline		"カーソル行の背景色を変える
set laststatus=2	"ステータス行を常に表示
set cmdheight=2		"メッセージ表示欄を2行確保
set showmatch		  "対応する括弧を表示
set title         "編集中のファイル名を表示

" カーソル移動関連
set backspace=indent,eol,start	"Backspaceキーの影響範囲に制限を設けない
set whichwrap=b,s,h,l,<,>,[,]	  "行頭行末の左右移動で行をまたぐ
set scrolloff=8			            "上下8行の視界を確保
nnoremap J 20j
nnoremap K 20k
nnoremap L 10l
nnoremap H 10h


"ファイル処理関連
set confirm		    "保存されていないファイルがあるときは終了前に保存確認
set hidden		    "保存されていないファイルがあるときでも別のファイルを開くことができる
set autoread		  "外部でファイルが変更された場合は読み込みなおす
set nobackup	  	"ファイル保存時にバックアップファイルを作らない
set noswapfile		"ファイル編集中にスワップファイルを作らない

"タブ/インデントの設定
set expandtab		    "タブ入力を複数の空白入力に置き換える
set tabstop=2	    	"画面上でタブ文字が占める幅
set shiftwidth=2	  "自動インデントでずれる幅
set softtabstop=2 	"連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent		  "改行時に前の行のインデントを継続する
set smartindent		  "改行時に入力された行の末尾に合わせて次の行のインデントを増減する

"検索/置換設定
set hlsearch        "検索文字列をハイライトする
set incsearch       "インクリメントサーチをおこなう
set ignorecase      "大文字と小文字を区別しない
set smartcase       "大文字と小文字が混在した言葉で検索をおこなった場合に限り区別する
set wrapscan        "最後尾まで検索を終えたら次の検索で先頭に映る
set gdefault        "置換の時 g オプションをデフォルトで有効にする

"マウスの入力を受け付ける
set mouse=a        

"windowsでもパスの区切り文字を / にする
set shellslash      

"INSERTモードから抜けると自動的にIMEをオフにする 
set imdisable

"コマンドラインの設定
set wildmenu wildmode=list:longest,full "コマンドラインモードでTABキーによるファイル名補完を有効にする
set history=10000                       "コマンドラインの履歴を10,000件保存する

"ビープ音の設定
set visualbell t_vb= "ビープ音すべてを無効にする
set noerrorbells "エラーメッセージの表示時にビープ音を鳴らさない

" ------------------
" NeoBundle settings
" ------------------
if has('vim_starting')
   " 初回起動時のみruntimepathにneobundleのパスを指定する
   set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" 補完
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

" ファイルをtree表示してくれる
NeoBundle 'scrooloose/nerdtree'
nnoremap <silent><C-e> :NERDTreeToggle<CR>
filetype plugin indent on

" コメントON/OFFを手軽に実行
NeoBundle 'tomtom/tcomment_vim'

" Gitを便利に使う
NeoBundle 'tpope/vim-fugitive'

" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow

" ステータス行に現在のgitブランチを表示する
set statusline+=%{fugitive#statusline()}

" 見た目
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'aereal/vim-colors-japanesque'

" html/CSS入力補完
NeoBundle 'mattn/emmet-vim'
" html5のサポート
NeoBundle 'taichouchou2/html5.vim'
NeoBundle 'hokaccha/vim-html5validator'
" CSS3のサポート
NeoBundle 'hail2u/vim-css3-syntax'
" Javascriptのサポート
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
" Coffee Scriptのサポート
NeoBundle 'kchmck/vim-coffee-script'
" Ruby向けにendを自動挿入してくれる
NeoBundle 'tpope/vim-endwise'
" Rails向けのコマンドを提供する
NeoBundle 'tpope/vim-rails'

" URLを開いたりGoogle検索用
NeoBundle 'open-browser.vim'

" vimからWebAPIを叩く
NeoBundle 'mattn/webapi-vim'

" ブラウザを自動更新するプラグイン(Only Mac)
NeoBundle 'tell-k/vim-browsereload-mac'

"ペースト時の自動インデントOFF
NeoBundle 'ConradIrwin/vim-bracketed-paste' 

call neobundle#end()
filetype plugin indent on
NeoBundleCheck


"colorscheme molokai
highlight Normal ctermbg=none

" -----------------
" syntastic setting
" -----------------

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" -------------------
" neocomplete setting
" -------------------
" ------- PHP -------
let g:neocomplete#sources#dictionary#dictionaries = {
   \ 'default' : '',
   \ 'vimshell' : $HOME.'/.vimshell_hist',
   \ 'php' : $HOME.'/.vim/dictionaries/php.dict',
   \ 'scheme' : $HOME.'/.gosh_completions'
   \ }

" -------------------
"  CUDAプログラムのハイライト設定
" -------------------
au BufNewFile,BufRead *.cu set ft=cuda
au BufNewFile,BufRead *.cuh set ft=cuda
