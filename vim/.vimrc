scriptencoding utf-8
set encoding=utf-8

" Autoload vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" Editing
Plug 'tpope/vim-sensible'  " Set a bunch of good vim defaults
Plug 'tpope/vim-surround'  " add, change, or remove surrounding parens/brackets/quotes/tags
Plug 'tpope/vim-repeat'  " Allow . opperator to allow repeat plugin actions
Plug 'tpope/vim-unimpaired'  " Mappings for line moves (e.g. [e ]e [space ]space)
Plug 'tpope/vim-commentary'  " Use gcc or gc[motion] to comment lines
Plug 'suy/vim-context-commentstring'  " change gcc comment to // in <script> tags
Plug 'andrewradev/splitjoin.vim'  "gS and gJ for smart spliting and joining of lines
Plug 'AndrewRadev/sideways.vim'  "[, and ], for moving comma separated arguments left and right

" Visuals
"Plug 'airblade/vim-gitgutter'  " Git line-modified symbols in the gutter
Plug 'itchyny/lightline.vim'  " Pretty Status Bar
Plug 'sainnhe/gruvbox-material'  " Colorscheme
Plug 'chrisbra/colorizer'  " Highlight HEX Color Codes
Plug 'pangloss/vim-javascript'  " Javascript Syntax Highlighting
Plug 'posva/vim-vue'  " Vue Syntax Highlighting

" Utils
Plug 'tpope/vim-fugitive'  " Git Integration
Plug 'tpope/vim-obsession'  " Session Management
Plug 'dhruvasagar/vim-prosession'  " Add-on to Obsession to autoload Session files
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'  " Fast Fuzzy Finder
Plug 'ptzz/lf.vim'  " lf Termenal File Manager (ranger replacement)
Plug 'voldikss/vim-floaterm'  " lf.vim dependency (must come after)
Plug 'dense-analysis/ale'  " Real time linter

" LSP
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/async.vim'  " vim-lsp dependency
Plug 'prabirshrestha/vim-lsp'  " Language Server Protocol
Plug 'mattn/vim-lsp-settings'  " Add :LspInstallServer command
call plug#end()


" Configure terminal colors for gruvbox
if has('termguicolors')
  set termguicolors
endif

" Tell vim terminal escape codes for switching to italic
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
"https://github.com/sainnhe/gruvbox-material/issues/5

let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_colors_override = {
\ 'bg0':              ['#282828',   '235'],
\ 'bg1':              ['#32302f',   '236'],
\ 'bg2':              ['#32302f',   '236'],
\ 'bg3':              ['#45403d',   '237'],
\ 'bg4':              ['#45403d',   '237'],
\ 'bg5':              ['#5a524c',   '239'],
\ 'bg_statusline1':   ['#32302f',   '236'],
\ 'bg_statusline2':   ['#3a3735',   '236'],
\ 'bg_statusline3':   ['#504945',   '240'],
\ 'bg_diff_green':    ['#34381b',   '22'],
\ 'bg_visual_green':  ['#3b4439',   '22'],
\ 'bg_diff_red':      ['#402120',   '52'],
\ 'bg_visual_red':    ['#4c3432',   '52'],
\ 'bg_diff_blue':     ['#0e363e',   '17'],
\ 'bg_visual_blue':   ['#374141',   '17'],
\ 'bg_visual_yellow': ['#4f422e',   '94'],
\ 'bg_current_word':  ['#3c3836',   '237'],
\ 'fg0':              ['#d4be98',   '223'],
\ 'fg1':              ['#ddc7a1',   '223'],
\ 'red':              ['#ea6962',   '167'],
\ 'orange':           ['#e78a4e',   '208'],
\ 'yellow':           ['#d8a657',   '214'],
\ 'green':            ['#a9b665',   '142'],
\ 'aqua':             ['#89b482',   '108'],
\ 'blue':             ['#7daea3',   '109'],
\ 'purple':           ['#d3869b',   '175'],
\ 'bg_red':           ['#ea6962',   '167'],
\ 'bg_green':         ['#a9b665',   '142'],
\ 'bg_yellow':        ['#d8a657',   '214'],
\ 'grey0':            ['#7c6f64',   '243'],
\ 'grey1':            ['#928374',   '245'],
\ 'grey2':            ['#a89984',   '246'],
\ 'none':             ['NONE',      'NONE']
\ }

function! s:gruvbox_material_custom() abort
  " See `colors/gruvbox-material.vim` for predefined highlight groups.

  let l:palette = gruvbox_material#get_palette('medium', 'material', {})
  " let l:palette = g:gruvbox_material_palette

  " Highlight Params
  "  (name, foreground, background, UI highlighting)
  call gruvbox_material#highlight('LineNr', l:palette.grey0, l:palette.bg1)
  call gruvbox_material#highlight('SignColumn', l:palette.fg0, l:palette.bg0)
  call gruvbox_material#highlight('VertSplit', l:palette.bg4, l:palette.none)
  call gruvbox_material#highlight('ColorColumn', l:palette.none, l:palette.bg5)
endfunction

augroup GruvboxMaterialCustom
  autocmd!
  autocmd ColorScheme gruvbox-material call s:gruvbox_material_custom()
augroup END

colorscheme gruvbox-material


set background=dark
set mouse=a  " Enable mouse support
set ignorecase  " Case insensitive searching
set smartcase  " Case sensitive when search term has a capital
set number  " Show current line number
"set relativenumber  " Relative line numbers
set numberwidth=1  " Min width of line number column
set noshowmode  " Hide '-- Insert --' from the command line
set backspace=2  " Make <backspace> behave normally in insert mode
set listchars=tab:▸\ ,trail:·,extends:>,precedes:<,nbsp:+

set list  " Show Tab Characters
set expandtab  " <Tab> key inserts spaces
set softtabstop=2  " Num space <Tab> key inserts
set shiftwidth=2  " Num spaces auto-indent uses
set tabstop=4  " Num spaces tab characters display as

set hidden  " Allow changing buffers without saving
set noswapfile  " Disable Swap Files
autocmd! FocusGained,BufEnter * checktime  " trigger autoread on window focus and buffer entry

if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif
set undodir=~/.vim/undo-dir
set undofile

set gdefault  " invert the meaning of the /g regex flag (global by default)

" Splits
set splitbelow  " Open new horizontal splits below
set splitright  " Open new vertical splits to the right
set diffopt+=vertical  " Open diffs in vertical splits
set diffopt+=iwhiteall  " Ignore whitespace in diffs
set fillchars+=vert:▕  " Set vertical split character

" Set colors of vertical split bar
highlight VertSplit ctermbg=0 ctermfg=236

" Set gutter (sign column) background
highlight SignColumn ctermbg=236

" Set Line Number Colors
highlight LineNr ctermbg=236 ctermfg=243

" Set colors of matching paren
highlight MatchParen ctermbg=237 ctermfg=1

" Highlight the 101st column (reminder to keep lines short, because if they are very long it hurts readability)
highlight ColorColumn ctermbg=239
call matchadd('ColorColumn', '\%101v', 100)

" shell cterm color picker:
" for i in {0..255} ; do
"   printf "\x1b[48;5;%sm%3d\e[0m " "$i" "$i"
"   if (( i == 15 )) || (( i > 15 )) && (( (i-15) % 6 == 0 )); then
"     printf "\n";
"   fi
" done

" Different cursors for insert and replace modes
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"


"" Mappings

" Mode Mapping Commands ('nore' means non-recursive)
"   [nore]map  normal, visual, select, operator-pending
"  n[nore]map  normal
"  v[nore]map  visual, select
"  x[nore]map  visual
"  s[nore]map  select
"  o[nore]map  operator-pending
"   [nore]map! insert, command-line
"  i[nore]map  insert
"  c[nore]map  command-line
"
" Since there are no advantages to having a mapleader, hard code <leader> as <space>

" Increase timeout for leader commands
set timeoutlen=1400

" Disable Space moving cursor right in normal mode
nnoremap <space> <NOP>

" Mapping to toggle auto indent when pasting text
" set pastetoggle=<space>p

" Swap semicolon and colon in normal mode
" noremap ; :
" noremap : ;

" Make Y work as expected (like D and C)
nnoremap Y y$

" Make 'Enter' insert a new line and move cursor to it, leave command mode
" and quickfix 'Enter' alone
nnoremap <CR> o<Esc>
:autocmd CmdwinEnter * nnoremap <CR> <CR>
:autocmd BufReadPost quickfix nnoremap <CR> <CR>

" Mapping to undo accidental Enter press in insert mode
inoremap <C-\> <C-o>:left 0<Cr><BS>

" Switch to the alternate-file (previous buffer)
nnoremap <del> <C-^>

" Toggle between open windows
nnoremap <Tab> <C-w>w
nnoremap <S-Tab> <C-w>p

" Remap icrement and decrement
nnoremap <C-up> <C-a>
nnoremap <C-down> <C-x>

" Delete current buffer
noremap <silent> <space>d :bd<CR>

" Close current window without closing buffer
noremap <silent> <space>q :q<CR>

" Write current buffer (Ctrl in insert mode to avoid delay on <space>)
nnoremap <silent> <space>w :update<CR>
vnoremap <silent> <space>w <C-C>:update<CR>
inoremap <silent> <C-w> <C-O>:update<CR>

" Vertical Split Last Open Buffer
noremap <silent> <space>v :vert sb#<CR>

" Move to other windows
noremap <silent> <space><Down> <C-w><Down>
noremap <silent> <space><Up> <C-w><Up>
noremap <silent> <space><Left> <C-w><Left>
noremap <silent> <space><Right> <C-w><Right>

" Allow moving up and down in wrapped text,
" but keep old mapping when moving more than 1 line
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
nnoremap <expr> <Down> v:count ? '<Down>' : 'gj'
nnoremap <expr> <Up> v:count ? '<Up>' : 'gk'

" Make Mouse Wheel faster
noremap <ScrollWheelUp> 9<C-Y>
noremap <ScrollWheelDown> 9<C-E>

" Undo / Redo Hotkeys
nnoremap <C-Z> u
nnoremap <C-Y> <C-R>
inoremap <C-Z> <C-O>u
inoremap <C-Y> <C-O><C-R>

" Search and replace word under cursor
nnoremap <F2> *:%s//<c-r><c-w>/c

" Indent entire file
nnoremap <space>= gg=G<C-o><C-o>

" Editing and Sourcing .vimrc
nnoremap <space>ev :e $MYVIMRC<CR>
nnoremap <space>.v :source $MYVIMRC<CR>

" Colorize HEX and RGB color codes
nnoremap <space>C :ColorHighlight<CR>

" Sideways mappings
nnoremap [, :SidewaysLeft<CR>
nnoremap ], :SidewaysRight<CR>
omap a, <Plug>SidewaysArgumentTextobjA
xmap a, <Plug>SidewaysArgumentTextobjA
omap i, <Plug>SidewaysArgumentTextobjI
xmap i, <Plug>SidewaysArgumentTextobjI

" JS code snippits
nnoremap <space>cl iconsole.log();<Esc>hi
nnoremap <space>cv a.value<Esc>

" Fugitive (Git) Mappings
nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gs :vertical Git<CR>
nnoremap <space>gb :Gblame<CR>
nnoremap <space>gd :Gdiff<CR>
nnoremap <space>gc :Git diff --cached<CR>
nnoremap <space>ge :Gedit<CR>| "Edit the index directly
nnoremap <space>gr :Gread<CR>
nnoremap <space>gw :Gwrite<CR>| "Add another CR?
nnoremap <space>gm :Gmove<Space>
nnoremap <space>gp :Git push origin main<CR>

" Fast Fuzzy Finding (FZF) Mappings
nnoremap <silent> <space>f :GFiles<CR>| "Git Tracked Files
nnoremap <silent> <space>F :Files<CR>| "All Files
nnoremap <silent> <space>b :Buffers<CR>| "Open Buffers
nnoremap <silent> <space>B :ls<CR>:b<space>| "Simple Open Buffers (no FZF)
nnoremap <silent> <space>h :History<CR>| "Buffer History
nnoremap <silent> <space>L :BLines<CR>| "Lines in current buffer
nnoremap <silent> <space>l :Lines<CR>| "Lines in all buffers
nnoremap <silent> <space>' :Marks<CR>| "Marked lines
" nnoremap <silent> <space>t :BTags<CR>| "Tags in current file
" nnoremap <silent> <space>T :Tags<CR>| "Tags in all files
nnoremap <silent> <space>s :Rg<CR>| "Search Entire Project with Ripgrep
nnoremap <silent> <space>c :Commands<CR>| "All commands (plugins, user, built in)
nnoremap <silent> <space>: :History:<CR>| "Command History
nnoremap <silent> <space>H :Helptags!<CR>| "Search help in Fullscreen mode(!)
nnoremap <silent> <space>M :Maps<CR>| "Key Mappings
nnoremap <silent> <space>. :Filetypes<CR>| "File Syntax

" Lsp
nnoremap <space>x :ALEFix<CR>| "Fix ALE errors
nnoremap <space>r :LspRename<CR>| " Rename Symbol
nnoremap <space>t :LspDefinition<CR>| " Go To Type Defintion
nnoremap <space>a :LspReferences<CR>| " Show All References to Symbol
" nnoremap <space>s :LspNextReference<CR>| " (Search) Go To next reference of current symbol

nnoremap <space>n :ALENextWrap<CR>| "Next ALE error
nnoremap <space>N :ALEPreviousWrap<CR>| "Prev ALE error

" Tab autocomplete (prabirshrestha/asyncomplete.vim)
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
nnoremap <silent> <bs> :Lf<CR>
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"

" Browse to another file with LF
nnoremap <silent> <bs> :Lf<CR>


"" Plugins & Utils

" lf
let g:lf_map_keys = 0  " Disable default lf.vim shortcut: <leader>f
let g:lf_replace_netrw = 1  " Open lf when vim opens a directory
let g:lf_width = 1.0
let g:lf_height = 1.0


let g:lsp_highlight_references_enabled = 1  " highlight matches
let g:lsp_diagnostics_enabled = 0  " disable lsp-vim linting
let g:lsp_document_code_action_signs_enabled = 0  " disable A> in gutter on next error search

let g:ale_echo_msg_format = '%linter%: %s'

let g:ale_linters = {
  \ 'vue': ['eslint'],
  \ 'typescript': ['eslint'],
  \ 'javascript': ['eslint'],
\   'json': ['eslint']
  \ }

let g:ale_fixers = {
\   'vue': ['eslint'],
\   'typescript': ['eslint'],
\   'javascript': ['eslint'],
\   'json': ['eslint']
\}

let g:ale_sign_error = ' ~'
let g:ale_sign_warning = ' -'
let g:ale_sign_info = ' *'

" Color Hex Codes in HTML, CSS, and Vue files
" let g:colorizer_auto_color=1
" let g:colorizer_auto_filetype='vue,css,html,js'

" Add trailing comma when splitting lists
let g:splitjoin_trailing_comma = 1

" Put '>' in html tag on it's own line
let g:splitjoin_html_attributes_bracket_on_new_line = 1


" Make vim-vue plugin run faster
let g:vue_disable_pre_processors=1

" Wayland clipboard integration (wl-clipboard)
xnoremap <C-c> y:call system("wl-copy", @")<CR>
nnoremap <C-c> yy:call system("wl-copy", @")<CR>
nnoremap "+p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<CR>p
nnoremap "*p :let @"=substitute(system("wl-paste --no-newline --primary"), '<C-v><C-m>', '', 'g')<CR>p

" Highlight .vue files from the top to avoid mishighlights
autocmd FileType vue syntax sync fromstart

" Setup Pretty Status Bar (add git status, readonly icon, remove separators,
let g:lightline = {
  \ 'colorscheme': 'gruvbox_material',
  \ 'active': {
  \   'left':[ [ 'mode', 'paste' ],
  \            [ 'gitbranch', 'filename', 'modifystatus' ]
  \   ]
  \ },
  \ 'component': {
  \   'fileformat': '%{&ff=="unix"?"":&ff}',
  \   'fileencoding': '%{&fenc!=#""?(&fenc=="utf-8"?"":&fenc):&enc}',
  \   'percent': '%2p%%',
  \   'lineinfo': '%2v',
  \ },
  \ 'component_function': {
  \   'gitbranch': 'fugitive#head',
  \   'modifystatus': 'LightlineModifyStatus',
  \ },
  \ 'subseparator': { 'left': '', 'right': '' },
\ }
function! LightlineModifyStatus()
  if &ft !~? 'help' && &readonly
    return ''
  else
    return &modifiable && &modified ? '[+]' : ''
  endif
endfunction


" Add fzf results to the quickfix menu
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Use Ripgrep (rg) in fzf
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden
  \     --follow --glob "!{.git,node_modules,.png}/*" --color "always" '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Make :grep use RipGrep
if executable("rg")
  set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
