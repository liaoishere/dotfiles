call plug#begin('~/.vim/bundle')

" MISC tools ================================================================{{{

if !has('nvim')
    Plug 'ConradIrwin/vim-bracketed-paste'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif

" Modify surround characters
Plug 'tpope/vim-surround'

" Toggle location list or quickfix list
Plug 'Valloric/ListToggle'
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>bq'

" System copy
Plug 'christoomey/vim-system-copy'

" For tmux navigator Ctrl-hjkl
Plug 'christoomey/vim-tmux-navigator'

" Fish syntax
" Plug 'sheerun/vim-polyglot'
Plug 'vim-scripts/fish-syntax'

" Select in visual
Plug 'terryma/vim-expand-region'
" map + <Plug>(expand_region_expand)
" map _ <Plug>(expand_region_shrink)
vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)

" Multi cursor
Plug 'terryma/vim-multiple-cursors'
let g:multi_cursor_use_default_mapping=0
" Default mapping
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" For repeat -> enhance surround.vim, . to repeat command
Plug 'tpope/vim-repeat'

" Remove trailing whitespaces
Plug 'bronson/vim-trailing-whitespace'
map <leader><space> :FixWhitespace<cr>
let g:extra_whitespace_ignored_filetypes = ['defx']

" Align statements
Plug 'junegunn/vim-easy-align'
" vmap <leader>a <Plug>(EasyAlign)
" nmap <leader>a <Plug>(EasyAlign)
if !exists('g:easy_align_delimiters')
  let g:easy_align_delimiters = {}
endif
let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String'] }

" Rainbow parentheses
Plug 'luochen1990/rainbow'
let g:rainbow_active = 0
let g:rainbow_conf = {
\	'guifgs':   ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'separately': {
\		'*': {},
\		'tex': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\		},
\		'lisp': {
\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\		},
\		'vim': {
\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\		},
\		'html': {
\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\		},
\		'css': 0,
\	}
\}

" Tabline in title, replaced by lightline
" Plug 'mkitt/tabline.vim'

" Dash integration
Plug 'rizzatti/dash.vim'

" }}}


" Git ======================================================================={{{
" Git wrapper, show git blame, git branch, etc.
Plug 'tpope/vim-fugitive'

" Show git diff
Plug 'airblade/vim-gitgutter'
let g:gitgutter_map_keys = 0
let g:gitgutter_enabled = 0
let g:gitgutter_highlight_lines = 1
nnoremap <leader>gs :GitGutterToggle<CR>
" }}}


" FZF ======================================================================={{{
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
" Ag grep
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)
" Rg grep
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

nnoremap <silent> <C-p> :FZF<CR>
nnoremap <leader>bl :BLines<CR>
nnoremap <leader>bf :Buffers<CR>

" floating window support
" function! OpenFloatingWin()
  " let height = &lines - 3
  " let width = float2nr(&columns - (&columns * 2 / 10))
  " let col = float2nr((&columns - width) / 2)

  " let opts = {
        " \ 'relative': 'editor',
        " \ 'row': height * 0.3,
        " \ 'col': col + 30,
        " \ 'width': width * 2 / 3,
        " \ 'height': height / 2
        " \ }

  " let buf = nvim_create_buf(v:false, v:true)
  " let win = nvim_open_win(buf, v:true, opts)

  " " turn on hightlighting
  " call setwinvar(win, '&winhl', 'Normal:Pmenu')

  " setlocal
        " \ buftype=nofile
        " \ nobuflisted
        " \ bufhidden=hide
        " \ nonumber
        " \ norelativenumber
        " \ signcolumn=no
" endfunction
" let g:fzf_layout = { 'window': 'call OpenFloatingWin()' }

" }}}


" Defx ======================================================================{{{
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
map <silent> - :Defx<CR>
" Avoid the white space highting issue
autocmd FileType defx match ExtraWhitespace /^^/
" Keymap in defx
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  IndentLinesDisable
  setl nospell
  setl signcolumn=no
  setl nonumber
  nnoremap <silent><buffer><expr> <CR>
  \ defx#is_directory() ?
  \ defx#do_action('open_or_close_tree') :
  \ defx#do_action('drop',)
  nmap <silent><buffer><expr> <2-LeftMouse>
  \ defx#is_directory() ?
  \ defx#do_action('open_or_close_tree') :
  \ defx#do_action('drop',)
  nnoremap <silent><buffer><expr> s defx#do_action('drop', 'split')
  nnoremap <silent><buffer><expr> v defx#do_action('drop', 'vsplit')
  nnoremap <silent><buffer><expr> t defx#do_action('drop', 'tabe')
  nnoremap <silent><buffer><expr> o defx#do_action('open_tree')
  nnoremap <silent><buffer><expr> O defx#do_action('open_tree_recursive')
  nnoremap <silent><buffer><expr> C defx#do_action('copy')
  nnoremap <silent><buffer><expr> P defx#do_action('paste')
  nnoremap <silent><buffer><expr> M defx#do_action('rename')
  nnoremap <silent><buffer><expr> D defx#do_action('remove_trash')
  nnoremap <silent><buffer><expr> A defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> U defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> . defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select')
  nnoremap <silent><buffer><expr> R defx#do_action('redraw')
endfunction

" Defx git
Plug 'kristijanhusak/defx-git'
let g:defx_git#indicators = {
  \ 'Modified'  : '✹',
  \ 'Staged'    : '✚',
  \ 'Untracked' : '✭',
  \ 'Renamed'   : '➜',
  \ 'Unmerged'  : '═',
  \ 'Ignored'   : '☒',
  \ 'Deleted'   : '✖',
  \ 'Unknown'   : '?'
  \ }
let g:defx_git#column_length = 0
hi def link Defx_filename_directory NERDTreeDirSlash
hi def link Defx_git_Modified Special
hi def link Defx_git_Staged Function
hi def link Defx_git_Renamed Title
hi def link Defx_git_Unmerged Label
hi def link Defx_git_Untracked Tag
hi def link Defx_git_Ignored Comment

" Defx icons
" Requires nerd-font, install at https://github.com/ryanoasis/nerd-fonts or
" brew cask install font-hack-nerd-font
" Then set non-ascii font to Driod sans mono for powerline in iTerm2
Plug 'kristijanhusak/defx-icons'
" disbale syntax highlighting to prevent performence issue
let g:defx_icons_enable_syntax_highlight = 1

" }}}


" Status line =============================================================0={{{
" Airline
"# Plug 'bling/vim-airline'
"# Plug 'vim-airline/vim-airline-themes'
"# if !exists('g:airline_symbols')
"#     let g:airline_symbols = {}
"# endif
"# let g:airline_theme='one'
"# let g:airline#extensions#ale#enabled = 1

" Lightline
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
set laststatus=2
set noshowmode

" Show readonly
function! LightlineReadonly()
  return &readonly ? '' : ''
endfunction

" Show git branch
function! LightlineFugitive()
  if exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? ' '.branch : ''
  endif
  return ''
endfunction

" Git blame message
function! LightlineGitBlame() abort
  let blame = get(b:, 'coc_git_blame', '')
  " return blame
  return winwidth(0) > 120 ? blame : ''
endfunction

" Get current funtion symbol
function! CocCurrentFunction()
  let currentFunctionSymbol = get(b:, 'coc_current_function', '')
  return currentFunctionSymbol !=# '' ? " " .currentFunctionSymbol : ''
endfunction

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch'],
      \             [ 'readonly', 'relativepath', 'modified' ],
      \             ['cocstatus', 'currentfunction' ] ],
      \   'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
      \              [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ], ['blame'] ]
      \ },
      \ 'component_function': {
		  \   'readonly': 'LightlineReadonly',
		  \   'gitbranch': 'LightlineFugitive',
      \   'cocstatus': 'coc#status',
      \   'blame': 'LightlineGitBlame',
      \   'currentfunction': 'CocCurrentFunction',
      \ },
      \ }

" seperator
" let g:lightline.separator = { 'left': '', 'right': '' }
" let g:lightline.subseparator = { 'left': '', 'right': '' }

" ALE linter info
let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_warnings = "\uf071 "
let g:lightline#ale#indicator_errors = "\uf05e "
let g:lightline#ale#indicator_ok = "\uf00c"
let g:lightline.component_expand = {
      \   'linter_checking': 'lightline#ale#checking',
      \   'linter_warnings': 'lightline#ale#warnings',
      \   'linter_errors': 'lightline#ale#errors',
      \   'linter_ok': 'lightline#ale#ok',
      \ }
let g:lightline.component_type = {
      \   'linter_checking': 'left',
      \   'linter_warnings': 'warning',
      \   'linter_errors': 'error',
      \   'linter_ok': 'left',
      \ }


" tabline
set showtabline=2  " Show tabline
let g:lightline.tabline = {
    \   'left': [ ['tabs'] ],
    \   'right': [ ['close'] ]
    \ }
let g:lightline.tab_component_function = {
      \   'shortpath': 'ShortPath',
      \}
let g:lightline.tab = {
    \ 'active': [ 'tabnum', 'shortpath', 'modified' ],
    \ 'inactive': [ 'tabnum', 'filename', 'modified' ] }

function! ShortPath(n) abort
  " Partly copied from powerline code:
  " https://github.com/admc/dotfiles/blob/master/.vim/autoload/Powerline/Functions.vim#L25
  " Display a short path where the first directory is displayed with its
  " full name, and the subsequent directories are shortened to their
  " first letter, i.e. "/home/user/foo/foo/bar/baz.vim" becomes
  " "~/foo/f/b/baz.vim"

  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let filename = expand('#'.buflist[winnr - 1].':t')
  if filename ==# ''
    return '[No Name]'
  endif

  let exclude_files = ['gitcommit', 'defx']
  for ft in exclude_files
    if ft ==# &filetype
      return filename
    endif
  endfor

  " Check if buffer is a terminal
  if &buftype ==# 'terminal'
    return filename
  endif

  let dirsep = has('win32') && ! &shellslash ? '\' : '/'
	let filepath = expand('%:p')
  if empty(filepath)
    return filename
  endif
  " This displays the shortest possible path, relative to ~ or the
  " current directory.
  let mod = (exists('+acd') && &acd) ? ':~:h' : ':~:.:h'
  let fpath = split(fnamemodify(filepath, mod), dirsep)
  let fpath_shortparts = map(fpath[1:], 'v:val[0]')
  let short_path = join(extend([fpath[0]], fpath_shortparts), dirsep) . dirsep
  if short_path == ('.' . dirsep)
		let short_path = ''
	endif
  return short_path . filename
endfunction

" }}}


" Color Themes =============================================================={{{
Plug 'flazz/vim-colorschemes'
Plug 'liaoishere/vim-one'        " Fix comment color of 'rakr/vim-one'
let g:one_allow_italics = 1
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'colepeters/spacemacs-theme.vim'
Plug 'fatih/molokai'
let g:molokai_original = 1
let g:rehash256 = 1

set background=dark
" }}}


" Code tools ================================================================{{{

" Auto complete for quote marks
Plug 'Raimondi/delimitMate'

" Auto complete for html/xml tags
Plug 'docunext/closetag.vim'
let g:closetag_html_style=1

" Comment shortcuts
Plug 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims=1

" Plug 'nathanaelkane/vim-indent-guides'
Plug 'Yggdroot/indentLine'
let g:indentLine_char = '|'
let g:indentLine_enabled = 0
nnoremap <leader>ig :IndentLinesToggle <CR>

" Golang ===================================================================={{{
Plug 'fatih/vim-go', { 'for': 'go' }
" enrich highlighting
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1

let g:go_def_reuse_buffer = 1
let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'
let g:go_fmt_command = 'goimports'
let g:go_metalinter_command = 'golangci-lint'
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
" let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'test']

let g:go_auto_sameids = 0           " auto highlight same vars
let g:go_def_mapping_enabled = 0    " toggle the default go def mappings

" Turn on auto typeinfo and K mapping if floating window is not supported
" FIXME: remove this block after neovim stable version 4.0 comes
if !exists('*nvim_open_win')
  let g:go_auto_type_info = 1         " auto show the type info of cusor
  let g:go_doc_keywordprg_enabled = 1 " map K to :GoDoc, use coc-action-doHover instead
else
  let g:go_auto_type_info = 0         " auto show the type info of cusor
  let g:go_doc_keywordprg_enabled = 0 " map K to :GoDoc, use coc-action-doHover instead
endif

autocmd FileType go noremap <buffer> <silent> <leader>ga :GoAlternate<cr>
autocmd FileType go noremap <buffer> <silent> <leader>gi :GoInfo<cr>
autocmd FileType go noremap <buffer> <silent> <leader>bt :GoDecls<cr>
autocmd FileType go noremap <buffer> <silent> <leader>gt :GoDeclsDir<cr>
autocmd FileType go noremap <buffer> <silent> <leader>gb :GoBuild<cr>
autocmd FileType go noremap <buffer> <silent> <leader>r :GoRun<cr>

autocmd FileType go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd FileType go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd FileType go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd FileType go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
" }}}

" Python ===================================================================={{{
Plug 'mindriot101/vim-yapf'
autocmd FileType python nnoremap <leader>y :Yapf<Cr>
"
" Python syntax highlight
Plug 'hdima/python-syntax'
let python_highlight_all = 1

"Jinja2
Plug 'Glench/Vim-Jinja2-Syntax'
" }}}

" Ruby ======================================================================{{{
Plug 'vim-ruby/vim-ruby'
" Plug 'nelstrom/vim-textobj-rubyblock'

" These plugs may have bugs
" Plug 'tpope/vim-endwise'
" Plug 'tpope/vim-rails'
" }}}

" HTML/JS/CSS ==============================================================={{{

" Javascript
Plug 'leafgarland/typescript-vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" emmet HTML complete
" Plug "mattn/emmet-vim"

" Less
" Plug 'groenewege/vim-less'
" autocmd BufWritePost *.less :!lessc % > %:p:r.css
" }}}

" Markdown =================================================================={{{
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled=1
" https://github.com/suan/vim-instant-markdown
" npm -g install instant-markdown-d
" Bundle 'suan/vim-instant-markdown'
" let g:instant_markdown_slow = 1
" let g:instant_markdown_autostart = 0
" map <F12> :InstantMarkdownPreview<CR>
" }}}

" Puppet ===================================================================={{{
Plug 'godlygeek/tabular'
Plug 'liaoishere/vim-puppet'
" }}}

" Nginx ====================================================================={{{
Plug 'chr4/nginx.vim'
" }}}

" Linters ==================================================================={{{
Plug 'w0rp/ale'
let g:ale_linters = {
      \   'python': ['flake8', 'pylint'],
      \   'go': ['golangci-lint'],
      \ }
let g:ale_go_golangci_lint_package = 1
let g:ale_go_golangci_lint_options = '--fast -E golint --exclude-use-default=false'
let g:ale_python_flake8_options = '--ignore=F821,E501'
let g:ale_python_pylint_options = '--disable=C0111,C0301,R0902,R0903,R0913,R0914,R0915,E1101,E1004'
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'

" virtual text, conflicts with coc-git
let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_prefix = ' > '
hi link ALEError ALEErrorSign
hi link ALEWarning ALEWarningSign

" }}}

" YouCompleteMe ============================================================={{{
"# function! BuildYCM(info)
"#   " info is a dictionary with 3 fields
"#   " - name:   name of the plugin
"#   " - status: 'installed', 'updated', or 'unchanged'
"#   " - force:  set on PlugInstall! or PlugUpdate!
"#   if a:info.status == 'installed' || a:info.force
"#     !./install.py --go-completer --clang-completer
"#   endif
"# endfunction
"# Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
"# " let g:ycm_key_list_select_completion=['<c-j>']
"# " let g:ycm_key_list_previous_completion=['<c-k>']
"# let g:ycm_complete_in_comments = 1
"# let g:ycm_complete_in_strings = 1
"# let g:ycm_use_ultisnips_completer = 1
"# let g:ycm_collect_identifiers_from_comments_and_strings = 1
"# let g:ycm_collect_identifiers_from_tags_files = 1
"# let g:ycm_gocode_binary_path = '/Users/Liao/Projects/go/bin/gocode'
"# let g:ycm_godef_binary_path = '/Users/Liao/Projects/go/bin/godef'
"# let g:ycm_seed_identifiers_with_syntax=0
"#
"# " Turn off scratch preview
"# set completeopt-=preview
"# "
"# " let g:ycm_goto_buffer_command = 'horizontal-split'
"# " let g:ycm_goto_buffer_command = 'new-tab'
"# let g:ycm_goto_buffer_command = 'vertical-split'
"# " nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
"# nnoremap <leader>gd :YcmCompleter GoToDefinition<CR>
"# nnoremap <leader>jd :YcmCompleter GoToDeclaration<CR>
"# " invoke completion
"# " let g:ycm_key_invoke_completion = '<C-Space>'
"# let g:ycm_filetype_blacklist = {
"#       \ 'tagbar' : 1,
"#       \ 'gitcommit' : 1,
"#       \ 'fzf': 1,
"#       \ 'ctrlp': 1
"#       \}
"
" }}}

" coc.nvim =================================================================={{{
" Installed extensions:
" coc-lists
" coc-snippets
" coc-highlight
" coc-yaml
" coc-python
" coc-json
" coc-html
" coc-css
" coc-vimlsp
" coc-tsserver
" coc-tslint-plugin
" coc-pairs
" coc-git
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" some key map conflicts with other plugins(e.g. vim-go), so skip specific
" type of files
" let s:exclude_files = ['go']
" function! s:nonGoFile()
"   for ft in s:exclude_files
"     if ft ==# &filetype | return 0 | endif
"   endfor
"   return 1
" endfunction
" autocmd BufRead,BufNew * if <SID>nonGoFile() |
"       \ nmap <silent> <C-LeftMouse> <LeftMouse><Plug>(coc-definition)| endif
" autocmd BufRead,BufNew * if <SID>nonGoFile() |
"       \ nmap <silent> g<LeftMouse> <LeftMouse><Plug>(coc-definition)| endif
" autocmd BufRead,BufNew * if <SID>nonGoFile() | nmap <silent> gd <Plug>(coc-definition)| endif

nmap <buffer> <silent> <C-s><C-]> :<C-u>call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <buffer> <silent> <C-s>] :<C-u>call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <buffer> <silent> <C-t><C-]> :<C-u>call CocAction('jumpDefinition', 'tabe')<CR>
nmap <buffer> <silent> <C-t>] :<C-u>call CocAction('jumpDefinition', 'tabe')<CR>
nmap <buffer> <silent> <C-w><C-]> :<C-u>call CocAction('jumpDefinition', 'split')<CR>
nmap <buffer> <silent> <C-w>] :<C-u>call CocAction('jumpDefinition', 'split')<CR>

nmap <silent> g<LeftMouse> <LeftMouse><Plug>(coc-definition)
nmap <silent> <C-LeftMouse> <LeftMouse><Plug>(coc-definition)
nmap <silent> <M-LeftMouse> <LeftMouse><Plug>(coc-definition)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> <leader>jd :<C-u>call CocAction('jumpDefinition', 'vsplit')<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
nmap <leader>f  <Plug>(coc-format)
xmap <leader>f  <Plug>(coc-format)

" Use C to open coc config
function! SetupCommandAbbrs(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction
call SetupCommandAbbrs('C', 'CocConfig')

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Using CocList
" Show all diagnostics
nnoremap <silent> <leader><space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <leader><space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <leader><space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <leader><space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <leader><space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <leader><space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <leader><space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <leader><space>p  :<C-u>CocListResume<CR>
" Yank list
nnoremap <silent> <leader><space>y  :<C-u>CocList -A --normal yank<cr>

" coc-snippets extension config
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)
" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" coc-vimlsp extension config
let g:markdown_fenced_languages = [
      \ 'vim',
      \ 'help'
      \]

" }}}

" Ultimate Snippet =========================================================={{{
Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" }}}

" Code tags ================================================================={{{
" Plug 'majutsushi/tagbar'
" nmap <F9> :TagbarToggle<CR>
" let g:tagbar_sort = 0
" let g:tagbar_autofocus = 1

" Vista.vim
Plug 'liuchengxu/vista.vim'
" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_sidebar_width = 35
let g:vista_echo_cursor_strategy = 'floating_win'

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'ctags'
let g:vista_executive_for = {
  \ 'cpp': 'coc',
  \ 'typescript': 'coc',
  \ 'go': 'coc',
  \ 'python': 'coc',
  \ }

" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

" Map F9 to toggle sidebar
nnoremap <F9> :Vista!!<CR>
nnoremap <leader>bt :Vista finder<CR>

" Re-generate the tag file on save
Plug 'ludovicchabant/vim-gutentags'
" Stop gutentags getting upset in short-lived sessions
" https://github.com/ludovicchabant/vim-gutentags/issues/178
let g:gutentags_exclude_filetypes=['gitcommit']

" Code signature
Plug 'kshenoy/vim-signature'
" }}}

" Quick run ================================================================={{{
Plug 'thinca/vim-quickrun'
let g:quickrun_config = {
\   "_" : {
\       "outputter" : "message",
\   },
\}

let g:quickrun_no_default_key_mappings = 1
nmap <Leader>r <Plug>(quickrun)
map <F10> :QuickRun<CR>
" }}}

" }}}


" Search ===================================================================={{{
" Plug 'haya14busa/is.vim'
Plug 'haya14busa/is.vim'
Plug 'haya14busa/vim-asterisk'
Plug 'osyo-manga/vim-anzu'
" mapping
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)
map *  <Plug>(asterisk-z*)<Plug>(is-nohl-1)
map g* <Plug>(asterisk-gz*)<Plug>(is-nohl-1)
map #  <Plug>(asterisk-z#)<Plug>(is-nohl-1)
map g# <Plug>(asterisk-gz#)<Plug>(is-nohl-1)
" clear status
nmap <Esc><Esc> <Plug>(anzu-clear-search-status)
" statusline
set statusline=%{anzu#search_status()}
" }}}

call plug#end()

" vim: set fdl=0 fdm=marker:
