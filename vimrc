"VUNDLE#
"==============================================================================
    set nocompatible              " be iMproved, required
    filetype off                  " required

    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    " let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'

    "Plugins
    "General
    Plugin 'junegunn/vim-easy-align'
    Plugin 'tpope/vim-unimpaired'
    Plugin 'tpope/vim-abolish'
    "Plugin 'easymotion/vim-easymotion' need to set it up properly
    Plugin 'nathanaelkane/vim-indent-guides'
    Plugin 'mhinz/vim-signify'
    Plugin 'osyo-manga/vim-over'
    Plugin 'bling/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'flazz/vim-colorschemes'

    "Git
    Plugin 'tpope/vim-fugitive'
    Plugin 'rhysd/conflict-marker.vim'
  
 
    "Session Management
    "Plugin 'thaerkh/vim-workspace'
    Plugin 'xolox/vim-session'
    Plugin 'sjl/gundo.vim'

    "Browsing
    Plugin 'tacahiroy/ctrlp-funky'
    Plugin 'kien/ctrlp.vim'
    Plugin 'scrooloose/nerdtree'
    Plugin 'jlanzarotta/bufexplorer'

    "Completion
    Plugin 'tpope/vim-surround'
    Plugin 'tpope/vim-repeat'
    Plugin 'jiangmiao/auto-pairs'
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'scrooloose/syntastic'
    Plugin 'SirVer/ultisnips'
    Plugin 'honza/vim-snippets'
    Plugin 'valloric/youcompleteme'
    Plugin 'majutsushi/tagbar'
    Plugin 'ludovicchabant/vim-gutentags'
    
    "Spelling
    Plugin 'reedes/vim-wordy'
    Plugin 'leifdenby/vim-spellcheck-toggle'

    "Notes
    Plugin 'xolox/vim-notes'
    Plugin 'xolox/vim-misc'
    Plugin 'DrawIt'
    Plugin 'Txtfmt-The-Vim-Highlighter'
    Plugin 'chesleytan/wordcount.vim'

    "HTML
    Plugin 'mattn/emmet-vim'
    Plugin 'emmetio/emmet'
    Plugin 'hail2u/vim-css3-syntax'
    Plugin 'gorodinskiy/vim-coloresque'
    Plugin 'gregsexton/matchtag'
    Plugin 'tmhedberg/matchit'

    "Python
    Plugin 'klen/python-mode'
    Plugin 'vim-scripts/python_match.vim'
    Plugin 'vim-scripts/pythoncomplete'

    "latex
    Plugin 'vim-latex/vim-latex'

    call vundle#end()            " required
    filetype plugin indent on    " required
"==============================================================================


"Pure Vim Settings
"==============================================================================
    autocmd Filetype vim setlocal foldmethod=indent
    let mapleader = " "
    set mouse=a

    set relativenumber "sets makes line number count relative to current line
    set tw=79
    set cc=80
    set nowrap

    set t_Co=256
    colorscheme petrel

    "sudo save
    cmap w!! w !sudo tee > /dev/null %

    "Indents
    set ts=8 sts=4 sw=4 noexpandtab

    "i.e. search first / then replace :s%//<replacement phrase>/g
    set incsearch
    "one-time cure for backslashitis
    noremap <leader>;; :%s:::g<Left><Left>
    noremap <leader>;l :%s:::g<Left><Left>
    noremap <leader>;c :%s:::cg<Left><Left><Left>
    noremap<Leader>;' :'b,'es:::g<Left><Left>
    vnoremap <leader>;; :s:::g<Left><Left>
    "case sensitivity
    set ignorecase
    set smartcase
    "/word   : case insensitive
    "/Word   : case sensitive
    "/word\C : case sensitive
    "/Word\c : case insensitive
    
    "leader shortcuts
    "N.B. register yank must be followed by a movement
    noremap <leader>y "*y
    noremap <leader>Y "+y
    noremap <leader>p "*p
    noremap <leader>P "+p
    nnoremap <silent> <leader>w :cwindow<CR>
    nmap <Leader>o :only<CR>

    "set spellchecking
    set spell
    set spelllang=en_gb

    "Filetype shiftwidths
    autocmd Filetype html setlocal sts=2 sw=2 noexpandtab foldmethod=manual
    autocmd Filetype css setlocal sts=2 sw=2 noexpandtab
    autocmd Filetype latex setlocal sts=2 sw=2 expandtab
    autocmd Filetype haskell setlocal sts=4 sw=4 expandtab

    "php settings
    autocmd Filetype php nmap <Leader>mp :set filetype=php<CR>
    autocmd Filetype php nmap <Leader>mh :set filetype=html<CR>
    autocmd Filetype php nmap <Leader>mj :set filetype=javascript<CR>

    "html settings
    autocmd Filetype html nmap <Leader>mj :set filetype=javascript<CR>

    "Make defaults
    nmap <Leader>m :make<CR>
    nmap <Leader>mm :make<CR>
	"python
    autocmd Filetype python setlocal makeprg=python3\ %
    autocmd Filetype python setlocal autowrite
    autocmd Filetype python nmap <Leader>mn :set makeprg=
    autocmd Filetype python nmap <Leader>mp :set makeprg=python3\ %<CR>
    autocmd Filetype python nmap <Leader>mP :set makeprg=python\ %<CR>
    autocmd Filetype python nmap <Leader>ma :set autowrite<CR>
	"c
    autocmd Filetype c setlocal makeprg=gcc\ %\ &&\ ./a.out
    autocmd Filetype c setlocal autowrite
    autocmd Filetype c nmap <Leader>mm :!gcc % && ./a.out <CR>
    autocmd Filetype c nmap <Leader>mc :set makeprg=gcc\ -o\ vimout\ %\ &&\ ./vimout<CR>
	"haskell
    "autocmd Filetype haskell setlocal makeprg=ghc\ %\ &&\ ./a.out
    autocmd Filetype haskell setlocal makeprg=ghci\ %
    autocmd Filetype haskell setlocal autowrite
    autocmd Filetype haskell nmap <Leader>mh :set makeprg=ghci\ %<CR>
    autocmd Filetype haskell nmap <Leader>mH :set makeprg=ghc\ -o\ vimout\ %\ &&\ ./vimout<CR>

    "Prolog Settins
    let g:filetype_pl="prolog"
    autocmd Filetype prolog setlocal makeprg=swipl\ %
    autocmd Filetype prolog nmap <Leader>mm :!swipl %<CR>
    autocmd Filetype prolog setlocal autowrite

    "Digraph Latin Subscripts
	execute "digraphs ks " . 0x2096 
        execute "digraphs as " . 0x2090
        execute "digraphs es " . 0x2091
        execute "digraphs hs " . 0x2095
        execute "digraphs is " . 0x1D62
        execute "digraphs ks " . 0x2096
        execute "digraphs ls " . 0x2097
        execute "digraphs ms " . 0x2098
        execute "digraphs ns " . 0x2099
        execute "digraphs os " . 0x2092
        execute "digraphs ps " . 0x209A
        execute "digraphs rs " . 0x1D63
        execute "digraphs ss " . 0x209B
        execute "digraphs ts " . 0x209C
        execute "digraphs us " . 0x1D64
        execute "digraphs vs " . 0x1D65
        execute "digraphs xs " . 0x2093
"==============================================================================


"PLUGIN SETTINGS
"==============================================================================
    "NerdTree
    if isdirectory(expand("~/.vim/bundle/nerdtree"))
	nnoremap <leader>e :NERDTreeFind<CR>
	let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$',
		    \'^\.hg$', '^\.svn$', '\.bzr$']
    endif

    "Fugitive
    if isdirectory(expand("~/.vim/bundle/vim-fugitive"))
	nnoremap <silent> <leader>ga :Gcommit -i %<CR>
	nnoremap <silent> <leader>gA :Gcommit -a<CR>
	nnoremap <silent> <leader>gvd :Gvdiff<CR>
	nnoremap <silent> <leader>gs :Gstatus<CR>
	nnoremap <silent> <leader>gd :Gdiff<CR>
	nnoremap <silent> <leader>gc :Gcommit<CR>
	"nnoremap <silent> <leader>gb :Gblame<CR>
	nnoremap <silent> <leader>gl :Glog<CR>
	nnoremap <silent> <leader>gp :Git push<CR>
	nnoremap <silent> <leader>gr :Gread<CR>
	nnoremap <silent> <leader>gw :Gwrite<CR>
	nnoremap <silent> <leader>ge :Gedit<CR>
	" Mnemonic _i_nteractive
	nnoremap <silent> <leader>gi :Git add -p %<CR>
	nnoremap <silent> <leader>gg :SignifyToggle<CR>
	autocmd User fugitive
		    \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
		    \   nnoremap <buffer> .. :edit %:h<CR> |
		    \ endif
    endif

    "Vim-easy-align
    if isdirectory(expand("~/.vim/bundle/vim-easy-align"))
	" Start interactive EasyAlign in visual mode (e.g. vipga)
	xmap ga <Plug>(EasyAlign)
	xmap Ga <Plug>(LiveEasyAlign)
	" Start interactive EasyAlign for a motion/text object (e.g. gaip)
	nmap ga <Plug>(EasyAlign)
	nmap Ga <Plug>(LiveEasyAlign)
    endif

    "Emmet-vim
    if isdirectory(expand("~/.vim/bundle/emmet-vim"))
	let g:user_emmet_leader_key='<C-E>'
	"let g:user_emmet_install_global = 0
	"autocmd FileType html,css,javascript,php EmmetInstall
    endif

    "Ctrlp
    if isdirectory(expand("~/.vim/bundle/ctrlp.vim"))
	let g:ctrlp_working_path_mode = 'ra'
	set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class,*.pyc,*.ctxt,*.bluej
    endif

    if isdirectory(expand("~/.vim/bundle/ctrlp-funky"))
	nnoremap <Leader>f :CtrlPFunky<Cr>
	"nnoremap <Leader>g :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
    endif

    "Latex-Suite
    if isdirectory(expand("~/.vim/bundle/vim-latex"))
	" override <Leader>lv
	nnoremap <Leader>lv :silent !open expand("%:r") . '.pdf'<CR>:echo worked!<CR>

	" IMPORTANT- grep will sometimes skip displaying the file name if you
	" search in a singe file. This will confuse Latex-Suite. Set your grep
	" program to always generate a file-name."
	set grepprg=grep\ -nH\ $*

	" compile to pdf and use preview
	let g:Tex_DefaultTargetFormat='pdf'

	" pdf compile and view settings
	" let g:Tex_ViewRule_pdf='Skim'
	let g:Tex_CompileRule_pdf='latexmk -pdf'

	" dvi compile and view settings
	let g:Tex_ViewRule_dvi="Skiim"
	let g:Tex_CompileRule_dvi='latex -src -specials -interaction=nonstopmode $*'

	" ignore all warnings below level 4
	let g:TCLevel=4

	" go to first error after pressing \ll
	let g:Tex_GotoError=1

	" one last thing for latex
	let g:tex_flavor='latex'
    endif

    "Matchit
    if isdirectory(expand("~/.vim/bundle/matchit"))
	let b:match_ignorecase = 1
    endif

    "Wordy
    if isdirectory(expand("~/.vim/bundle/vim-wordy"))
	noremap <silent> <F8> :<C-u>NextWordy<cr>
	xnoremap <silent> <F8> :<C-u>NextWordy<cr>
	inoremap <silent> <F8> <C-o>:NextWordy<cr>
    endif
    "XML-Foldint
    "if isdirectory(expand("~/.vim/bundle/XML-Folding"))
    "au BufNewFile,BufRead *.xml,*.htm,*.html so XMLFolding
    "endif
    "
    "Vim-Spellcheck-toggle
    if isdirectory(expand("~/.vim/bundle/vim-spellcheck-toggle"))
	map <F6> :call ToggleSpell()<CR>
    endif
    "Airline
    if isdirectory(expand("~/.vim/bundle/vim-airline"))
	set laststatus=2
	let g:airline_powerline_fonts = 1
	let g:airline_theme='base16_atelierlakeside'
	let g:airline_left_sep = ''

	if !exists('g:airline_symbols')
	    let g:airline_symbols = {}
	endif

	let g:airline_symbols.branch = ''
	let g:airline_symbols.readonly = ''
	let g:airline_symbols.linenr = ''
    endif

    "Syntastic
    if isdirectory(expand("~/.vim/bundle/syntastic"))
	set statusline+=%#warningmsg#
	set statusline+=%{SyntasticStatuslineFlag()}
	set statusline+=%*

	let g:syntastic_always_populate_loc_list = 1
	let g:syntastic_auto_loc_list = 1
	let g:syntastic_check_on_open = 1
	let g:syntastic_check_on_wq = 0
    endif

    "Ultisnips
    if isdirectory(expand("~/.vim/bundle/ultisnips"))
	let g:UltiSnipsUsePythonVersion = 3
	let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
	" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
	let g:UltiSnipsExpandTrigger="<tab>"
	let g:UltiSnipsListSnippetst="<c-tab>"
	let g:UltiSnipsJumpForwardTrigger="<c-j>"
	let g:UltiSnipsJumpBackwardTrigger="<c-k>"
	inoremap <c-x><c-k> <c-x><c-k>
	" If you want :UltiSnipsEdit to split your window.
	let g:UltiSnipsEditSplit="vertical"
    endif

    if isdirectory(expand("~/.vim/bundle/youcompleteme"))
	let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
	let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
    endif

    if isdirectory(expand("~/.vim/bundle/tagbar"))
        nmap <F7> :TagbarToggle<CR>
    endif

    if isdirectory(expand("~/.vim/bundle/gundo.vim"))
	nnoremap <leader>u :GundoToggle<CR>
	if has('python3')
	    let g:gundo_prefer_python3 = 1          " anything else breaks on Ubuntu 16.04+
	endif
    endif

    if isdirectory(expand("~/.vim/bundle/vim-notes"))
	let g:notes_directories = ['~/Dropbox/Vim Notes']
	let g:notes_suffix = '.note'
	"let g:notes_tab_indents = 0
    endif
