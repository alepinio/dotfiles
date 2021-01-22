" see ':help defaults'
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim

" load plugins
"set runtimepath^=~/repo/fzf
"set runtimepath^=~/repo/fzf.vim
set runtimepath^=~/dev/vim-plugins/vim-airline
set runtimepath^=~/dev/vim-plugins/vim-better-whitespace

" set colorscheme
colorscheme ron

" draw a vertical line to highlight the character #80 of each line
set colorcolumn=80
highlight ColorColumn ctermbg=Black

" highlight search matches
set hlsearch

" highlight tabs
highlight SpecialKey ctermfg=1
set list
set listchars=tab:T>

" set line numbers in grey and cursor line number in yellow (see
" https://vi.stackexchange.com/a/24914)
highlight LineNr ctermfg=Grey
set cursorline
set cursorlineopt=number
highlight CursorLineNr cterm=bold ctermfg=Yellow

" set tab width to 4 characters
set tabstop=4

" set hybrid line numbers
set number relativenumber

" do case-agnostic search of the input string
set ignorecase

" search exact ocurrences of the input string if it contains at least one
" uppercase character
set smartcase

" use system's clipboard
:set clipboard=unnamedplus

" force saving files that require root permission (see
" https://stackoverflow.com/a/2600852)
cnoremap w!! w !sudo tee > /dev/null %

" set airline
let g:airline_powerline_fonts=1

" Ag command with preview window
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
" ref: https://github.com/junegunn/fzf.vim#advanced-customization
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)

" command Files with preview window (search in the current folder and its
" subdirectories recursively)
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" command GitFiles with preview window (search in the git repo where vim was
" launched taking .gitgnore into account)
command! -bang -nargs=? -complete=dir ProjectFiles
  \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)

" bindings
nmap <C-I> :Ag<CR>
nmap <C-O> :Files<CR>
nmap <C-P> :ProjectFiles<CR>
