" Vundle
  set nocompatible              " be iMproved, required
  filetype off                  " required

  " set the runtime path to include Vundle and initialize
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
  " alternatively, pass a path where Vundle should install plugins
  "call vundle#begin('~/some/path/here')

  " let Vundle manage Vundle, required
  Plugin 'VundleVim/Vundle.vim'

  " The following are examples of different formats supported.
  " Keep Plugin commands between vundle#begin/end.
  " plugin on GitHub repo
  "Plugin 'tpope/vim-fugitive'
  " plugin from http://vim-scripts.org/vim/scripts.html
  " Plugin 'L9'
  " Git plugin not hosted on GitHub
  "Plugin 'git://git.wincent.com/command-t.git'
  " git repos on your local machine (i.e. when working on your own plugin)
  "Plugin 'file:///home/gmarik/path/to/plugin'
  " The sparkup vim script is in a subdirectory of this repo called vim.
  " Pass the path to set the runtimepath properly.
  "Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
  " Install L9 and avoid a Naming conflict if you've already installed a
  " different version somewhere else.
  "Plugin 'ascenator/L9', {'name': 'newL9'}
  
  "My plugins
  "
  "vim-colors-solarized
  Plugin 'altercation/vim-colors-solarized'
  "
  "vim-airline
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  "
  "tagbar
  Plugin 'majutsushi/tagbar'
  "
  "indntLine
  Plugin 'Yggdroot/indentLine'
  "
  "nerdcommenter
  Plugin 'scrooloose/nerdcommenter'
  "vim-markdown
  " Plugin markdown
  Plugin 'plasticboy/vim-markdown'
  "vim-signature
  Plugin 'kshenoy/vim-signature'

  "
  " All of your Plugins must be added before the following line
  call vundle#end()            " required
  filetype plugin indent on    " required
  " To ignore plugin indent changes, instead use:
  "filetype plugin on
  "
  " Brief help
  " :PluginList       - lists configured plugins
  " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
  " :PluginSearch foo - searches for foo; append `!` to refresh local cache
  " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
  "
  " see :h vundle for more details or wiki for FAQ
  " Put your non-Plugin stuff after this line

" Options and switches
  " Format
    set fileencoding=utf-8
    set encoding=utf-8
    set backspace=2
    set expandtab
    set tabstop=4
    set shiftwidth=4
    set softtabstop=4
    set ai
    set wrap
    filetype indent on
  " display
    set nu
    set nowrap
    syntax on
  " highlight
    set hls
    set cursorline
    set cursorcolumn
  " flod
    set foldmethod=indent
  " cmd
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
  autocmd VimEnter * TagbarToggle

" ColorMap_Solarized
  syntax enable
  if has( 'gui_running' )
          set background=dark
  else
          set background=dark
  endif
  colorscheme solarized
  let g:solarized_termcolors=  256

" Airline
  let g:airline_theme='kolor'
  let g:airline#extensions#tabline#enabled = 1
  set laststatus=2
  set t_Co=256
  let g:airline_detect_modified=1
  let g:airline_detect_paste=1
  let g:airline_detect_crypt=1
  let g:airline_detect_spell=1
  let g:airline_detect_spelllang=1
  let g:airline_detect_iminsert=0
  " Shortform text for status
    let g:airline_mode_map = {
        \ '__' : '-',
        \ 'n'  : 'N',
        \ 'i'  : 'I',
        \ 'R'  : 'R',
        \ 'c'  : 'C',
        \ 'v'  : 'V',
        \ 'V'  : 'V',
        \ '' : 'V',
        \ 's'  : 'S',
        \ 'S'  : 'S',
        \ '' : 'S',
        \ 't'  : 'T',
        \ }

  " tabline separators
    let g:airline#extensions#tabline#left_sep = '▶'
    let g:airline#extensions#tabline#left_alt_sep = '»'
    let g:airline#extensions#tabline#right_sep = '◀'
    let g:airline#extensions#tabline#right_alt_sep = '«'

    if !exists('g:airline_symbols')
      let g:airline_symbols = {}
    endif
  " unicode symbols
    let g:airline_left_sep = '▶'
    let g:airline_right_sep = '◀'
    let g:airline_symbols.crypt = '🔒'
    let g:airline_symbols.linenr = '☰'
    let g:airline_symbols.maxlinenr = '㏑'
    let g:airline_symbols.branch = '⎇'
    let g:airline_symbols.paste = '∥'
    let g:airline_symbols.spell = 'Ꞩ'
    let g:airline_symbols.notexists = 'Ɇ'
    let g:airline_symbols.whitespace = 'Ξ'
  
" Tagbar
  let g:tagbar_left = 1
  let g:tagbar_autofocus = 1
  let g:tagbar_show_linenumbers = 2
  let g:tagbar_autoshowtag = 1
  let g:tagbar_previewwin_pos = "aboveleft"
  let g:tagbar_autopreview = 1

" indentLine
  let g:indentLine_char = '┆'

" nerdComment
  let g:NERDSpaceDelims = 1

" Maps
  nmap <tab> :bn<cr> "设置tab映射
  nmap <s-tab> :bp<cr> "设置shift+tab映射
  nmap <F9> :TagbarToggle<cr> "设置F9映射

" Other Plugins
" Add support for markdown files in tagbar.
  " Add support for markdown files in tagbar.
  let g:tagbar_type_markdown = {
      \ 'ctagstype': 'markdown',
      \ 'ctagsbin' : '/home/channing/.vim/markdown2ctags/markdown2ctags.py',
      \ 'ctagsargs' : '-f - --sort=yes --sro=»',
      \ 'kinds' : [
          \ 's:sections',
          \ 'i:images'
      \ ],
      \ 'sro' : '»',
      \ 'kind2scope' : {
          \ 's' : 'section',
      \ },
      \ 'sort': 0,
      \ }
