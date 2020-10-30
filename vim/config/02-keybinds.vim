" Keybind configs

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" y$ -> Y Make Y behave like other capitals
noremap Y y$

" Quickly close & save the current window
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>

" Map kj to Esc
inoremap kj <Esc>

" Map ; to :
nnoremap ; :

" Map H,L to head,tail
noremap H ^
noremap L $

" Fold code
nnoremap <space> za

" Shortcut for command mode
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" Ctrl-n Toggle relative number
function! ToggleRelativeNumber()
  if(&relativenumber == 1)
    set norelativenumber number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call ToggleRelativeNumber()<cr>
set norelativenumber number

" F2 - F7 ==================================================================={{{
" F2 Toggle line numbers
function! HideNumber()
  if(&relativenumber)
    set relativenumber!
    if (&number)
      set number!
    endif
  else
    set number!
  endif
  set number?
endfunc

noremap <F2> :call HideNumber()<CR>
noremap! <F2> <C-[>:call HideNumber()<CR>a

" F3 Toggle ALE
noremap <F3> :ALEToggle<CR>
noremap! <F3> <C-[>:ALEToggle<CR>a

" F4 Toggle text wrap
noremap <F4> :set wrap! wrap?<CR>
noremap! <F4> <C-[>:set wrap! wrap?<CR>a

" F5 Open Terminal
if has('nvim')
  noremap <F5> :terminal<CR>
endif
" }}}

" F6 Toggle non-printable characters displaying
noremap <F6> :set list! list?<CR>
noremap! <F6> <C-[>:set list! list?<CR>a

" F7 Toggle syntax
noremap <F7> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>
"""

" Tab Operations ============================================================{{{
noremap <leader>th :tabfirst<cr>
noremap <leader>tl :tablast<cr>

noremap <leader>tn :tabnext<cr>
noremap <leader>tp :tabprev<cr>

noremap <leader>te :tabedit<cr>
noremap <leader>td :tabclose<cr>
noremap <leader>tm :tabm<cr>

" Toggles between the active and last active tab "
" The first tab is always 1 "
let g:last_active_tab = 1
noremap <silent> <F1> :execute 'tabnext ' . g:last_active_tab<cr>
noremap <silent> <F1> :execute 'tabnext ' . g:last_active_tab<cr>
noremap <silent> <leader>tt :execute 'tabnext ' . g:last_active_tab<cr>
noremap <silent> <leader>tt :execute 'tabnext ' . g:last_active_tab<cr>
autocmd TabLeave * let g:last_active_tab = tabpagenr()

" Swtich tab in normal mode
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
" }}}

" vim: set fdl=0 fdm=marker:
