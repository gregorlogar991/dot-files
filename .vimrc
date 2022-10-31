syntax on
set number
set autoindent
set noshowmode
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif
call plug#begin('~/.vim/plugged')
"Plug 'ghifarit53/tokyonight-vim'
Plug 'tpope/vim-commentary' "gcc for normal mode, gc for visual
"Plug 'sheerun/vim-polyglot'
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-css-color'
Plug 'tomasiser/vim-code-dark'
call plug#end()

"Tokyonight configuration
set termguicolors
let g:tokyonight_style = 'night' 
"let g:tokyonight_enable_italic = 1
colorscheme codedark
noremap <C-N><C-N> :set invnumber<CR>
inoremap <C-N><C-N> <C-O>:set invnumber<CR>
