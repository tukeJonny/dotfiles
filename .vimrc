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

" Vim initializer
if has('vim_starting')
endif

""" ##### Plug #####
call plug#begin('~/.vim/plugged')
" langs
Plug 'rust-lang/rust.vim'
Plug 'derekwyatt/vim-scala'
Plug 'fatih/vim-go'
Plug 'pearofducks/ansible-vim'

" lint
Plug 'Vimjas/vim-python-pep8-indent'

" jedi-vim
Plug 'davidhalter/jedi-vim', { 'for': ['python', 'python3', 'djangohtml'] }

" vimproc
Plug 'Shougo/vimproc.vim', { 'dir': '~/.vim/plugged/vimproc.vim', 'do': 'make' }

" others
Plug 'Shougo/vimshell.vim'
Plug 'itchyny/lightline.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'racer-rust/vim-racer'
Plug 'flazz/vim-colorschemes'
Plug 'modsound/gips-vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Shougo/neocomplete.vim'
call plug#end()
""" ##### Plug #####

" ###### Python #####
"" jedi-vim

"" PEP8 Lints
let g:syntastic_python_checkers = ['pyflakes', 'pep8']

"" Jedi-Vim
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

""" neocomplete.vim required
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
" let g:neocomplete#force_omni_input_patterns['python'] =
"    \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'

"" Python Settings
augroup Python
  autocmd!
  autocmd FileType python setl autoindent
  autocmd FileType python setl smartindent
        \ cinwords=if,elif,else,for,while,try,except,finally,def,class
  autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
  autocmd FileType python setlocal completeopt-=preview
augroup END

" ##### Rust #####
let g:rustfmt_autosave=1
let g:rustfmt_command = '$HOME/.cargo/bin/rustfmt'

" ##### Vue.js #####
au BufRead,BufNewFile *.vue set ft=html

" ##### Indent Guides #####
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 1
let g:indent_guides_auto_colors = 0
augroup IndentPlugin
  autocmd!
  autocmd IndentPlugin VimEnter,Colorscheme * hi IndentGuidesEven
        \term=bold ctermfg=9 ctermbg=235
  autocmd IndentPlugin VimEnter,Colorscheme * hi IndentGuidesOdd
        \term=bold ctermfg=9 ctermbg=239
augroup END

" ##### NerdTree #####
let NERDTreeShowHidden = 1
autocmd VimEnter * execute 'NERDTree'

filetype plugin indent on
syntax enable "ハイライト
