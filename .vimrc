" VIM (Linux) startup config

" Run pathogen on startup
execute pathogen#infect()

" Close buffer if only NerdTree remains open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Customizing look and behaviour
colorscheme dracula
set ignorecase
set smartcase
set guifont=Courier\ New
set lines=50 columns=200
set splitright
set ruler
set autoindent
set smartindent
set guioptions-=T
set laststatus=2
set cscopeprg=cscope
set rop=type:directx,gamma:1.0,contrast:0.5,level:1,geom:1,renmode:4,taamode:1
syntax on
set backspace=indent,eol,start

" Indentation settings
set tabstop=4
set expandtab
set shiftwidth=4

" Highlight column > 80
autocmd VimEnter,WinEnter * match Error /\%80v.\+/

" Highlight trailing whitespaces
autocmd VimEnter,WinEnter * call matchadd("Error", "\\s\\+$")

" Highlight unwanted tabs
autocmd VimEnter,WinEnter *.c,*.h :match Error /\t/

" NERDTree settings
let NERDTreeQuitOnOpen=1
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1

" Do not use space instead of tabs in makefiles
autocmd FileType make setlocal noexpandtab

" Autowrap git commit message at 72 columns
autocmd Filetype gitcommit setlocal spell textwidth=72

" Set error highlight color
hi Error guibg=purple

" Custom commands
command CleanLineEndings %s/\s\+$//e

" Mapping hotkeys
map <F2> :NERDTreeToggle <CR>
map <F5>a :cs find a <cword><CR>
map <F5>g :cs find g <cword><CR>
map <F5>s :cs find s <cword><CR>
map <F5>c :cs find c <cword><CR>
map <F5>t :cs find t <cword><CR>
map <F5>d :cs find d <cword><CR>
map <F6> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
map <C-F6> :let temp="tab stag ".expand('<cword>')<CR>:exec temp<CR>
map <F9> :cscope kill 0 <CR> :silent !cscope -Rb <CR> :cs add . <CR>
map <C-F9> :silent !ctags -R <CR>
map <F11> :set number! <CR>
map <F12> :set hls! <CR>
map <S-LeftMouse> <LeftMouse><S-*>
map T :tabnew<CR>
inoremap {<CR>  {<CR>}<Esc>O

fun! ToggleCC()
  if &cc == ''
    set cc=80
  else
    set cc=
  endif
endfun

nnoremap <F3> :call ToggleCC()<CR>
