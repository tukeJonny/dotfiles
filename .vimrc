set enc=utf-8

filetype plugin on

set ambiwidth=double
set number "行番号表示
set showmatch "括弧のマッチング
set autoindent "自動インデント
set smartindent "^Iといううざったいのが表示されるが、自動で右詰めしてくれる
set ruler
set cmdheight=1 "コマンドラインの高さ
set ignorecase "検索文字列が小文字のみの場合、大文字、小文字を区別しない
set smartcase "検索文字列に大文字が含まれていると、大文字・小文字を区別する
set hlsearch "検索ワードをハイライトする
set tabstop=2 "タブ幅
set shiftwidth=2 "インデント幅
set laststatus=2 "常にステータス行を表示
set statusline=%F%m%r%h%w\ [format=%{&ff}]\ [type=%Y]\ [ascii=\%03.3b]\ [hex=\%04B]\ [position=(%04l,%04v)][%p%%]\ [length=%L]
set history=100 "記憶するコマンド数
set list "タブを表示行末に$がくっつく
set wrap
set wrapscan
set background=dark
set t_Co=256
set expandtab
set history=100 "記憶するコマンド数
set showcmd "実行したコマンドを表示

set wildmode=list:longest "コマンドライン保管をシェルと同様に
set magic "正規表現使用時にmagicモードにする
set incsearch "検索してすぐにその単語のところまで飛ぶ

set clipboard=unnamed "クリップボードをOSと連携

autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4

augroup MyAutoGroup
  autocmd!
augroup END

if has('vim_starting')
	set nocompatible "Be iMproved

	"Required:
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

"Required
NeoBundleFetch 'Shougo/neobundle.vim'

let g:rustfmt_autosave=1
let g:rustfmt_command = '$HOME/.cargo/bin/rustfmt'

"Vue.js
au BufRead,BufNewFile *.vue set ft=html

"My Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Vimjas/vim-python-pep8-indent'
NeoBundleLazy "davidhalter/jedi-vim", {
    \ "autoload": { "filetypes": [ "python", "python3", "djangohtml"] }}
NeoBundleLazy "davidhalter/jedi-vim", {
    \ "autoload": { "filetypes": [ "python", "python3", "djangohtml"] }}

if ! empty(neobundle#get("jedi-vim"))
  let g:jedi#auto_initialization = 1
  let g:jedi#auto_vim_configuration = 1

  nnoremap [jedi] <Nop>
  xnoremap [jedi] <Nop>
  nmap <Leader>j [jedi]
  xmap <Leader>j [jedi]

  let g:jedi#completions_command = "<C-N>"
  let g:jedi#goto_assignments_command = "[jedi]g"
  let g:jedi#goto_definitions_command = "[jedi]d"
  let g:jedi#documentation_command = "[jedi]K"
  let g:jedi#rename_command = "[jedi]r"
  let g:jedi#usages_command = "[jedi]n"
  let g:jedi#popup_select_first = 0
  let g:jedi#popup_on_dot = 0

  autocmd FileType python setlocal completeopt-=preview

  if ! empty(neobundle#get("neocomplete.vim"))
    autocmd FileType python setlocal omnifunc=jedi#completions
    let g:jedi#completions_enabled = 0
    let g:jedi#auto_vim_configuration = 0
    let g:neocomplete#force_omni_input_patterns.python =
    \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
  endif
endif
NeoBundle "nathanaelkane/vim-indent-guides"
if ! empty(neobundle#get("vim-indent-guides"))
  let g:indent_guides_enable_on_vim_startup = 1
  let g:indent_guides_start_level = 1
  let g:indent_guides_auto_colors = 0
  autocmd MyAutoGroup VimEnter,Colorscheme * hi IndentGuidesEven term=bold ctermfg=9 ctermbg=235
  autocmd MyAutoGroup VimEnter,Colorscheme * hi IndentGuidesOdd term=bold ctermfg=9 ctermbg=239
endif
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'rust-lang/rust.vim'
NeoBundle 'racer-rust/vim-racer'
NeoBundle 'feith/vim-go'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'Shougo/vimproc.vim', {
			\ 'build' : {
			\			'windows' : 'tools\\update-dll-mingw',
			\			'cygwin'  : 'make -f make_cygwin.mak',
			\			'mac'     : 'make -f make_mac.mak',
			\			'linux'   : 'make',
			\			'unix'    : 'gmake',
			\},
\ }
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'modsound/gips-vim'

"You can specify revision/branch/tag.

call neobundle#end()
"隠しファイルをデフォルトで表示させる
let NERDTreeShowHidden = 1
"デフォルトでツリーを表示させる
autocmd VimEnter * execute 'NERDTree'
"If there are uninstalled bundles found on startup,
"this will conveniently prompt you to install them.
NeoBundleCheck

filetype plugin indent on
syntax on "ハイライト
