" VIM (windows) startup config

" Customizing look and behaviour
colorscheme dracula
set ignorecase
set smartcase
set guifont=Courier\ New
set lines=50 columns=242
set splitright
set ruler
set autoindent
set smartindent
set guioptions-=T
set laststatus=2
set cscopeprg=C:\workspace\bin\cscope\cscope.exe
set rop=type:directx,gamma:1.0,contrast:0.5,level:1,geom:1,renmode:4,taamode:1

set tabstop=4
set expandtab
set shiftwidth=4
syntax on
set backspace=indent,eol,start
autocmd VimEnter,WinEnter * match Error /\%80v.\+/
autocmd VimEnter,WinEnter * call matchadd("Error", "\\s\\+$")

" Filtype specific rules
autocmd FileType make setlocal noexpandtab
autocmd Filetype gitcommit setlocal spell textwidth=72

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
map <F9> :cscope kill 0 <CR> :silent !cscope -Rb <CR> :cs add .\ <CR>
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
