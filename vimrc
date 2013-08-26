"------------------------------------
" .vimrc
"------------------------------------
set nocompatible " viとの互換なし
syntax on
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Align : 高機能整形・桁揃えプラグイン
NeoBundle 'Align'

" coffee script
NeoBundle 'kchmck/vim-coffee-script'

" eregex : vimの正規表現をrubyやperlの正規表現な入力でできる
NeoBundle 'eregex.vim'

" fugitive : gitのラッパー
NeoBundle 'tpope/vim-fugitive'

" grep.vim : 外部のgrep利用。:Grepで対話形式でgrep :Rgrepは再帰
NeoBundle 'grep.vim'

" haml : hamlのインデントと色付け
NeoBundle 'tpope/vim-haml'

" minibufexpl : タブエディタ風にバッファ管理ウィンドウを表示
NeoBundle 'minibufexpl.vim'

" molokai : color schema
NeoBundle 'tomasr/molokai'

" NeoComplcache : コード補完
NeoBundle 'Shougo/neocomplcache'

" neosnippet : スニペット補完
NeoBundle 'Shougo/neosnippet'

" NERDTree : ツリー型エクスプローラ
NeoBundle 'The-NERD-tree'

" powerline : ステータスラインをリッチにする
NeoBundle 'Lokaltog/vim-powerline'

" quickrun : 編集中のファイルを簡単に実行できるプラグイン
NeoBundle 'thinca/vim-quickrun'

" rails
NeoBundle 'tpope/vim-rails'

" ruby : VimでRubyを扱う際の最も基本的な拡張機能
NeoBundle 'vim-ruby/vim-ruby'

" surround : テキストを括弧で囲む／削除する
NeoBundle 'tpope/vim-surround'

" tcommnet_vim : コメントアウト
NeoBundle 'tomtom/tcomment_vim'

" unite
NeoBundle 'Shougo/unite.vim'

" vimproc : vimから非同期実行。vimshelleで必要
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \     'windows' : 'make -f make_mingw32.mak',
  \     'cygwin' : 'make -f make_cygwin.mak',
  \     'mac' : 'make -f make_mac.mak',
  \     'unix' : 'make -f make_unix.mak',
  \    },
  \ }

" vimshell
NeoBundle 'Shougo/vimshell.git'

" zencoding
NeoBundle 'mattn/zencoding-vim'

filetype plugin indent on " Required!

" Installation check.
NeoBundleCheck

"------------------------------------
" matchit.vim
"------------------------------------
source $VIMRUNTIME/macros/matchit.vim

"------------------------------------
" Encode
"------------------------------------
set fileformats=unix,dos,mac " 改行コード
set encoding=utf-8 " デフォルトエンコーディング
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc  " ワイルドカードで表示するときに優先度を低くする拡張子

"------------------------------------
" Basic
"------------------------------------
let mapleader="," " <Leader>キー
set scrolloff=5 " スクロール時の余白確保
set textwidth=0 " 自動で折り返しをしない
set autoread " 自動読み直し
set hidden " 編集中でも他のファイルを開けるようにする
set backspace=indent,eol,start "バックスペースキーで削除できるものを指定
"set formatoptions=lmoq "テキスト整形オプション，マルチバイト系を追加
set vb t_vb= " ビープ音を鳴らさない
set browsedir=buffer " Exploreの初期ディレクトリ
set whichwrap=b,s,h,l,<,>,[,] " カーソルを行頭、行末で止まらないようにする
set showcmd " コマンドをステータス行に表示
set showmode " 現在のモードを表示
set modelines=0 " モードラインは無効

"------------------------------------
" Show
"------------------------------------
set notitle " タイトルを表示させない
set ruler " ルーラーを表示
set laststatus=2 " 常にステータラスラインを表示
set showmatch " 対応する括弧をハイライト
set nonumber " 行番号非表示
set list " 不可視文字表示
set listchars=tab:>\ ,extends:<
" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=red guibg=darkgray
match ZenkakuSpace /　/
set cursorline " カーソル行をハイライト
set ttyfast " 高速ターミナル接続を行う

"------------------------------------
" Color
"------------------------------------
syntax enable " ハイライト on
colorscheme molokai " colorscheme

if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
endif

"------------------------------------
" Clipboard
"------------------------------------
"set clipboard=unnamed " コピーしたものがレジスタにも入るようにする
"set clipboard=autoselect " ビジュアルモードで選択したテキストが、クリップボードに入るようにする
set clipboard+=autoselect,unnamed " clipboard

"------------------------------------
" Backup
"------------------------------------
set nobackup " バックアップなし
set noswapfile " スワップファイルを作らない

"------------------------------------
" Indentation
"------------------------------------
set autoindent " 自動でインデント
set smartindent " 新しい行のインデントを現在行と同じ数に
"set smarttab

if has("autocmd")
  autocmd FileType * set formatoptions-=ro " 改行時にコメントしない

  " expandtab = et タブ文字を空白に展開する
  " tabstop = ts ファイル内の <Tab> が対応する空白の数
  " softtabstop = sts タブキーを押したときに挿入される空白の量
  " shiftwidth = sw 自動インデントの各段階に使われる空白の数

  autocmd FileType php        setlocal ts=2 sts=2 sw=2 noexpandtab
  autocmd FileType c          setlocal ts=4 sw=4 noexpandtab cindent
  autocmd FileType java       setlocal ts=4 sts=4 sw=4 et
  autocmd FileType sh         setlocal ts=2 sts=2 sw=2 et
  autocmd FileType sql        setlocal ts=2 sts=2 sw=2 et
  autocmd FileType scss       setlocal ts=2 sts=2 sw=2 et
  autocmd FileType coffee     setlocal ts=2 sts=2 sw=2 et nowrap
  autocmd FileType html,xhtml,css,javascript      setlocal ts=2 sts=2 sw=2 et

  autocmd BufNewFile,BufRead *.html  setlocal ft=xhtml
  autocmd BufNewFile,BufRead *.scss  setlocal ft=scss
  autocmd BufRead,BufNewFile *.coffee setlocal ft=coffee
  autocmd BufNewFile,BufRead *.sass  setfiletype sass

  " for rails
  autocmd BufNewFile,BufRead app/*/*.erb    setlocal ft=eruby fenc=utf-8
  autocmd BufNewFile,BufRead app/**/*.rb    setlocal ft=ruby  fenc=utf-8
  autocmd BufNewFile,BufRead app/**/*.yml   setlocal ft=ruby  fenc=utf-8
  autocmd FileType ruby,haml,eruby,sass,cucumber,mason setlocal ts=2 sts=2 sw=2 et nowrap

  "autocmd BufWritePost *.coffee silent CoffeeMake! -cb | cwindow | redraw!
endif

"------------------------------------
" Search
"------------------------------------
set incsearch " インクリメンタルサーチ
set ignorecase " 大文字小文字無視
set smartcase " 大文字は区別する
set hlsearch " 検索文字をハイライト
nmap \q :nohlsearch<CR>

"------------------------------------
" NeoComplcache
"------------------------------------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
  \ 'default' : ''
  \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

"------------------------------------
" Buffer
"------------------------------------
noremap <Space> :bn!<CR>
noremap <S-Space> :bp!<CR>
:com! Kwbd let kwbd_bn= bufnr("%")|enew|exe "bdel ".kwbd_bn|unlet kwbd_bn " ウィンドウレイアウトを崩さないでバッファを閉じる

"------------------------------------
" Window
"------------------------------------
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sH <C-w>H
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L

" height
nnoremap + <C-w>+
nnoremap - <C-w>-
" width
nnoremap ) <C-w>>
nnoremap ( <C-w><LT>

"------------------------------------
" Other
"------------------------------------
nnoremap <silent><Space>j :Explore<CR> " ファイラー起動

" .vimrcや.gvimrcを編集するためのKey-mappingを定義する
nnoremap <silent> <Space>ev  :<C-u>edit $MYVIMRC<CR>
nnoremap <silent> <Space>eg  :<C-u>edit $MYGVIMRC<CR>

" insert mode での移動
inoremap  <C-e> <END>
inoremap  <C-a> <HOME>
" インサートモードでもhjklで移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
" インサートモードのjjでEsc
inoremap <silent> jj <ESC>
inoremap <silent> <C-j> <esc>

" 0, 9で行頭、行末へ
nmap 0 ^
nmap 9 $

" ビジュアルモード時vで行末まで選択
vnoremap v $h

"autocmd BufWritePre * :%s/\s\+$//ge " 保存時に行末の空白を除去する

"------------------------------------
" php setting
"------------------------------------
let php_sql_query = 1 " SQLをハイライトする
let php_htmlInStrings = 1 " HTMLをハイライト
let php_noShortTags = 1 " ショートタグ「< ?」はハイライトしないようにする
"let php_folding = 1 " クラスと関数の折りたたむ

"------------------------------------
" Align
"------------------------------------
" Alignを日本語環境で使用するための設定
let g:Align_xstrlen = 3

"------------------------------------
" NERDTree
"------------------------------------
nmap <Leader>e :NERDTreeToggle<CR>

"------------------------------------
" neosnippet
"------------------------------------
" Plugin key-mappings.
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/dotfiles/.vim/snippets'

" ------------------------------------
" grep.vim
"------------------------------------
" 検索外のディレクトリ、ファイルパターン
let Grep_Skip_Dirs = '.svn .git'
let Grep_Skip_Files = '*.bak *~'

"------------------------------------
" MiniBufExplorer
"------------------------------------
" 表示トグル
nnoremap <Leader>mi :TMiniBufExplorer<CR>
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBuffs = 1

"------------------------------------
" quickrun.vim
"------------------------------------
" 初期化
let g:quickrun_config = {}
" runnerにvimprocを設定
let g:quickrun_config._ = {'runner' : 'vimproc'}
let g:quickrun_config._ = {'runner/vimproc/updatetime' : 100}
" 横分割をするようにする
let g:quickrun_config={'*': {'split': ''}}
" 横分割時は下へ､ 縦分割時は右へ新しいウィンドウが開くようにする
set splitbelow
set splitright

" PHPUnit
augroup PHPUnitQuickRun
  autocmd!
  autocmd BufWinEnter,BufNewFile *test.php set filetype=phpunit
augroup END

let g:quickrun_config['phpunit'] = {}
let g:quickrun_config['phpunit']['outputter/buffer/split'] = 'vertical 35'
let g:quickrun_config['phpunit']['command'] = 'phpunit'
let g:quickrun_config['phpunit']['cmdopt'] = ''
let g:quickrun_config['phpunit']['exec'] = '%c %o %s'
let g:quickrun_config['phpunit']['output_filetype'] = 'phpunit-result'

" RSpec
let g:quickrun_config['rspec'] = {}
let g:quickrun_config['rspec']['outputter/buffer/split'] = 'vertical 35'
"let g:quickrun_config['rspec']['output_filetype'] = 'rspec-result'

" bundleを利用する設定(railsで実行)
let g:quickrun_config['rspec/bundle'] = {
  \ 'type': 'rspec/bundle',
  \ 'command': 'rspec',
  \ 'cmdopt': "-l %{line('.')}",
  \ 'exec': 'bundle exec %c %s',
  \ 'outputter/buffer/filetype': 'rspec-result'
  \}

" 通常の設定(rubyで実行)
let g:quickrun_config['rspec/normal'] = {
  \ 'type': 'rspec/normal',
  \ 'command': 'rspec',
  \ 'cmdopt': "-l %{line('.')}",
  \ 'exec': '%c %s',
  \ 'outputter/buffer/filetype': 'rspec-result'
  \}

function! RSpecQuickrun()
  let b:quickrun_config = {'type' : 'rspec/bundle'}
endfunction
autocmd BufReadPost *_spec.rb call RSpecQuickrun()

" CoffeeScript
"let g:quickrun_config.coffee = {'command': 'coffee'}

" reference
" http://subtech.g.hatena.ne.jp/cho45/20061010/1160459376
" http://vim.wikia.com/wiki/Mac_OS_X_clipboard_sharing
"
" need 'set enc=utf-8' and
" below shell environment variable for UTF-8 characters
" export __CF_USER_TEXT_ENCODING='0x1F5:0x08000100:14'
"
" Vim(Mac)
if has('mac') && !has('gui')
  nnoremap <silent> <Space>y :.w !pbcopy<CR><CR>
  vnoremap <silent> <Space>y :w !pbcopy<CR><CR>
  nnoremap <silent> <Space>p :r !pbpaste<CR>
  vnoremap <silent> <Space>p :r !pbpaste<CR>
" GVim(Mac & Win)
else
  noremap <Space>y "+y
  noremap <Space>p "+p
endif

"------------------------------------
" unite.vim
"------------------------------------
" The prefix key.
nnoremap    [unite]   <Nop>
nmap    <Leader>f [unite]

" バッファ一覧
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" ブックマーク一覧
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
" 最近使ったファイルの一覧
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
" 最近使ったファイルとバッファ
nnoremap <silent> [unite]u :<C-u>Unite buffer file_mru<CR>
" レジスタ一覧
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
" 全部
nnoremap <silent> [unite]a :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
