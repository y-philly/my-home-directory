if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#add('fatih/vim-go')

  call dein#add('houtsnip/vim-emacscommandline')

  call dein#add('junegunn/fzf', { 'merged': 0 })
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf'})

  call dein#add('tomasiser/vim-code-dark')
  call dein#add('tpope/vim-fugitive')

  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if has("win64")
  set shell=cmd.exe
endif

"" basic settings
"
set nobk
set nowrap
set nu
set ve+=block
set ic
set scs
let mapleader = "\<Space>"

"" python path
"
if has("win64")
  let g:python3_host_prog = 'C:\Users\'.$USER.'\scoop\shims\python.exe'
endif

"" deoplete
"
let g:deoplete#enable_at_startup = 1

"" Visual Studio Code like color scheme
"
colorscheme codedark

" airline
"
let g:airline_theme='papercolor'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_powerline_fonts = 1
set laststatus=2

"" FZF
"
let g:fzf_tags_command = 'ctags -R'
nnoremap <silent> <leader>f :Files<cr>
nnoremap <silent> <leader>h :History<cr>
nnoremap <silent> <leader>t :Tags<cr>
nnoremap <C-G> :Rg <C-R>=expand("<cword>")<cr>
