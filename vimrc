filetype on
filetype indent on
filetype plugin on

set number 
set foldenable " 开始折叠
" set mouse=a
set encoding=utf-8
set tabstop=2
set shiftwidth=2
set softtabstop=2
set scrolloff=5
set showmatch
set hlsearch
set incsearch
set noswapfile
set foldmethod=indent  " 设置语法折叠
set foldlevel=1
set foldlevelstart=-1  " 打开文件是默认不折叠代码
syntax enable
syntax on

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

call plug#begin('~/.vim/plugged')

" 状态栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" 状态栏主题
Plug 'connorholyday/vim-snazzy'
" 状态栏主题
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
" Plug 'dgryski/vim-godef'

Plug 'Valloric/YouCompleteMe'

" 可以使 nerdtree 的 tab 更加友好些
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

Plug 'jiangmiao/auto-pairs'

" Git 插件
" Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" 注释插件
Plug 'scrooloose/nerdcommenter'

" 函数大纲显示
Plug 'majutsushi/tagbar'

call plug#end()

" set background=dark

colorscheme monokai
" let g:colors_name="nslib_color256"

" let g:go_version_warning = 0


" 总是显示状态栏 
let laststatus = 2


let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"

" nmap [h<Plug> GitGutterNextHunk
" nmap ]h<Plug> GitGutterPrevHunk

let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#left_sep = ' '  "separater
let g:airline#extensions#tabline#left_alt_sep = '|'  "separater
let g:airline#extensions#tabline#formatter = 'default'  "formater
let g:airline_left_sep = '>>'
let g:airline_left_alt_sep = '>'
let g:airline_right_sep = '<<'
let g:airline_right_alt_sep = '<'

" #####NerdTree Setting
" autocmd VimEnter * NERDTree 
map <F3> :silent! NERDTreeToggle<CR>

""修改树的显示图标
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
" let NERDTreeAutoCenter=1
" 显示行号
let NERDTreeShowLineNumbers=1
" " 是否显示隐藏文件
let NERDTreeShowHidden=1
" " 设置宽度
let NERDTreeWinSize=30
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
" ####ctag配置
nmap fd <C-]>
set tags="/home/m/Documents/go/src/tags"
let g:tagbar_ctags_bin = 'ctags'

" ####cscope 配置
cs add $CSCOPE_DB

" ##### 注释配置
let g:NERDSpaceDelims=1
map <C-c> <leader>cb
map <C-b> <leader>cu

"#### ycm 配置
let g:ycm_filetype_whitelist = { 
	\ "go" : 1
	\}
"开启基于tag的补全，可以在这之后添加需要的标签路径
let g:ycm_collect_identifiers_from_tags_files = 1
" 开启语义补全
let g:ycm_seed_identifiers_with_syntax=1    
" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
"补全后自动关闭预览窗口
let g:ycm_autoclose_preview_window_after_completion = 1

" 修改YCM 提示框颜色
" highlight Pmenu ctermbg=grey
" highlight PmenuSel ctermbg=black
"### godef 配置
" autocmd FileType go nnoremap <buffer>fd :call GodefUnderCursor()<cr>
" 0 是不分割不跳转
" 1 是上下分割
" 2 是打开新窗口
" 3 是左右分割
" let g:godef_split=1    "左右打开新窗口的时候
" let g:godef_same_file_in_same_window=1    " 函数在同一个文件中时不需要打开新窗口




"#### tagbar 配置
nmap <silent> <F9> :TagbarToggle<CR>    

" 针对go 做的显示
" let g:tagbar_type_go = {
"   \ 'ctagstype': 'go',
"   \ 'kinds' : [
"       \'p:package',
"       \'f:function',
"       \'v:variables',
"       \'t:type',
"       \'c:const'
"   \]
"   \}
"
"
