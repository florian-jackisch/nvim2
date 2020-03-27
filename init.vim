let $VIMUSERRUNTIME = fnamemodify($MYVIMRC, ':p:h')
let g:python3_host_prog='$VIMUSERRUNTIME/py3env/bin/python3'

set number relativenumber
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
let mapleader=' '

" Terminal mapping
tnoremap <Esc> <C-\><C-n>

" Config mappings
nnoremap <leader>ve :e $MYVIMRC<CR>
nnoremap <leader>vs :source $MYVIMRC<CR>

" Plugins
call plug#begin()
Plug 'tpope/vim-vinegar'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
let g:coc_global_extensions = ['coc-ultisnips', 'coc-json', 'coc-word', 'coc-python', 'coc-lists', 'coc-vimtex', 'coc-snippets']
" Completion
set hidden
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c
set signcolumn=yes
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
imap <C-j> <Plug>(coc-snippets-expand-jump)
let g:coc_snippet_prev = '<c-k>'
" Mappings
nnoremap <leader>ce :CocConfig<CR>
nnoremap <leader>cl :CocList<CR>
nnoremap <leader>cc :CocCommand<CR>
nnoremap <leader>ca :CocAction<CR>
vnoremap <leader>ca :CocAction<CR>
nnoremap <leader>p :CocList files<CR>
nnoremap <leader>b :CocList buffers<CR>
nnoremap <leader>r :CocList mru<CR>
autocmd FileType python nnoremap <leader>x :CocCommand python.execInTerminal<CR>
noremap <silent> k gk
noremap <silent> j gj
noremap <silent> 0 g0
noremap <silent> $ g$

Plug 'sbdchd/neoformat'
let g:neoformat_enabled_python = ["black", "isort"]
autocmd FileType python let b:neoformat_run_all_formatters = 1
let g:neoformat_tex_latexindent2 = {
            \ 'exe': 'latexindent',
            \ 'args': ['2>/dev/null'],
            \ 'stdin': 1,
            \ }
let g:neoformat_enabled_tex = ["latexindent2"]
nnoremap <leader>f :Neoformat<CR>

Plug 'mbbill/undotree'
nnoremap <Leader>u :UndotreeToggle<CR>

" Auto pair
Plug 'tmsvg/pear-tree'
let g:pear_tree_repeatable_expand = 0
let g:pear_tree_smart_backspace   = 1
let g:pear_tree_smart_closers     = 1
let g:pear_tree_smart_openers     = 1

Plug 'tpope/vim-fugitive'
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gl :Gclog %<CR>
nnoremap <leader>gb :Gblame<CR>

Plug 'lervag/vimtex'
autocmd FileType tex set wrap linebreak

Plug 'itchyny/lightline.vim'
let g:lightline = { 'colorscheme': 'solarized' }

Plug 'kassio/neoterm'
let g:neoterm_autojump=1
let g:neoterm_default_mod='belowright'
let g:neoterm_autoscroll=1
let g:neoterm_size=10
nnoremap <leader>t :Ttoggle<CR>

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
nnoremap <leader>z :Goyo<CR>

Plug 'Valloric/ListToggle'
Plug 'airblade/vim-gitgutter'
Plug 'lifepillar/vim-solarized8'
Plug 'michaeljsmith/vim-indent-object'
Plug 'nelstrom/vim-visual-star-search'
Plug 'sheerun/vim-polyglot'
Plug 'tommcdo/vim-lion'   " Alignment: glip=
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'   " Detect indentation
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'wellle/targets.vim' " New targets, e.g. da,
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'   " :Delete, :Rename, :Mkdir

call plug#end()

set termguicolors
set background=light
colorscheme solarized8_flat

" Project specific settings
if stridx(getcwd(), 'dissertation') != -1
    nnoremap <leader>m :Dispatch -dir=diss latexmk -pdf diss.tex<CR>
    autocmd FileType tex setlocal spell spelllang=de_de
endif 

