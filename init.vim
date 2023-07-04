"  __  ____   __  _   ___     _____ __  __ 
" |  \/  \ \ / / | \ | \ \   / /_ _|  \/  |
" | |\/| |\ V /  |  \| |\ \ / / | || |\/| |
" | |  | | | |   | |\  | \ V /  | || |  | |
" |_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|

" ===
" === Auto load for first time uses
" ===
" if empty(glob($HOME.'/.config/nvim/autoload/plug.vim'))
" 	silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs
" 				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" 	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif
"
" if empty(glob($HOME.'/.config/nvim/plugged/wildfire.vim/autoload/wildfire.vim'))
" 	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif

" ===
" === Create a _machine_specific.vim file to adjust machine specific stuff, like python interpreter location
" ===
let has_machine_specific_file = 1
if empty(glob('~/.config/nvim/_machine_specific.vim'))
	let has_machine_specific_file = 0
	silent! exec "!cp ~/.config/nvim/default_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
endif
source $HOME/.config/nvim/_machine_specific.vim

" ====================
" === Editor Setup ===
" ====================
" ===
" === System
" ===
"set clipboard=unnamedplus
let &t_ut=''
" set autochdir

lua require('config.init')

" ===
" === Editor behavior
" ===
" set exrc
" set secure
" set number
" set relativenumber
" set cursorline
" set hidden
" set noexpandtab
" set tabstop=4
" set shiftwidth=4
" set softtabstop=2
" set autoindent
" set list
" set listchars=tab:\|\ ,trail:▫
" set scrolloff=4
" set ttimeoutlen=0
" set notimeout
set viewoptions=cursor,folds,slash,unix
" set wrap
" set tw=0
" set indentexpr=
" set foldmethod=indent
" set foldlevel=99
" set foldenable
set formatoptions-=tc
" set splitright
" set splitbelow
" set noshowmode
" set showcmd
" set wildmenu
" set ignorecase
" set smartcase
" set shortmess+=c
set inccommand=split
" set completeopt=longest,noinsert,menuone,noselect,preview
" set ttyfast "should make scrolling faster
" set lazyredraw "same as above
" set visualbell
silent !mkdir -p $HOME/.config/nvim/tmp/backup
silent !mkdir -p $HOME/.config/nvim/tmp/undo
"silent !mkdir -p $HOME/.config/nvim/tmp/sessions
set backupdir=$HOME/.config/nvim/tmp/backup,.
set directory=$HOME/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=$HOME/.config/nvim/tmp/undo,.
endif
" set colorcolumn=100
" set updatetime=100
" set virtualedit=block

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" ===
" === Terminal Behaviors
" ===
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
tnoremap <C-N> <C-\><C-N>
tnoremap <C-O> <C-\><C-N><C-O>


" ===
" === Basic Mappings
" ===
" let mapleader=" "
 
" Save & quit
" noremap Q :q<CR>
" noremap <C-q> :qa<CR>
" noremap S :w<CR>

" Open the vimrc file anytime
noremap <LEADER>rc :e $HOME/.config/nvim/init.vim<CR>
noremap <LEADER>rv :e .nvimrc<CR>

" make Y to copy till the end of the line
" nnoremap Y y$

" Copy to system clipboard
" vnoremap Y "+y

" Indentation
" nnoremap < <<
" nnoremap > >>

" Delete find pair
" nnoremap dy d%

" Search
" noremap <LEADER><CR> :nohlsearch<CR>

" Adjacent duplicate words
" noremap <LEADER>dw /\(\<\w\+\>\)\_s*\1

" Space to Tab
" nnoremap <LEADER>tt :%s/    /\t/g
" vnoremap <LEADER>tt :s/    /\t/g

" Folding
" noremap <silent> <LEADER>o za

" nnoremap <c-n> :tabe<CR>:-tabmove<CR>:term lazynpm<CR>


" ===
" === Cursor Movement
" ===
" New cursor movement (the default arrow keys are used for resizing windows)
"     ^
"     k
" < h   l >
"     j
"     v
" noremap <silent> \v v$h
"
" " U/E keys for 5 times u/e (faster navigation)
" noremap <silent> K 5k
" noremap <silent> J 5j
"
" " N key: go to the start of the line
" noremap <silent> N 0
" " I key: go to the end of the line
" noremap <silent> I $
"
" " Faster in-line navigation
" noremap W 5w
" noremap B 5b
"
" " set h (same as n, cursor left) to 'end of word'
" " noremap h e
"
" " Ctrl + K or J will move up/down the view port without moving the cursor
" noremap <C-K> 5<C-y>
" noremap <C-J> 5<C-e>


" " ===
" " === Insert Mode Cursor Movement
" " ===
" inoremap <C-a> <ESC>A
"
"
" " ===
" " === Command Mode Cursor Movement
" " ===
" cnoremap <C-a> <Home>
" cnoremap <C-e> <End>
" cnoremap <C-p> <Up>
" cnoremap <C-n> <Down>
" cnoremap <C-b> <Left>
" cnoremap <C-f> <Right>
" cnoremap <M-b> <S-Left>
" cnoremap <M-w> <S-Right>


" " ===
" " === Searching
" " ===
" noremap - N
" noremap = n
"
"
" " ===
" " === Window management
" " ===
" " Use <space> + new arrow keys for moving the cursor around windows
" noremap <LEADER>w <C-w>w
" noremap <LEADER>k <C-w>k
" noremap <LEADER>j <C-w>j
" noremap <LEADER>h <C-w>h
" noremap <LEADER>l <C-w>l
" noremap qf <C-w>o
"
" " Disable the default s key
" noremap s <nop>
"
" " split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
" noremap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
" noremap sj :set splitbelow<CR>:split<CR>
" noremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
" noremap sl :set splitright<CR>:vsplit<CR>
"
" " Resize splits with arrow keys
" noremap <LEADER><up> :res +5<CR>
" noremap <LEADER><down> :res -5<CR>
" noremap <LEADER><left> :vertical resize-5<CR>
" noremap <LEADER><right> :vertical resize+5<CR>
"
" " Place the two screens up and down
" noremap su <C-w>t<C-w>K
" " Place the two screens side by side
" noremap sv <C-w>t<C-w>H
"
" " Rotate screens
" noremap srk <C-w>b<C-w>K
" noremap srv <C-w>b<C-w>H
"
" " Press <SPACE> + q to close the window below the current window
" noremap <LEADER>q <C-w>j:q<CR>
"
" " ===
" " === Tab management
" " ===
" " Create a new tab with tu
" noremap tu :tabe<CR>
" noremap tU :tab split<CR>
" " Move around tabs with tn and ti
" noremap tj :-tabnext<CR>
" noremap tk :+tabnext<CR>
" " Move the tabs with tmn and tmi
" noremap tmj :-tabmove<CR>
" noremap tmk :+tabmove<CR>


" ===
" === Markdown Settings
" ===
" Snippets
source $HOME/.config/nvim/md-snippets.vim
" auto spell
autocmd BufRead,BufNewFile *.md setlocal spell


" ===
" === Other useful stuff
" ===
" Open a new instance of st with the cwd
nnoremap \t :tabe<CR>:-tabmove<CR>:term sh -c 'st'<CR><C-\><C-N>:q<CR>

" Opening a terminal window
" noremap <LEADER>/ :set splitright<CR>:vsplit<CR>:vertical resize +10<CR>:term<CR>

" Press space twice to jump to the next '<++>' and edit it
" noremap <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" Spelling Check with <space>sc
" noremap <LEADER>sc :set spell!<CR>

" Press ` to change case (instead of ~)
" noremap ` ~

noremap <C-c> zz

" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h

" Call figlet
" noremap tx :r !figlet 

" find and replace
" noremap \s :%s//g<left><left>

" set wrap
" noremap <LEADER>sw :set wrap<CR>

" press f10 to show hlgroup
function! SynGroup()
	let l:s = synID(line('.'), col('.'), 1)
	echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun
map <F10> :call SynGroup()<CR>


" shared paste
vnoremap <leader>y :w! ~/.config/nvim/shared_pasteboard.vim<CR>
noremap <leader>p :r! cat ~/.config/nvim/shared_pasteboard.vim<CR>

" Compile function
noremap r :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		set splitbelow
		:sp
		:res -5
		term gcc -ansi -Wall % -o %< && time ./%<
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'cs'
		set splitbelow
		silent! exec "!mcs %"
		:sp
		:res -5
		:term mono %<.exe
	elseif &filetype == 'java'
		set splitbelow
		:sp
		:res -5
		term javac % && time java %<
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'markdown'
		exec "InstantMarkdownPreview"
	elseif &filetype == 'tex'
		silent! exec "VimtexStop"
		silent! exec "VimtexCompile"
	elseif &filetype == 'dart'
		exec "CocCommand flutter.run -d ".g:flutter_default_device." ".g:flutter_run_args
		silent! exec "CocCommand flutter.dev.openDevLog"
	elseif &filetype == 'javascript'
		set splitbelow
		:sp
		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	elseif &filetype == 'go'
		set splitbelow
		:sp
		:term go run .
	endif
endfunc

" ===
" === Install Plugins with Vim-Plug
" ===

" call plug#begin('$HOME/.config/nvim/plugged')

" Treesitter
" Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Plug 'nvim-treesitter/playground'

" Pretty Dress
" Plug 'theniceboy/nvim-deus'
"Plug 'arzg/vim-colors-xcode'

" Status line
" Plug 'vim-airline/vim-airline'
" Plug 'ojroques/vim-scrollstatus'

" General Highlighter
" Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
" Plug 'RRethy/vim-illuminate'

" File navigation
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
" Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
" Plug 'kevinhwang91/rnvimr'
" Plug 'airblade/vim-rooter'
" Plug 'pechorin/any-jump.vim'
" Plug 'simrat39/symbols-outline.nvim'
"
" " Taglist
" Plug 'liuchengxu/vista.vim'
"
" " Debugger
" " Plug 'puremourning/vimspector', {'do': './install_gadget.py --enable-c --enable-python --enable-go'}
"
" " Auto Complete
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
"
" " Undo Tree
" Plug 'mbbill/undotree'
"
" " Git
" Plug 'theniceboy/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
" Plug 'theniceboy/fzf-gitignore', { 'do': ':UpdateRemotePlugins' }
" "Plug 'mhinz/vim-signify'
" Plug 'airblade/vim-gitgutter'
" Plug 'cohama/agit.vim'
" Plug 'kdheepak/lazygit.nvim'
"
" " Tex
" " Plug 'lervag/vimtex'
"
" " HTML, CSS, JavaScript, Typescript, PHP, JSON, etc.
" Plug 'elzr/vim-json'
" Plug 'neoclide/jsonc.vim'
" Plug 'othree/html5.vim'
" Plug 'alvan/vim-closetag'
" Plug 'yuezk/vim-js', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
" Plug 'HerringtonDarkholme/yats.vim'
" Plug 'MaxMEllon/vim-jsx-pretty'
" Plug 'pangloss/vim-javascript'
" Plug 'leafgarland/typescript-vim'
" Plug 'peitalin/vim-jsx-typescript'
" Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" Plug 'pantharshit00/vim-prisma'
"
" " Python
" Plug 'Vimjas/vim-python-pep8-indent', { 'for' :['python', 'vim-plug'] }
" Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins'}
" Plug 'tweekmonster/braceless.vim', { 'for' :['python', 'vim-plug'] }
"
" " Flutter
" Plug 'dart-lang/dart-vim-plugin'
"
" " Markdown
" Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown'}
" Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
" Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
" Plug 'dkarter/bullets.vim'
"
" " Editor Enhancement
" " Plug 'jiangmiao/auto-pairs'
" " Plug 'mg979/vim-visual-multi'
" " Plug 'tomtom/tcomment_vim' " in <space>cn to comment a line
" Plug 'theniceboy/antovim' " gs to switch
" Plug 'tpope/vim-surround' " type ysiw' to wrap the word with '' or type cs'` to change 'word' to `word`
" Plug 'gcmt/wildfire.vim' " in Visual mode, type k' to select all text in '', or type k) k] k} kp
" Plug 'junegunn/vim-after-object' " da= to delete what's after =
" Plug 'godlygeek/tabular' " ga, or :Tabularize <regex> to align
" " Plug 'tpope/vim-capslock'	" Ctrl+L (insert) to toggle capslock
" " Plug 'easymotion/vim-easymotion'
" " Plug 'Konfekt/FastFold'
" "Plug 'junegunn/vim-peekaboo'
" "Plug 'wellle/context.vim'
" " Plug 'svermeulen/vim-subversive'
" " Plug 'theniceboy/argtextobj.vim'
" " Plug 'rhysd/clever-f.vim'
" " Plug 'AndrewRadev/splitjoin.vim'
" " Plug 'theniceboy/pair-maker.vim'
" " Plug 'theniceboy/vim-move'
" " Plug 'jeffkreeftmeijer/vim-numbertoggle'
" Plug 'Yggdroot/indentLine'
"
" " Bookmarks
" " Plug 'MattesGroeger/vim-bookmarks'
"
" " Find & Replace
" Plug 'brooth/far.vim', { 'on': ['F', 'Far', 'Fardo'] }
"
" " Mini Vim-APP
" " Plug 'mhinz/vim-startify'
" Plug 'mhinz/vim-startify', {'branch': 'center'} 
"
" " Vim Applications
" Plug 'itchyny/calendar.vim'
"
" " Other visual enhancement
" " Plug 'luochen1990/rainbow'
" Plug 'mg979/vim-xtabline'
" Plug 'ryanoasis/vim-devicons'
" " Plug 'wincent/terminus'
"
" " file type from context
" " Plug 'Shougo/context_filetype.vim'
" " auto comment
" " Plug 'tyru/caw.vim'
" " Plug 'tomtom/tcomment_vim' " in <space>cn to comment a line
"
" " Other useful utilities
" " Plug 'lambdalisue/suda.vim' " do stuff like :sudowrite
" " Plug 'makerj/vim-pdf'
" "Plug 'xolox/vim-session'
" "Plug 'xolox/vim-misc' " vim-session dep

" call plug#end()

set re=0

" experimental
set lazyredraw
"set regexpengine=1


" ===
" === Dress up my vim
" ===
" set termguicolors " enable true colors support
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"let g:one_allow_italics = 1

"color dracula
"color one
" color deus
"color gruvbox
"let ayucolor="light"
"color ayu
"color xcodelighthc
"set background=light
"set cursorcolumn

hi NonText ctermfg=gray guifg=grey10
"hi SpecialKey ctermfg=blue guifg=grey70

" ===================== Start of Plugin Settings =====================
"
"
" " ===
" " === eleline.vim
" " ===
" " let g:airline_powerline_fonts = 0
"
"
" " ==
" " == GitGutter
" " ==
" " let g:gitgutter_signs = 0
" let g:gitgutter_sign_allow_clobber = 0
" let g:gitgutter_map_keys = 0
" let g:gitgutter_override_sign_column_highlight = 0
" let g:gitgutter_preview_win_floating = 1
" let g:gitgutter_sign_added = '▎'
" let g:gitgutter_sign_modified = '░'
" let g:gitgutter_sign_removed = '▏'
" let g:gitgutter_sign_removed_first_line = '▔'
" let g:gitgutter_sign_modified_removed = '▒'
" " autocmd BufWritePost * GitGutter
" nnoremap <LEADER>gf :GitGutterFold<CR>
" nnoremap H :GitGutterPreviewHunk<CR>
" nnoremap <LEADER>g- :GitGutterPrevHunk<CR>
" nnoremap <LEADER>g= :GitGutterNextHunk<CR>
"
"
" " ===
" " === coc.nvim
" " ===
" let g:coc_global_extensions = [
"             \ 'coc-clangd',
"             \ 'coc-cmake',
"             \ 'coc-css',
"             \ 'coc-diagnostic',
"             \ 'coc-docker',
"             \ 'coc-eslint',
"             \ 'coc-explorer',
"             \ 'coc-flutter-tools',
"             \ 'coc-gitignore',
"             \ 'coc-html',
"             \ 'coc-import-cost',
"             \ 'coc-java',
"             \ 'coc-jest',
"             \ 'coc-json',
"             \ 'coc-lists',
"             \ 'coc-omnisharp',
"             \ 'coc-prettier',
"             \ 'coc-prisma',
"             \ 'coc-pyright',
"             \ 'coc-snippets',
"             \ 'coc-sourcekit',
"             \ 'coc-stylelint',
"             \ 'coc-syntax',
"             \ 'coc-tailwindcss',
"             \ 'coc-tasks',
"             \ 'coc-translator',
"             \ 'coc-tsserver',
"             \ 'coc-vetur',
"             \ 'coc-vimlsp',
"             \ 'coc-yaml']
" " inoremap <silent><expr> <TAB>
" " 	\ pumvisible() ? "\<C-n>" :
" " 	\ <SID>check_back_space() ? "\<TAB>" :
" " 	\ coc#refresh()
" inoremap <silent><expr> <TAB>
"             \ coc#pum#visible() ? coc#pum#next(1) :
"             \ CheckBackspace() ? "\<Tab>" :
"             \ coc#refresh()
" function! CheckBackspace() abort
"     let col = col('.') - 1
"     return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
"             \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" " function! s:check_back_space() abort
" " 	let col = col('.') - 1
" " 	return !col || getline('.')[col - 1]  =~# '\s'
" " endfunction
" inoremap <silent><expr> <c-space> coc#refresh()
" inoremap <silent><expr> <c-o> coc#refresh()
" function! Show_documentation()
"     call CocActionAsync('highlight')
"     if (index(['vim','help'], &filetype) >= 0)
"         execute 'h '.expand('<cword>')
"     else
"         call CocAction('doHover')
"     endif
" endfunction
" nnoremap <LEADER>sd :call Show_documentation()<CR>
"
" " diagnostic info
" nnoremap <silent><nowait> <LEADER>d :CocList diagnostics<cr>
" nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
" nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)
" nmap <LEADER>fx <Plug>(coc-fix-current)
" nnoremap <c-c> :CocCommand<CR>
" " Text Objects
" xmap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap if <Plug>(coc-funcobj-i)
" omap af <Plug>(coc-funcobj-a)
" xmap ic <Plug>(coc-classobj-i)
" omap ic <Plug>(coc-classobj-i)
" xmap ac <Plug>(coc-classobj-a)
" omap ac <Plug>(coc-classobj-a)
" " GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)
" nmap <silent> gD sl<Plug>(coc-definition)
"
" " Useful commands
" nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>
" nmap <leader>rn <Plug>(coc-rename)
" nmap tt :CocCommand explorer<CR>
" " coc-translator
" nmap ts <Plug>(coc-translator-p)
" " Remap for do codeAction of selected region
" function! s:cocActionsOpenFromSelected(type) abort
"     execute 'CocCommand actions.open ' . a:type
" endfunction
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>aw  <Plug>(coc-codeaction-selected)w
" " coctodolist
" " nnoremap <leader>tn :CocCommand todolist.create<CR>
" " nnoremap <leader>tl :CocList todolist<CR>
" " nnoremap <leader>tu :CocCommand todolist.download<CR>:CocCommand todolist.upload<CR>
" " coc-tasks
" noremap <silent> <leader>ts :CocList tasks<CR>
" " coc-snippets
" imap <C-l> <Plug>(coc-snippets-expand)
" vmap <C-j> <Plug>(coc-snippets-select)
" let g:coc_snippet_next = '<c-j>'
" let g:coc_snippet_prev = '<c-k>'
" imap <C-j> <Plug>(coc-snippets-expand-jump)
" let g:snips_author = 'qzy'
" autocmd BufRead,BufNewFile tsconfig.json set filetype=jsonc
"
" function! s:generate_compile_commands()
"     if empty(glob('CMakeLists.txt'))
"         echo "Can't find CMakeLists.txt"
"         return
"     endif
"     if empty(glob('build'))
"         execute 'silent !mkdir build'
"     endif
"     execute '!cmake -DCMAKE_BUILD_TYPE=debug
"                 \ -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -S . -B build'
" endfunction
" command! -nargs=0 Gcmake :call s:generate_compile_commands()
"
"
" " ===
" " === vim-instant-markdown
" " ===
" let g:instant_markdown_slow = 0
" let g:instant_markdown_autostart = 0
" let g:instant_markdown_open_to_the_world = 1
" let g:instant_markdown_allow_unsafe_content = 1
" let g:instant_markdown_allow_external_contenit = 1
" let g:instant_markdown_mathjax = 1
" let g:instant_markdown_autoscroll = 1
"
" " ===
" " === vim-table-mode
" " ===
" noremap <LEADER>tm :TableModeToggle<CR>
" "let g:table_mode_disable_mappings = 1
" let g:table_mode_cell_text_object_i_map = 'k<Bar>'
"
"
" " ===
" " === FZF
" " ===
" nnoremap <C-p> :Leaderf file<CR>
" " noremap <silent> <C-p> :Files<CR>
" noremap <silent> <C-f> :Rg<CR>
" noremap <silent> <C-h> :History<CR>
" "noremap <C-t> :BTags<CR>
" " noremap <silent> <C-l> :Lines<CR>
" noremap <silent> <C-w> :Buffers<CR>
" noremap <leader>; :History:<CR>
"
" let g:fzf_preview_window = 'right:60%'
" let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
"
" function! s:list_buffers()
"     redir => list
"     silent ls
"     redir END
"     return split(list, "\n")
" endfunction
"
" function! s:delete_buffers(lines)
"     execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
" endfunction
"
" command! BD call fzf#run(fzf#wrap({
"             \ 'source': s:list_buffers(),
"             \ 'sink*': { lines -> s:delete_buffers(lines) },
"             \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
"             \ }))
"
" noremap <C-d> :BD<CR>
"
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }
"
"
" " ===
" " === Leaderf
" " ===
" " let g:Lf_WindowPosition = 'popup'
" let g:Lf_PreviewInPopup = 1
" let g:Lf_PreviewCode = 1
" let g:Lf_ShowHidden = 1
" let g:Lf_ShowDevIcons = 1
" let g:Lf_CommandMap = {
"             \   '<C-]>': ['<C-v>'],
"             \   '<C-p>': ['<C-n>'],
"             \}
" let g:Lf_UseVersionControlTool = 0
" let g:Lf_IgnoreCurrentBufferName = 1
" let g:Lf_WildIgnore = {
"             \ 'dir': ['.git', 'vendor', 'node_modules'],
"             \ 'file': ['__vim_project_root', 'class']
"             \}
" let g:Lf_UseMemoryCache = 0
" let g:Lf_UseCache = 0
"
"
" " ===
" " === Undotree
" " ===
" noremap L :UndotreeToggle<CR>
" let g:undotree_DiffAutoOpen = 1
" let g:undotree_SetFocusWhenToggle = 1
" let g:undotree_WindowLayout = 2
" let g:undotree_DiffpanelHeight = 8
" let g:undotree_SplitWidth = 24
" function g:Undotree_CustomMap()
"     nmap <buffer> u <plug>UndotreeNextState
"     nmap <buffer> e <plug>UndotreePreviousState
"     nmap <buffer> U 5<plug>UndotreeNextState
"     nmap <buffer> E 5<plug>UndotreePreviousState
" endfunc
"
" " === Far.vim
" " ===
" noremap <LEADER>f :F  **/*<left><left><left><left><left>
" let g:far#mapping = {
"             \ "replace_undo" : ["l"],
"             \ }
"
"
"
" " ===
" " === Bullets.vim
" " ===
" " let g:bullets_set_mappings = 0
" let g:bullets_enabled_file_types = [
"             \ 'markdown',
"             \ 'text',
"             \ 'gitcommit',
"             \ 'scratch'
"             \]
"
"
" " ===
" " === Vista.vim
" " ===
" noremap <LEADER>v :Vista!!<CR>
" noremap <c-t> :silent! Vista finder coc<CR>
" let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
" let g:vista_default_executive = 'coc'
" let g:vista_fzf_preview = ['right:50%']
" let g:vista#renderer#enable_icon = 1
" let g:vista#renderer#icons = {
"             \   "function": "\uf794",
"             \   "variable": "\uf71b",
"             \  }
"
" let g:scrollstatus_size = 15
"
" " ===
" " === fzf-gitignore
" " ===
" noremap <LEADER>gi :FzfGitignore<CR>
"
"
"
" " ===
" " === vim-calendar
" " ===
" noremap \c :Calendar -view=year -position=here<CR>
" noremap \\ :Calendar -view=clock -position=here<CR>
" let g:calendar_google_calendar = 1
" let g:calendar_google_task = 1
" augroup calendar-mappings
"     autocmd!
"     " diamond cursor
"     autocmd FileType calendar nmap <buffer> k <Plug>(calendar_up)
"     autocmd FileType calendar nmap <buffer> h <Plug>(calendar_left)
"     autocmd FileType calendar nmap <buffer> j <Plug>(calendar_down)
"     autocmd FileType calendar nmap <buffer> l <Plug>(calendar_right)
"     autocmd FileType calendar nmap <buffer> <C-k> <Plug>(calendar_move_up)
"     autocmd FileType calendar nmap <buffer> <C-h> <Plug>(calendar_move_left)
"     autocmd FileType calendar nmap <buffer> <C-j> <Plug>(calendar_move_down)
"     autocmd FileType calendar nmap <buffer> <C-l> <Plug>(calendar_move_right)
"     autocmd FileType calendar nmap <buffer> i <Plug>(calendar_start_insert)
"     autocmd FileType calendar nmap <buffer> I <Plug>(calendar_start_insert_head)
"     " unmap <C-n>, <C-p> for other plugins
"     autocmd FileType calendar nunmap <buffer> <C-n>
"     autocmd FileType calendar nunmap <buffer> <C-p>
" augroup END
"
" let g:coc_sources_disable_map = { 'cs': ['cs', 'cs-1', 'cs-2', 'cs-3'] }
"
" " ===
" " === tabular
" " ===
" vmap ga :Tabularize /
"
"
" " ===
" " === rainbow
" " ===
" " let g:rainbow_active = 1
" " let g:rainbow_conf={
" " 		\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
" " 		\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
" " 		\	'operators': '_,_',
" " 		\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
" " 		\	'separately': {
" " 		\		'*': {},
" " 		\		'tex': {
" " 		\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
" " 		\		},
" " 		\		'lisp': {
" " 		\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
" " 		\		},
" " 		\		'vim': {
" " 		\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
" " 		\		},
" " 		\		'html': {
" " 		\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
" " 		\		},
" " 		\		'css': 0,
" " 		\	}
" " 		\}
"
"
" " ===
" " === xtabline
" " ===
" let g:xtabline_settings = {}
" let g:xtabline_settings.enable_mappings = 0
" let g:xtabline_settings.tabline_modes = ['tabs', 'buffers']
" let g:xtabline_settings.enable_persistance = 0
" let g:xtabline_settings.last_open_first = 1
" noremap to :XTabCycleMode<CR>
" noremap \p :echo expand('%:p')<CR>
"
" " ===
" " === vim-startify
" " ===
" let g:startify_files_number = 10
" let g:startify_custom_header =
" 		 				\ 'startify#center(startify#fortune#cowsay())'
" let g:startify_lists = [
"          \ { 'type': 'files',     'header': startify#center(['   MRU'])            },
"          \ { 'type': 'dir',       'header': startify#center(['   MRU '. getcwd()]) ,'indices': ['c0', 'c1', 'c2', 'c3', 'c4', 'c5', 'c6', 'c7', 'c8', 'c9']},
"          \ { 'type': 'sessions',  'header': startify#center(['   Sessions'])       },
"          \ { 'type': 'bookmarks', 'header': startify#center(['   Bookmarks'])      },
"          \ { 'type': 'commands',  'header': startify#center(['   Commands'])       },
"          \ ]
" let g:startify_bookmarks = [
"             \ { 'n': '~/.config/nvim/init.vim' },
"             \ { 'z': '~/.zshrc'},
"             \ ]
" let g:startify_padding_left = 68 " Hard coded padding for lists
"
" " ===
" " === vim-after-object
" " ===
" autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')
"
"
" " ===
" " === vim-markdown-toc
" " ===
" "let g:vmt_auto_update_on_save = 0
" "let g:vmt_dont_insert_fence = 1
" let g:vmt_cycle_list_item_markers = 1
" let g:vmt_fence_text = 'TOC'
" let g:vmt_fence_closing_text = '/TOC'
"
"
" " ===
" " === rnvimr
" " ===
" let g:rnvimr_ex_enable = 1
" let g:rnvimr_pick_enable = 1
" let g:rnvimr_draw_border = 0
" " let g:rnvimr_bw_enable = 1
" highlight link RnvimrNormal CursorLine
" nnoremap <silent> R :RnvimrToggle<CR><C-\><C-n>:RnvimrResize 0<CR>
" let g:rnvimr_action = {
"             \ '<C-t>': 'NvimEdit tabedit',
"             \ '<C-x>': 'NvimEdit split',
"             \ '<C-v>': 'NvimEdit vsplit',
"             \ 'gw': 'JumpNvimCwd',
"             \ 'yw': 'EmitRangerCwd'
"             \ }
" let g:rnvimr_layout = { 'relative': 'editor',
"             \ 'width': &columns,
"             \ 'height': &lines,
"             \ 'col': 0,
"             \ 'row': 0,
"             \ 'style': 'minimal' }
" let g:rnvimr_presets = [{'width': 1.0, 'height': 1.0}]
"
" " ===
" " === tcomment_vim
" " ===
" " let g:tcomment_textobject_inlinecomment = ''
" " nmap <LEADER>ch g>c
" " vmap <LEADER>ch g>
" " nmap <LEADER>cu g<c
" " vmap <LEADER>cu g<
" " nmap <LEADER>cb g>b
" " imap <leader>ch <esc>g>ci
" " imap <leader>cu <esc>g<i
"
"
" " ===
" " === vim-illuminate
" " ===
" let g:Illuminate_delay = 750
" hi illuminatedWord cterm=undercurl gui=undercurl
"
"
" " ===
" " === vim-rooter
" " ===
" let g:rooter_patterns = ['__vim_project_root', '.git/']
" let g:rooter_silent_chdir = 1
"
"
" " ===
" " === dart-vim-plugin
" " ===
" let g:dart_style_guide = 2
" let g:dart_format_on_save = 1
" let g:dartfmt_options = ["-l 100"]
"
"
" " ===
" " === any-jump
" " ===
" nnoremap aj :AnyJump<CR>
" let g:any_jump_window_width_ratio  = 0.8
" let g:any_jump_window_height_ratio = 0.9
"
"
" " ===
" " === Agit
" " ===
" nnoremap <LEADER>gl :Agit<CR>
" let g:agit_no_default_mappings = 1
"
"
" " ===
" " === nvim-treesitter
" " ===
" " lua <<EOF
" " require'nvim-treesitter.configs'.setup {
" "   -- one of "all", "language", or a list of languages
" "   ensure_installed = {"cpp", "cmake", "comment", "typescript", "dart", "java", "c", "prisma", "bash"},
" "   highlight = {
" "     enable = true,              -- false will disable the whole extension
" "     disable = { "rust" },  -- list of language that will be disabled
" "   },
" " }
" " EOF
"
"
" " ===
" " === lazygit.nvim
" " ===
" noremap <c-g> :LazyGit<CR>
" let g:lazygit_floating_window_winblend = 0 " transparency of floating window
" let g:lazygit_floating_window_scaling_factor = 1.0 " scaling factor for floating window
" let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
" let g:lazygit_use_neovim_remote = 1 " for neovim-remote support


" ===================== End of Plugin Settings =====================

" ===
" === Terminal Colors
" ===

" let g:terminal_color_0  = '#000000'
" let g:terminal_color_1  = '#FF5555'
" let g:terminal_color_2  = '#50FA7B'
" let g:terminal_color_3  = '#F1FA8C'
" let g:terminal_color_4  = '#BD93F9'
" let g:terminal_color_5  = '#FF79C6'
" let g:terminal_color_6  = '#8BE9FD'
" let g:terminal_color_7  = '#BFBFBF'
" let g:terminal_color_8  = '#4D4D4D'
" let g:terminal_color_9  = '#FF6E67'
" let g:terminal_color_10 = '#5AF78E'
" let g:terminal_color_11 = '#F4F99D'
" let g:terminal_color_12 = '#CAA9FA'
" let g:terminal_color_13 = '#FF92D0'
" let g:terminal_color_14 = '#9AEDFE'

" ===
" === Necessary Commands to Execute
" ===
exec "nohlsearch"

" Open the _machine_specific.vim file if it has just been created
if has_machine_specific_file == 0
	exec "e ~/.config/nvim/_machine_specific.vim"
endif
