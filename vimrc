filetype plugin indent on
filetype plugin on
syntax on
set number
scriptencoding utf-8
set encoding=utf-8
set tabstop=2
set shiftwidth=2
set softtabstop=2
set scrolloff=5
set showmatch
set hlsearch
set incsearch
set noswapfile
set nofoldenable
set nobackup
set nowritebackup
set ambiwidth=double
" set updatetime=300
set t_Co=256
set laststatus=2 "1为关闭底部状态栏 2为开启"
set backspace=2
set mmp=2048
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" 设置 <leader> 键  现在设置为 空格
let mapleader = "\<space>"
call plug#begin()
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'luochen1990/rainbow'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
 " Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'yuttie/hydrangea-vim'
Plug 'tomasiser/vim-code-dark'
Plug 'scrooloose/nerdcommenter'
" file tree
Plug 'Shougo/defx.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
" 快速单词间快速跳转
Plug 'easymotion/vim-easymotion'
" 静态检查
Plug 'dense-analysis/ale'
" 注释插件
Plug 'tpope/vim-commentary'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
call plug#end()
set termguicolors
let g:rehash256 = 1
set background=dark
colorscheme hydrangea
let g:go_fmt_command = "goimports" " 格式化将默认的 gofmt 替换
let g:go_version_warning = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_generate_tags = 1
let g:go_autodetect_gopath = 1
let g:godef_split=2
let g:go_gopls_options = ['-remote=auto']
let g:deoplete#enable_at_startup = 1
augroup go
  autocmd!
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
augroup END
" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:Lf_PreviewInPopup = 1
let g:Lf_WindowHeight=0.30
" leaderf
noremap ff :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>
" search visually selected text literally, don't quit LeaderF after accepting an entry
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F --stayOpen -e %s ", leaderf#Rg#visual())<CR>
" 彩虹括号
let g:rainbow_active = 1
let g:rainbow_conf = {
\   'guifgs': ['darkorange3', 'seagreen3', 'royalblue3', 'firebrick'],
\   'ctermfgs': ['lightyellow', 'lightcyan','lightblue', 'lightmagenta'],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'tex': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'lisp': {
\           'guifgs': ['darkorange3', 'seagreen3', 'royalblue3', 'firebrick'],
\       },
\       'vim': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\       },
\       'html': {
\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\       },
\       'css': 0,
\   }
\}
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
autocmd CursorHold * silent call CocActionAsync('highlight')
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
let g:airline_powerline_fonts = 1
" 设置状态栏
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '  "separater
let g:airline#extensions#tabline#left_alt_sep = '|'  "separater
let g:airline_theme='behelit'
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
       \ '0': '0 ',
       \ '1': '1 ',
       \ '2': '2 ',
       \ '3': '3 ',
       \ '4': '4 ',
       \ '5': '5 ',
       \ '6': '6 ',
       \ '7': '7 ',
       \ '8': '8 ',
       \ '9': '9 '
       \}
" 设置切换tab的快捷键 <leader> + <i> 切换到第i个 tab
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
" 设置切换tab的快捷键 <\> + <-> 切换到前一个 tab
nmap <leader>- <Plug>AirlineSelectPrevTab
" 设置切换tab的快捷键 <\> + <+> 切换到后一个 tab
nmap <leader>+ <Plug>AirlineSelectNextTab
" 设置切换tab的快捷键 <\> + <q> 退出当前的 tab
nmap <leader>q :bp<cr>:bd #<cr>
" 注释插件
" mm智能判断加上/解开注释
map mm gcc<space>
" lightline
 " let g:lightline = {
"   \ 'active': {
"   \   'left': [
"   \     [ 'mode', 'paste' ],
"   \     [ 'ctrlpmark', 'git', 'diagnostic', 'filename', 'method' ]
"   \   ],
"   \   'right':[
"   \     [ 'filetype', 'fileencoding', 'lineinfo', 'percent' ],
"   \     [ 'blame' ]
"   \   ],
"   \ },
"   \ 'component_function': {
"   \   'blame': 'LightlineGitBlame',
"   \ }
" \ }
" defx 配置
nmap <silent> <F3> :Defx  -search=`expand('%:p')` -toggle <cr>
call defx#custom#option('_', {
            \ 'winwidth': 30,
            \ 'split': 'vertical',
            \ 'direction': 'topleft',
            \ 'show_ignored_files': 0,
            \ 'buffer_name': '',
            \ 'toggle': 1,
            \ 'resume': 1
            \ })
let g:defx_icons_enable_syntax_highlight = 1
let g:defx_icons_column_length = 1
let g:defx_icons_term_colors = {
\ 'red': 2
\ }
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
    " Define mappings
    setl nonu                            " 勿在 defx 栏显示行号
    nnoremap <silent><buffer><expr> <CR>
                \ defx#is_directory() ?
                \ defx#do_action('open_or_close_tree') :
                \ defx#do_action('drop',)
    nnoremap <silent><buffer><expr> c    " 复制
                \ defx#do_action('copy')
    nnoremap <silent><buffer><expr> K    " 新建文件夾
                \ defx#do_action('new_directory')
    nnoremap <silent><buffer><expr> N    " 新建文件
                \ defx#do_action('new_file')
endfunction
" ale-setting {{{
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = ''
let g:ale_echo_msg_warning_str = ''
let g:ale_echo_msg_format = '[#%linter%#] %s [%severity%]'
let g:ale_statusline_format = ['E•%d', 'W•%d', 'OK']
"打开文件时不进行检查
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
 nmap <Leader>l :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>
let g:ale_linters = {
    \ 'go': ['staticcheck'],
    \ }
" easymotion 配置
nmap ss <Plug>(easymotion-s2)
" set laststatus=2
" let g:lightline = {
"   \ 'colorscheme': 'hydrangea',
"   \ 'active': {
"   \   'left': [ [ 'mode', 'paste' ],
"   \						  ['ctrlpmark', 'git', 'diagnostic', 'filename', 'method' ] ],
" 	\   'right': [
"   \     [ 'filetype', 'fileencoding', 'lineinfo', 'percent' ],
"   \     [ 'blame' ]
"   \   ],
"   \
"   \ },
"   \ 'component': {
"   \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
"   \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
"   \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
"   \ },
"   \ 'component_visible_condition': {
"   \   'readonly': '(&filetype!="help"&& &readonly)',
"   \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
"   \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
"   \ },
" 	\ 'component_function': {
"   \   'blame': 'LightlineGitBlame',
"   \ },
"   \ 'separator': { 'left': '', 'right': '' },
"   \ 'subseparator': { 'left': '∿', 'right': '❂' }
"   \ }
function! LightlineGitBlame() abort
  let blame = get(b:, 'coc_git_blame', '')
  " return blame
  return winwidth(0) > 120 ? blame : ''
endfunction
