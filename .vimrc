set enc=utf-8

filetype plugin on

set ambiwidth=double
set number "行番号表示
set showmatch "括弧のマッチング
set autoindent "自動インデント
set smartindent "^Iといううざったいのが表示されるが、自動で右詰めしてくれる
set ruler
syntax on "ハイライト
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
colorscheme hybrid
set t_Co=256

set history=100 "記憶するコマンド数
set showcmd "実行したコマンドを表示

set wildmode=list:longest "コマンドライン保管をシェルと同様に
set magic "正規表現使用時にmagicモードにする
set incsearch "検索してすぐにその単語のところまで飛ぶ

set clipboard=unnamed "クリップボードをOSと連携


if has('vim_starting')
	set nocompatible "Be iMproved

	"Required:
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

"Let NeoBundle manage NeoBundle
"Required
NeoBundleFetch 'Shougo/neobundle.vim'

"My Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'elixir-lang/vim-elixir'
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

"Required
filetype plugin indent on

NeoBundle 'scrooloose/nerdtree'
"隠しファイルをデフォルトで表示させる
let NERDTreeShowHidden = 1
"デフォルトでツリーを表示させる
autocmd VimEnter * execute 'NERDTree'
"If there are uninstalled bundles found on startup,
"this will conveniently prompt you to install them.
NeoBundleCheck

