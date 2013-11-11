if has('vim_starting')
  set nocompatible               " Be iMproved
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

" Folding {{{                                                                 
	set foldmethod=marker

	" Toggle folding

	nnoremap <F7> za
	vnoremap <F7> za
  " folds {{{
    nnoremap zr zr:echo &foldlevel<cr>
    nnoremap zm zm:echo &foldlevel<cr>
    nnoremap zR zR:echo &foldlevel<cr>
    nnoremap zM zM:echo &foldlevel<cr>
  " }}}
" }}}


" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" Recommended to install
" After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
    NeoBundleDepends 'Shougo/vimproc.vim', {
      \ 'build': {
        \ 'mac': 'make -f make_mac.mak',
        \ 'unix': 'make -f make_unix.mak',
        \ 'cygwin': 'make -f make_cygwin.mak',
        \ 'windows': '"C:\Program Files (x86)\Microsoft Visual Studio 11.0\VC\bin\nmake.exe" make_msvc32.mak',
      \ },
    \ }

NeoBundleLazy 'Shougo/vimshell.vim', {'autoload':{'commands':[ 'VimShell', 'VimShellInteractive' ]}} "{{{
				let g:vimshell_right_prompt='getcwd()'
				let g:vimshell_temporary_directory='~/.vim/.cache/vimshell'
				let g:vimshell_vimshrc_path='~/.vim/vimshrc'

				nnoremap <leader>c :VimShell -split<cr>
				nnoremap <leader>cc :VimShell -split<cr>
				nnoremap <leader>cn :VimShellInteractive node<cr>
				nnoremap <leader>cl :VimShellInteractive lua<cr>
				nnoremap <leader>cr :VimShellInteractive irb<cr>
				nnoremap <leader>cp :VimShellInteractive python<cr>
"}}}

" files tree
NeoBundle 'scrooloose/nerdtree'

" bufer, files etc search
NeoBundle 'Shougo/unite.vim' " {{{
	" files searching like ctrlp
	" -auto-preview (automatic preview)
	nnoremap <C-p> :Unite -start-insert -default-action=vsplit file_rec/async<CR>

	" content searching like ack.vim
	nnoremap <space>/ :Unite grep:.<cr>

	call unite#filters#matcher_default#use(['matcher_fuzzy'])
	call unite#filters#sorter_default#use(['sorter_rank'])
	let g:unite_source_rec_max_cache_files=5000
	let g:unite_data_directory="~/.vim/.cache/unite"
	let g:unite_source_file_mru_limit = 200
	let g:unite_source_history_yank_enable = 1
	let g:unite_prompt='» '

	" let g:unite_source_grep_command='ag'
	" let g:unite_source_grep_default_opts='--nocolor --nogroup --hidden'
	" let g:unite_source_grep_recursive_opt=''
	" let g:unite_source_rec_async_command='ag --nocolor --nogroup --ignore ".hg" --ignore ".svn" --ignore ".git" --ignore ".bzr" --hidden -g ""'

	if executable('ag')
		let g:unite_source_grep_command='ag'
		let g:unite_source_grep_default_opts='--nocolor --nogroup -S -C4'
		let g:unite_source_grep_recursive_opt=''
	elseif executable('ack')
		let g:unite_source_grep_command='ack'
		let g:unite_source_grep_default_opts='--no-heading --no-color -a -C4'
		let g:unite_source_grep_recursive_opt=''
	endif

	NeoBundleLazy 'tsukkee/unite-tag', {'autoload':{'unite_sources':['tag','tag/file']}} "{{{
  	nnoremap <silent> [unite]t :<C-u>Unite -auto-resize -buffer-name=tag tag tag/file<cr>
	"}}}
"}}}

" nice looking status line
NeoBundle 'bling/vim-airline'

" exuberant tags show
    NeoBundleLazy 'majutsushi/tagbar', {'autoload':{'commands':'TagbarToggle'}} "{{{
      nnoremap <silent> <F9> :TagbarToggle<CR>
    "}}}

" will not use this until it has some more relevant support eg. javascript or
" whatevet
" completition package
" NeoBundle 'Valloric/YouCompleteMe', {'build':{'unix': './install.sh'},'vim_version':'7.3.584'} "{{{
" 	let g:ycm_complete_in_comments_and_strings=1
" 	let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
" 	let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
" 	let g:ycm_filetype_blacklist={'unite': 1}
"}}}

" delimiteres and indents
NeoBundle 'Raimondi/delimitMate'

" comment utility
NeoBundle 'tomtom/tcomment_vim'

" git utility
NeoBundle 'tpope/vim-fugitive'

" python helper
NeoBundleLazy 'klen/python-mode', {'autoload':{'filetypes':['python']}} "{{{
	let g:pymode_rope=0
"}}}
NeoBundleLazy 'davidhalter/jedi-vim', {'autoload':{'filetypes':['python']}} "{{{
	let g:jedi#popup_on_dot=0
"}}}

" multiple cursors
NeoBundle 'terryma/vim-multiple-cursors'

" syntax checks
NeoBundle 'scrooloose/syntastic' "{{{
	let g:syntastic_python_checkers = ['flake8']
	" let g:syntastic_check_on_open=1
"}}}

" less syntax {{{
	NeoBundleLazy 'groenewege/vim-less', {'autoload':{'filetypes':['less']}}
	NeoBundleLazy 'cakebaker/scss-syntax.vim', {'autoload':{'filetypes':['scss','sass']}}
  NeoBundleLazy 'hail2u/vim-css3-syntax', {'autoload':{'filetypes':['css','scss','sass']}}
  NeoBundleLazy 'ap/vim-css-color', {'autoload':{'filetypes':['css','scss','sass','less','styl']}}
  NeoBundleLazy 'othree/html5.vim', {'autoload':{'filetypes':['html']}}
  NeoBundleLazy 'wavded/vim-stylus', {'autoload':{'filetypes':['styl']}}
  NeoBundleLazy 'digitaltoad/vim-jade', {'autoload':{'filetypes':['jade']}}
  NeoBundleLazy 'juvenn/mustache.vim', {'autoload':{'filetypes':['mustache']}}
  NeoBundleLazy 'gregsexton/MatchTag', {'autoload':{'filetypes':['html','xml']}}
  NeoBundleLazy 'mattn/emmet-vim', {'autoload':{'filetypes':['html','xml','css','less','mustache']}} "{{{
      function! s:zen_html_tab()
        let line = getline('.')
        if match(line, '<.*>') < 0
          return "\<c-y>,"
        endif
        return "\<c-y>n"
      endfunction
			"autocmd FileType xml,xsl,xslt,xsd,css,sass,scss,less,mustache imap <buffer><tab> <c-y>,
      "autocmd FileType html imap <buffer><expr><tab> <sid>zen_html_tab()
    "}}}
"}}}

" javascript syntax
NeoBundleLazy 'marijnh/tern_for_vim', {
	\ 'autoload': { 'filetypes': ['javascript'] },
	\ 'build': {
		\ 'mac': 'npm install',
		\ 'unix': 'npm install',
		\ 'cygwin': 'npm install',
		\ 'windows': 'npm install',
	\ },
\ }
NeoBundleLazy 'pangloss/vim-javascript', {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy 'maksimr/vim-jsbeautify', {'autoload':{'filetypes':['javascript']}} "{{{
	nnoremap <leader>fjs :call JsBeautify()<cr>
"}}}
NeoBundleLazy 'leafgarland/typescript-vim', {'autoload':{'filetypes':['typescript']}}
NeoBundleLazy 'kchmck/vim-coffee-script', {'autoload':{'filetypes':['coffee']}}
NeoBundleLazy 'mmalecki/vim-node.js', {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy 'leshill/vim-json', {'autoload':{'filetypes':['javascript','json']}}
NeoBundleLazy 'othree/javascript-libraries-syntax.vim', {'autoload':{'filetypes':['javascript','coffee','ls','typescript']}}


NeoBundleLazy 'tpope/vim-scriptease', {'autoload':{'filetypes':['vim']}}
NeoBundleLazy 'tpope/vim-markdown', {'autoload':{'filetypes':['markdown']}}

" other
NeoBundleLazy 'mattn/emmet-vim', {'autoload':{'filetypes':['html','xml','xsl','xslt','xsd','css','sass','scss','less','mustache']}} "{{{


" go lang
NeoBundleLazy 'jnwhiteh/vim-golang', {'autoload':{'filetypes':['go']}}
NeoBundleLazy 'nsf/gocode', {'autoload': {'filetypes':['go']}, 'rtp': 'vim'}

filetype plugin indent on

NeoBundleCheck


" ================== Configuration ===================

" ========= General Config ===========
" Enable line numbers
set number
" Highlight current line
set cursorline
" Make tabs as wide as two spaces
set tabstop=2
" Show “invisible” characters
map <F6> :set invlist<cr>
set lcs=tab:→\ ,trail:·,eol:↵,nbsp:_,extends:↷,precedes:↶
" Highlight searchesi
set hlsearch
" Incrementally search while typing a /regex
set incsearch
" Ignore case of searches
set ignorecase
" Highlight dynamically as pattern is typed
set incsearch
" Always show status line
set laststatus=2
" Enable mouse in all modes
set mouse=a
" Disable error bells
set noerrorbells
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Don’t show the intro message when starting vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
"Allow backspace in insert mode
set backspace=indent,eol,start
"Store lots of :cmdline history
set history=1000
"Reload files changed outside vim
set autoread
" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

set tags+=.tags
set nowrap

" ================ Search Settings  =================

set incsearch        "Find the next match as we type the search
set hlsearch         "Hilight searches by default
set viminfo='100,f1  "Save up to 100 marks, enable capital marks

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Completion =======================

set wildmode=longest:full
set wildmenu
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=vendor/cache/**
set wildignore+=log/**,tmp/**
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=.egg-info/,eggs/,*.pyc,.git

" ui configuration {{{
  set showmatch                                       "automatically highlight matching braces/brackets/etc.
  set matchtime=2                                     "tens of a second to show matching parentheses
  set number
  set lazyredraw
  set laststatus=2
  set noshowmode
  set foldenable                                      "enable folds by default
  set foldmethod=syntax                               "fold via syntax of files
  set foldlevelstart=99                               "open all folds by default
  let g:xml_syntax_folding=1                          "enable xml folding
" }}}

" ================ Scrolling ========================

set scrolloff=8         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=15
set sidescroll=1

" ============== Restore last position ============
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END


" ============== Airline Config ===================
let g:airline_powerline_fonts = 1
set encoding=utf-8
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

" ============== Venv =============================
" Add the virtualenv's site-packages to vim path
if has('python')
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
endif

" ============== Other ============================
" sudo write this
cmap W! w !sudo tee % >/dev/null
" Paste from clipboard
map <leader>p "+p
" draw 80 chars limit line
if (v:version >=703)
    set colorcolumn=80
    hi ColorColumn ctermbg=black
endif
" automatic splits resize on window resize
au VimResized * exe "normal! \<c-w>="

" ============== Filetype specific ================
autocmd BufNewFile,BufRead *.mako,*.mak,*.jinja2,*.tpl setlocal ft=html
autocmd FileType html,xhtml,xml,css setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2


" ============== Functions ========================
function! RelativeNumberToggle()
    if(&relativenumber == 1)
        set norelativenumber
    else
        set relativenumber
    endif
endfunc

nnoremap <silent> <leader>r :call RelativeNumberToggle()<CR>


" autocmd {{{
  autocmd FileType css,scss setlocal foldmethod=marker foldmarker={,}
  autocmd FileType css,scss nnoremap <silent> <leader>S vi{:sort<CR>
  autocmd FileType python setlocal foldmethod=indent
  autocmd FileType markdown setlocal nolist
  autocmd FileType vim setlocal fdm=indent keywordprg=:help
"}}}
