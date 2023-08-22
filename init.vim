let mapleader = " "

set nocompatible
set number
set shiftwidth=0
set relativenumber
set encoding=utf-8
set tabstop=4
set softtabstop=-1
set autoindent
set nowritebackup
set updatetime=300
set signcolumn=yes
set cindent
set copyindent
set laststatus=2
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.
set cinkeys=0},0),0],o,O,!^F
set cino=g0,Ls,N-s,(0,u0,U1,Ws,m1,j1,J1,)50,#1,l1
set formatoptions+=j
set mouse=a
set nowrap
set colorcolumn=+1
set showcmd
set hlsearch
set nrformats=bin,hex,alpha
" set foldmethod=marker
set history=300
set belloff=all

set clipboard=unnamed

set viminfo='100,s10,h,%
set nobackup
set noundofile
set undofile
set noswapfile
set guioptions=ac
set background=dark


" Folding and Comments
if has('vim_starting')
  if has('folding')
    set foldmethod=marker
    set foldopen+=jump
  endif
  set commentstring=#\ %s
endif

autocmd FileType c,cpp,cs,java,arduino,rust,typescript,javascript setlocal commentstring=//\ %s
autocmd FileType desktop              setlocal commentstring=#\ %s
autocmd FileType sql                  setlocal commentstring=--\ %s
autocmd FileType xdefaults            setlocal commentstring=!%s
autocmd FileType git,gitcommit,rust setlocal foldmethod=syntax foldlevel=3
" foldlevelstart=99

let g:vim_home = expand('~/vim/')

let config_list = [
      \ 'coc/*.vim',
      \ 'after/plugin/*.vim',
      \]

for files in config_list
  for f in glob(g:vim_home.files, 1, 1)
    exec 'source' f
  endfor
endfor


" use a slightly darker background, like GitHub inline code blocks
" let g:github_colors_soft = 1
" more blocky diff markers in signcolumn (e.g. GitGutter)
" let g:github_colors_block_diffmark = 0
" colorscheme github

syntax on

syntax enable
"colorscheme monokai

let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_better_performance = 1
colorscheme gruvbox-material
let g:lightline = {'colorscheme' : 'gruvbox_material'}

set statusline=%<%f\ %h%w%m%r\ 
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}
set statusline+=%{exists('*coc#status')?'\ [coc:\ '.coc#status().']':''}
set statusline+=%=
set statusline+=%{exists('g:loaded_sleuth')?SleuthIndicator():''}
set statusline+=%-14.(%4l/%L,%c%V%)\ %P

" coc-explore map
nmap <space>e <Cmd>CocCommand explorer<CR>