"""""""""""""
"  Plugins  "
"""""""""""""

call plug#begin('~/.config/nvim/plugged')

" Plugins
Plug 'vim-scripts/vim-svngutter'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'scrooloose/syntastic'
Plug 'chriskempson/base16-vim'
Plug 'bling/vim-airline'
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf.vim'
Plug 'jamessan/vim-gnupg'
Plug 'rhysd/committia.vim'

" Conditional loading
Plug 'wting/rust.vim',          { 'for':  'rust' }
Plug 'pangloss/vim-javascript', { 'for':  ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx',             { 'for':  ['javascript', 'javascript.jsx'] }
Plug 'aklt/plantuml-syntax',    { 'for': 'plantuml' }
Plug 'scrooloose/nerdtree',     { 'on':  'NERDTreeToggle' }

" Post-install hooks
Plug 'junegunn/fzf',           { 'dir': '~/.fzf', 'do': './install' }
Plug 'Valloric/YouCompleteMe', { 'do': 'python3 install.py --clang-completer --tern-completer --racer-completer' }

" Snippets are separated from the engine. Type :UltiSnipsAddFiletypes <language>
" to add snippets for a given language.
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Add plugins to &runtimepath
call plug#end()


""""""""""""""""""""""
"       Config       "
""""""""""""""""""""""

" Enable syntax highlighting
syntax enable

" Oxeded colourscheme from https://github.com/queyenth/oxeded.vim
" Install by copying .vim colour file into ~/.vim/colors
colorscheme oxeded
let base16colorspace=256

" Use spaces instead of tabs
set expandtab
set smarttab

" Preserve (hide) buffer when exiting a file
set hidden

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Prevents some security exploits
set modelines=0

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 80 characters
set lbr
set tw=80
set formatoptions=qrn1

" Highlight area to the right of 80
let &colorcolumn=join(range(81,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27

" Show invisible characters like spaces
set list
set listchars=tab:>-,trail:.,extends:>,precedes:<

set ai "Auto indent
set si "Smart indent
set nowrap "Wrap lines

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Disable mouse
set mouse=

" No annoying sound on errors
set noerrorbells
set novisualbell
"set noeb vb t_vb=
"set t_vb=
set tm=500

" Always show the status line
set laststatus=2

" Default file types
set ffs=unix,mac,dos

" Set to auto read when a file is changed from the outside
set autoread

" Make help open in new tab
cnoreabbrev <expr> h getcmdtype() == ":" && getcmdline() == 'h' ? 'tab help' : 'h'

" Do not search here
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*/node_modules/*

" JSX highlighting in js files
let g:jsx_ext_required = 0

" :Gbrowse work with work gitlab
let g:fugitive_gitlab_domains = ['http://git.osl.manamind.com']

let g:fzf_layout = { 'window': '-tabnew' }

"""""""""""""""""""
"  YouCompleteMe  "
"""""""""""""""""""
" Disable annoying preview pane at the top
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_rust_src_path = '/usr/local/src/rust/rustc-1.10.0/src'


"""""""""""""""
"  Syntastic  "
"""""""""""""""
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_html_checkers = []
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%{fugitive#statusline()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


"""""""""
"  GPG  "
"""""""""
let g:GPGExecutable = "gpg2"
let g:GPGPreferArmor = 1
let g:GPGPreferSign = 1
let g:GPGDefaultRecipients = "0E25CFCC"


"""""""""""""""
"  UltiSnips  "
"""""""""""""""
let g:UltiSnipsExpandTrigger="<c-space>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" Where does the window to edit snippets open?
let g:UltiSnipsEditSplit="vertical"

" Where are snippets stored?
let g:UltiSnipsSnippetsDir="~/.config/nvim/UltiSnips"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]


""""""""""""""""""
"  Key bindings  "
""""""""""""""""""

" The best hotkey ever
map <c-up> 10k
map <c-down> 10j
map <c-j> 10j
map <c-k> 10k

" Navigate sideways, useful when set nowrap
map <c-right> z10l
map <c-left> z10h
map <c-h> 10h
map <c-l> 10l

" NERDTree
map <c-n> :NERDTreeToggle<CR>

" FZF search git files on C-p
" This ignores stuff like node_modules
map <c-p> :GitFiles<CR>

" Quote: get rid of that stupid goddamned help key that you will invaribly hit
" constantly while aiming for escape
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Disable ex mode
nnoremap Q <Nop>

" Disable ex mode
nnoremap Q :YcmCompleter GoTo<CR>


""""""""""""
"  Leader  "
""""""""""""

" Reassign leader to space
let mapleader = "\<Space>"

" Leader shortcuts
" Quickly save current file
nnoremap <Leader>w :w<CR>


"""""""""""""""
"  Functions  "
"""""""""""""""

" Delete trailing white space
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite * :call DeleteTrailingWS() " Execute whenever anything is written

" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

