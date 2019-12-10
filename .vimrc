" VIM (Linux) startup config

" ***Set path***
set path +=**
set wildignore+=**/test/** " Unique per repo
set wildmenu " Enable fuzzy tab menu
set complete-=i " Don't use autocomplete on includes

" ***Run pathogen on startup***
execute pathogen#infect()

" ***Configure cscope***
set cscopeprg=cscope
autocmd VimEnter * cs add .

" ***Customizing look and behaviour***
" Timeout for waiting for complete key-codes from terminal.
" timeoutlen is used for command line and <Leader> maps
" ttimeoutlen is for normal editing
set timeout timeoutlen=500 ttimeout ttimeoutlen=20

" set xterm cursor 'color' to value "XtDefaultBackground"
silent !echo -en '\e]12;XtDefaultBackground\a'

" Cursor settings:
"  1 -> blinking block
"  2 -> solid block
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar

" make cursor blink upon startup
silent !echo -en '\e[1 q'
" Set cursor to blinking block on insert exit
let &t_EI="\<Esc>[1 q"
" Set cursor to blinking underscore on insert entry
let &t_SI="\<Esc>[5 q"

set ignorecase
set smartcase
set splitright
set splitbelow
set ruler
set autoindent
set smartindent
set laststatus=2
set tabstop=4
set expandtab
set shiftwidth=4
set backspace=indent,eol,start
set number
syntax on
colorscheme desert

" Change error highligt color
" hi Error cTermFg=black
" hi Error cTermBg=lightred

" Special formatting settings
augroup local_settings
    " Clear group to avoid duplicates
    autocmd!
    " Use tabs instead of spaces in makefiles
    autocmd FileType make setlocal noexpandtab
    " Enable spell check and wrap text on 72 characters for commit messages
    autocmd Filetype gitcommit setlocal spell textwidth=72
augroup END

" Highlight formatting errors
augroup hi_format_errors
    " Clear group to avoid duplicates
    autocmd!
    " Reset matches for error highlight
    autocmd BufNewFile,BufRead * call clearmatches()
    " Highlight lines longer than 120 characters for c/h files
    autocmd BufNewFile,BufRead *.c,*.h match Error /\%121v.\+/
    " Highlight lines longer than 79 characters for python file
    autocmd BufNewFile,BufRead *.py match Error /\%80v.\+/
    " Highlight trailing white space
    autocmd VimEnter,WinEnter * call matchadd("Error", "\\s\\+$")
augroup END

" Close buffer if only NerdTree remains open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ***Custom commands***
" Quick command to remove all trailing white spaces
if exists(':CleanLineEndings')
    command CleanLineEndings %s/\s\+$//e
    endif

" ***Mapping hotkeys***
" Remap to better suite nordic keyboard layout
map <C-g> <C-]> " Follow tag

" Navigation and tags
map <F2> :NERDTreeToggle <CR>
map <F5>a :cs find a <cword><CR>
map <F5>g :cs find g <cword><CR>
map <F5>s :cs find s <cword><CR>
map <F5>c :cs find c <cword><CR>
map <F5>t :cs find t <cword><CR>
map <F5>d :cs find d <cword><CR>
map <F6> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
map <C-F6> :let temp="tab stag ".expand('<cword>')<CR>:exec temp<CR>
map <F9> :cscope kill 0 <CR> :silent !cscope -Rb <CR> :cs add . <CR> :redraw! <CR>
map <C-F9> :silent !ctags -R <CR> :redraw! <CR>
map T :tabnew<CR>
map <S-LeftMouse> <LeftMouse><S-*>
inoremap {<CR>  {<CR>}<Esc>O

" Toggle visual queues
map <C-F11> :set number! <CR>
map <S-F11> :set relativenumber! <CR>
map <F12> :set hls! <CR>
nnoremap <F3> :call ToggleCC()<CR>

" ***Helper functions***
" Function to toggle colorcolumn
fun! ToggleCC()
  if &cc == ''
    set cc=121
  else
    set cc=
  endif
endfun

