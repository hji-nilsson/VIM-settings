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
set cscopeprg=C:\devtools\bin\cscope.exe

set tabstop=2 	 " CPAC
set expandtab 	 " CPAC
set shiftwidth=2 " CPAC
syntax on
set backspace=indent,eol,start
autocmd VimEnter,WinEnter * match Error /\%133v.\+/
autocmd VimEnter,WinEnter * call matchadd("Error", "\\s\\+$")

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
map <F9> :cscope kill 0 <CR> :!cscope -Rb <CR> :cs add .\ <CR>
map <F11> :set number! <CR>
map <F12> :set hls! <CR>
map <S-LeftMouse> <LeftMouse><S-*>
map T :tabnew<CR>

fun! ToggleCC()
  if &cc == ''
    set cc=133
  else
    set cc=
  endif
endfun

nnoremap <F3> :call ToggleCC()<CR>
