" vim: set sw=4 ts=4 sts=4 et tw=78 foldmarker={,} foldlevel=0 foldmethod=marker foldlevel=0 nomodeline:
" ##################################################################
"
"   si1kdd's VIM Configuration (v0.2)
"
"   Update date: 2020-01-02
"
"   Author:
"       Dav(id) Sullivan <lksstb.scott@gmail.com>
"
" ##################################################################
"

let mapleader = ","

" Syntax highlighting
if has("synatx")
    syntax on
endif

" Load Plugin config
" {
    if filereadable(expand("$HOME/.vimrc.plugins"))
        source $HOME/.vimrc.plugins
    endif
" }

" Neovim: skip host check
" {
    " Default use neovim
    if has('nvim')
        let g:python3_host_skip_check   = 1
        let g:python3_host_prog         = '/usr/bin/python3'

        " Disable python2, ruby provider
        let g:loaded_ruby_provider      = 0
        let g:loader_python_provider    = 0
        let g:ruby_host_skip_check      = 1
        let g:python_host_skip_check    = 1
    endif
" }

" Theme
" {
    if $COLORTERM == 'truecolor'
        set termguicolors
    else
        set term='xterm-256color'
        set t_Co=256
    endif

    " colorscheme fit
" }

" Keymap
" {
    " Map Esc key on VISUAL mode
    vnoremap <Leader>, <ESC><CR>

    " Quick save and unsave leave
    nnoremap <Leader>w :w <CR>
    nnoremap <Leader>q :q <CR>
    nnoremap <Leader>qq :q! <CR>

    " Set F9 to remove trailing spaces
    nnoremap <F9> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
    " nnoremap <F9> :%s/\s+$//e<CR>

    " Set Ctrl-l to clean search history
    nnoremap <slient> <C-l> :nohlsearch <CR><C-l>

    " Set ,ff to find all linkes with keyword under cursor
    nnoremap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr . "[\t"<CR>
" }

" General
" {
    set history=150
    set backspace=indent,eol,start
    set fileformats=unix,dos

    set linespace=0             " No extra spaces between rows
    set hidden                  " Allow buffer switching without save.
    set updatetime=300          " Set a delay update time

" Vim UI {

    " Enable mouse
    set mouse=a
    set mousehide

    set showmode                " Display the current mode
    set tabpagemax=10           " Max tab pages

    " Statusline
    if has('statusline')
        set laststatus=2        " Enable statusline
    endif

    if has('cmdline_info')
        set ruler               " Show ruler
        set showcmd             " show partial command in statuslines
    endif

    augroup numbertoggle
        autocmd!
        autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu | set relativenumber   | endif
        autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu | set norelativenumber | endif
    augroup END
    set number relativenumber   " Set relative number

    " Menu
    set wildmenu                " Show list on menu
    set wildmode=list:longest,full " Comamnd <Tab> completion, list matches, then longest common part

    " Fold
    set nofoldenable            " Default no fold code
    set foldlevel=0
    set foldmarker={,}

    " Scroll
    set scroll=8
    set sidescroll=1
    set scrolljump=5

    " Wrapping
    set nowrap                  " Default don't wrap long lines
    set lazyredraw              " Redraw when we need it

    " List characters
    set list
    set listchars=tab:→\ ,trail:•,extends:⟩,precedes:⟨

    " }

" Search {

    set showmatch               " Show matching brackets/parenthesis
    set incsearch               " Find as you type search
    set hlsearch                " Highligh search terms
    set smartcase               " Case sensitive
    set ignorecase              " Case insensitive search

" }

" }

" Custom functions
" {

    " Change background: ,bg {

    function! ToggleBG()
        let s:tbg = &backgound
        if s:tbg == "dark"
            set background=light
        else
            set background=dark
        endif
    endfunction
    noremap <Leader>bg :call ToggleBG() <CR>

    " }

" }

