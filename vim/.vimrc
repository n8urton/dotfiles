" #nic vundle setup from https://realpython.com/vim-and-python-a-match-made-in-heaven/

set nocompatible              " required
filetype plugin on            " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
Plugin 'fenetikm/falcon'
Plugin 'godlygeek/csapprox' "make colorschemes work in terminal vim
Plugin 'cocopon/iceberg.vim'
Plugin 'tmhedberg/SimpylFold' "simple code folding
Plugin 'vim-scripts/indentpython.vim' "auto-indent
Plugin 'Valloric/YouCompleteMe' "autocompletion
Plugin 'vim-syntastic/syntastic' "syntax highlighting
Plugin 'nvie/vim-flake8' "pep8 style checker
Plugin 'ErichDonGubler/vim-sublime-monokai'
Plugin 'morhetz/gruvbox'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'Badacadabra/vim-archery'
Plugin 'GertjanReynaert/cobalt2-vim-theme'
Plugin 'junegunn/seoul256.vim'
Plugin 'vim-python/python-syntax'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


"shows relative number lines is visual mode, absolute numbers in insert mode
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
set encoding=utf-8 "utf-8 support
let python_highlight_all=1
syntax on

"toggle nerdtree on/off with ctrl-n
map <C-n> :NERDTreeToggle<CR> 
set laststatus=2 " for powerline status
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " allows nnerdtree to close if last window open
let g:NERDTreeDirArrowExpandable = '→'
let g:NERDTreeDirArrowCollapsible = '↓'

"split navigations
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" set font gvim
set guifont=Inconsolata\ for\ Powerline\ 14

" colorscheme options
set t_Co=256
set background=dark
"let base16colorspace=256
set background=dark
colorscheme gruvbox
let g:gruvbox_italic = '1'
let g:gruvbox_contrast_dark = 'hard'


" Enable code folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za " enable folding with space bar


" PEP8 Indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix


" webdev indentations
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2


" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" YouCompleteMe customization
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

