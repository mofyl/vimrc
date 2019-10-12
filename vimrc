filetype on
filetype indent on
filetype plugin on

set number
" set mouse=a
set encoding=utf-8
set tabstop=2
set shiftwidth=2
set softtabstop=2
set scrolloff=5
set showmatch
syntax enable
syntax on

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'connorholyday/vim-snazzy'
Plug 'NLKNguyen/papercolor-theme'
Plug 'ayu-theme/ayu-vim'
Plug 'bling/vim-bufferline'

" 配色方案
" colorscheme neodark
Plug 'KeitaNakamura/neodark.vim'
" " colorscheme monokai
Plug 'crusoexia/vim-monokai'
" " colorscheme github 
Plug 'acarapetis/vim-colors-github'
" " colorscheme one 
Plug 'rakr/vim-one'

Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}
Plug 'dgryski/vim-godef'

Plug 'Valloric/YouCompleteMe'

" 可以使 nerdtree 的 tab 更加友好些
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

Plug 'jiangmiao/auto-pairs'

Plug 'airblade/vim-gitgutter'

" 注释插件
Plug 'scrooloose/nerdcommenter'

call plug#end()

set background=dark

colorscheme koehler
" let g:colors_name="nslib_color256"

" let g:go_version_warning = 0

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1


autocmd FileType go nnoremap <buffer> gd :call GodefUnderCursor()<cr>
autocmd FileType go nnoremap <buffer> <C-]> :call GodefUnderCursor()<cr>
let g:godef_split=3    "左右打开新窗口的时候
let g:godef_same_file_in_same_window=1    "函数在同一个文件中时不需要打开新窗口


nmap [h<Plug> GitGutterNextHunk
nmap ]h<Plug> GitGutterPrevHunk


" NerdTree Setting
" autocmd VimEnter * NERDTree 
map <F3> :silent! NERDTreeToggle<CR>

""修改树的显示图标
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeAutoCenter=1
" 显示行号
let NERDTreeShowLineNumbers=1
" " 是否显示隐藏文件
let NERDTreeShowHidden=1
" " 设置宽度
let NERDTreeWinSize=20
" " 在终端启动vim时，共享NERDTree
" let g:nerdtree_tabs_open_on_console_startup=1
" " 忽略以下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
let g:NERDTreeIndicatorMapCustom = {
	\ "Modified"  : "✹",
  \ "Staged"    : "✚",
  \ "Untracked" : "✭",
  \ "Renamed"   : "➜",
  \ "Unmerged"  : "═",
  \ "Deleted"   : "✖",
	\ "Dirty"     : "✗",
  \ "Clean"     : "✔︎",
  \ 'Ignored'   : '☒',
  \ "Unknown"   : "?"
	\}


" 注释配置
let g:NERDSpaceDelims=1
map <C-c> <leader>cb
map <C-b> <leader>cu

" ycm 配置
let g:ycm_filetype_whitelist = { 
	\ "go" : 1
	\}

" 修改YCM 提示框颜色
highlight Pmenu ctermbg=grey
highlight PmenuSel ctermbg=black
