" ===
" === Auto load for first time uses
" ===
if empty(glob($HOME.'/.vim/autoload/plug.vim'))
	silent !curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
  Plug 'preservim/nerdtree'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
	" Plug 'liuchengxu/vista.vim'
	Plug 'jiangmiao/auto-pairs'
	Plug 'luochen1990/rainbow'
	Plug 'tomtom/tcomment_vim'
	Plug 'honza/vim-snippets'
  Plug 'mattn/emmet-vim'

"	Plug 'ojroques/vim-scrollstatus'
  " Plug 'arzg/vim-colors-xcode'
	Plug 'danilo-augusto/vim-afterglow'
	Plug 'vim-airline/vim-airline'
  " Plug 'sheerun/vim-polyglot'
  Plug 'joshdick/onedark.vim'
  Plug 'ayu-theme/ayu-vim'

	Plug 'airblade/vim-gitgutter'
	Plug 'peitalin/vim-jsx-typescript'
	Plug 'fatih/vim-go'
  " Plug 'posva/vim-vue'

"	Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
	Plug 'github/copilot.vim'

	Plug 'voldikss/vim-floaterm'
	Plug 'tpope/vim-fugitive'
	Plug 'mhinz/vim-startify'
call plug#end()

" NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Start NERDTree and put the cursor back in the other window.
" autocmd VimEnter * NERDTree | wincmd p

" Basic
set number
set relativenumber
set cursorline
set mouse=a
" set paste

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent

set splitright
set splitbelow

set foldmethod=indent
set foldlevel=99
set foldenable

" set updatetime=100

set ignorecase
set smartcase

set incsearch

" regex
set re=0

" set autochdir

nnoremap < <<
nnoremap > >>
vnoremap < <gv
vnoremap > >gv

" Set <LEADER> as <SPACE>, ; as :
let mapleader=" "
noremap ; :

" Copy to system clipboard
vnoremap Y "+y

" true color enable
if has("termguicolors")
    " enable true color
    set termguicolors
endif
if &term =~# '^screen'
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" ===
" === Window management
" ===
" Use <space> + new arrow keys for moving the cursor around windows
noremap <LEADER>w <C-w>w
noremap <LEADER>k <C-w>k
noremap <LEADER>j <C-w>j
noremap <LEADER>h <C-w>h
noremap <LEADER>l <C-w>l
noremap qf <C-w>o
" Press <SPACE> + q to close the window below the current window
noremap <LEADER>q <C-w>j:q<CR>

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap sj :set splitbelow<CR>:split<CR>
noremap sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap sl :set splitright<CR>:vsplit<CR>

" Resize splits with arrow keys
noremap <up> :res -5<CR>
noremap <down> :res +5<CR>
noremap <left> :vertical resize-5<CR>
noremap <right> :vertical resize+5<CR>

" ===
" === Tab management
" ===
" Create a new tab with tu
noremap tu :tabe<CR>
noremap tU :tab split<CR>
" Move around tabs with tn and ti
noremap tn :-tabnext<CR>
noremap ti :+tabnext<CR>
" Move the tabs with tmn and tmi
noremap tmn :-tabmove<CR>
noremap tmi :+tabmove<CR>

" ===
" === Buffer management
" ===
noremap bn :bn<CR>
noremap bp :bp<CR>
noremap bd :bd<CR>
noremap bD :%bd\|e#<CR>

" ===
" === Terminal Behaviors
" ===
tnoremap <C-N> <C-\><C-N>
tnoremap <C-O> <C-\><C-N><C-O>
" Opening a terminal window
"noremap <LEADER>/ :set splitbelow<CR>:res +10<CR>:term<CR>
noremap <LEADER>/ :tab term<CR>
noremap <LEADER>t :FloatermToggle<CR>
noremap <LEADER>T :term<CR>


" ===
" === Plug Config
" ===

" ===
" === colorscheme
" ===
" vim-colors-xcode
" colorscheme xcodedark
" set termguicolors

" rainbow
let g:rainbow_active = 1

" danilo-augusto/vim-afterglow
" syntax enable
" colorscheme afterglow

" set background=dark
" let g:solarized_termcolors=256
" colorscheme solarized

" joshdick/onedark
" syntax on
" colorscheme onedark

" colorschema habamax
"
set termguicolors     " enable true colors support
" let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme
colorscheme ayu

" vim-airlline/vim-airline
let g:airline#extensions#tabline#enabled = 1

" tcomment_vim
nnoremap ci cl
let g:tcomment_textobject_inlinecomment = ''
nmap <LEADER>cn g>c
vmap <LEADER>cn g>
nmap <LEADER>cu g<c
vmap <LEADER>cu g<

" ===
" === coc.nvim and extensions
" ===

" coc.nvim
" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" extensions: coc-pyright coc-java coc-codegeex coc-copilot coc-tabnine
let g:coc_global_extensions = ['coc-snippets', 'coc-json', 'coc-explorer', 'coc-tsserver', '@yaegassy/coc-volar']
" other plugin before putting this into your config
" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
" set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
" set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
															\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)"

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD :vsplit<CR>:call CocAction('jumpDefinition')<CR>

nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
	  if CocAction('hasProvider', 'hover')
			    call CocActionAsync('doHover')
					  else
							    call feedkeys('K', 'in')
									  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)"

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" " Remap <C-f> and <C-b> to scroll float windows/popups
" if has('nvim-0.4.0') || has('patch-8.2.0750')
"   nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"   nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"   inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
"   inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
"   vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"   vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
" endif
"
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)"

" === coc-codegeex
vmap <silent> <C-l> <Plug>(coc-codegeex-translate-keymap)

" === coc-explorer
nnoremap <Leader>op :CocCommand explorer<CR>
nnoremap <Leader>od :CocDiagnostics<CR>
nnoremap <Leader>oo :CocOutline<CR>
" autocmd VimEnter * :CocCommand explorer

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')
