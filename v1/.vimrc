" --------
" key maps
" --------
:map! <C-e> <Esc>$a
:map! <C-a> <Esc>^a
:map <C-e> <Esc>$a
:map <C-a> <Esc>^a

nnoremap J 20j
nnoremap K 20k
nnoremap L 10l
nnoremap H 10h


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
