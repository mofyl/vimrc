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
set mmp=2048
" 设置为双字宽显示，否则无法完整显示如:☆
set ambiwidth=double
set t_Co=256


set langmenu=zh_CN
let $LANG = 'zh_CN.UTF-8'
" set guifont=~/.local/share/fonts/sourcecode/OTF/SourceCodePro-Black.otf\ 12

set fileencodings=utf-8,gbk2312,gbk,gb18030,cp936
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8

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
Plug 'morhetz/gruvbox'
" " colorscheme one 
Plug 'rakr/vim-one'
" nvim 配色
Plug 'mhartington/oceanic-next'

Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}
" Plug 'dgryski/vim-godef'

" if has('nvim')
"     Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'}
" else
"   " Plug 'Shougo/deoplete.nvim'
"   " Plug 'roxma/nvim-yarp'
"   " Plug 'roxma/vim-hug-neovim-rpc'
" endif
" " deoplete 的golang 组件
" Plug 'zchee/deoplete-go', { 'do': 'make' , 'for': 'go'}

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" 可以使 nerdtree 的 tab 更加友好些
Plug 'scrooloose/nerdtree'
" nerdtree git 
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'jiangmiao/auto-pairs'
" Plug 'ryanoasis/vim-devicons'

Plug 'tpope/vim-fugitive'

" 注释插件
Plug 'scrooloose/nerdcommenter'

" 函数大纲显示
Plug 'majutsushi/tagbar'


" " 模糊搜索
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'
"
Plug 'jremmen/vim-ripgrep'


" 语法检查
Plug 'w0rp/ale'


" 括号颜色
Plug 'kien/rainbow_parentheses.vim'

call plug#end()

execute pathogen#infect()
" set background=dark

" nvim 配色
" colorscheme gruvbox
colorscheme OceanicNext
set background=dark
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1 

" let g:go_version_warning = 0


" 总是显示状态栏 
let laststatus = 2

" let g:airline_theme="dark"      " 设置主题
let g:airline_theme='oceanicnext'
" 开启tabline
let g:airline#extensions#tabline#enabled = 1      "tabline中当前buffer两端的分隔字符
let g:airline#extensions#tabline#left_sep = ' '   "tabline中未激活buffer两端的分隔字符
let g:airline#extensions#tabline#left_alt_sep = '|'      "tabline中buffer显示编号
let g:airline#extensions#tabline#buffer_nr_show = 1  
let g:airline_powerline_fonts = 1   " 使用powerline打过补丁的字体
" 映射切换buffer的键位
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>


let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_function_calls = 1
let g:go_fmt_command = "goimports"
let g:go_def_mode="gopls"
let g:go_info_mode='gopls'
" nmap [h<Plug> GitGutterNextHunk
" nmap ]h<Plug> GitGutterPrevHunk
" let g:airline_theme='bubblegum'
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
" let g:NERDTreeDirArrowExpandable = '►'
" let g:NERDTreeDirArrowCollapsible = '▼'
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
" NERDTree git 状态
let g:NERDTreeShowIgnoredStatus = 1
" let g:NERDTreeIndicatorMapCustom = {
"   \ "Modified"  : "✹",
"   \ "Staged"    : "✚",
"   \ "Untracked" : "✭",
"   \ "Renamed"   : "➜",
"   \ "Unmerged"  : "═",
"   \ "Deleted"   : "✖",
"   \ "Dirty"     : "✗",
"   \ "Clean"     : "✔︎",
"   \ 'Ignored'   : '☒',
"   \ "Unknown"   : "?"
"   \}
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

nmap fd <C-]>
"####ctag配置
" set tags="/home/m/go/src/tags"
" let g:tagbar_ctags_bin = 'ctags'

" ####cscope 配置
" cs add $CSCOPE_DB

" ##### 注释配置
let g:NERDSpaceDelims=1
map <C-c> <leader>cb
map <C-b> <leader>cu


"#### tagbar 配置
nmap <silent> <F9> :TagbarToggle<CR>    

"  ###### ale 
" 始终开启标志列
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 1
"自定义error和warning图标
" let g:ale_sign_error = '✗'
" let g:ale_sign_warning = '⚡'
" 在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
" let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap ep <Plug>(ale_previous_wrap)
nmap en <Plug>(ale_next_wrap)

let g:ale_linters ={'go': ['gofmt','govet' , 'gobuild' , 'goimports']}

" " deoplete-go settings
" set runtimepath+=~/.config/nvim/plugged/deoplete.nvim/
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#sources#go#gocode_binary = '~/go/bin/gocode-gomod'
" let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

" " cgo support
" " let g:deoplete#sources#go#cgo = 1

" let g:deoplete#sources#go#pointer = 1

" let g:deoplete#sources#go = ['vim-go']
" let g:deoplete#sources#go#use_cache = 1
" let g:deoplete#sources#go#json_directory = '~/.vim/deopletecache/deoplete/go/'

" call deoplete#custom#option({
"     \   'on_insert_enter': v:false,
"     \   'ignore_case': v:true,
"     \   'smart_case': v:true,
"     \ })

" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" let g:python3_host_prog = '/usr/bin/python3'
" 括号颜色
"
let g:rbpt_max = 16
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


" power line 
" set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/ "powerline的安装路径，可能需要自行调整'
set laststatus=2  "设置vim状态栏数量为2，用于显示powerline的内容'
set showtabline=2 "'始终显示窗口上头的tabline'
" set noshowmode    "'Hide the default mode text (e.g. -- INSERT -- below the statusline)'
let g:Powerline_symbols= "fancy"


" Coc 配置
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	  let col = col('.') - 1
		  return !col || getline('.')[col - 1]  =~# '\s'
		endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')
" 绑定 ctrl-space 触发补全
inoremap <silent><expr> <c-space> coc#refresh()

" fzf配置
" fzf 中生成tags的命令
" let g:fzf_tags_command = 'ctags -R'
" " [Buffers] 如果可能跳到已存在窗口
" let g:fzf_buffers_jump = 1


" command! -bang -nargs=* Ag
"   \ call fzf#vim#ag(<q-args>,
"   \                 <bang>0 ? fzf#vim#with_preview('up:60%')
"   \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
"   \                 <bang>0)
" nnoremap <silent> <Leader>A :Ag<CR>


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
