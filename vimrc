autocmd Filetype vim setlocal foldmethod=indent
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
    Plugin 'tpope/vim-fugitive'
    Plugin 'scrooloose/nerdtree'
    Plugin 'kien/ctrlp.vim'
    Plugin 'tacahiroy/ctrlp-funky'
    Plugin 'junegunn/vim-easy-align'
    Plugin 'tpope/vim-surround'
    Plugin 'tpope/vim-repeat'
    Plugin 'rhysd/conflict-marker.vim'
    Plugin 'jiangmiao/auto-pairs'
    "Plugin 'easymotion/vim-easymotion' need to set it up properly
    Plugin 'nathanaelkane/vim-indent-guides'
    Plugin 'mhinz/vim-signify'
    Plugin 'osyo-manga/vim-over'

    "HTML
    Plugin 'mattn/emmet-vim'
    Plugin 'emmetio/emmet'

    "Python
    Plugin 'klen/python-mode'
    Plugin 'vim-scripts/python_match.vim'
    Plugin 'vim-scripts/pythoncomplete'

    call vundle#end()            " required
    filetype plugin indent on    " required
"==============================================================================


"Pure Vim Settings
"==============================================================================
    let mapleader = " "
    set mouse=a

    set relativenumber "sets makes line number count relative to current line
    set tw=79
    set cc=80
    "sudo save
    cmap w!! w !sudo tee > /dev/null %

    "Indents
    set ts=8 sts=4 sw=4 noexpandtab

    "one-time cure for backslashitis
    noremap ;; :%s:::g<Left><Left><Left>
    noremap ;' :%s:::cg<Left><Left><Left><Left>'

    "leader shortcuts
    nnoremap <leader>y "*y
    nnoremap <leader>p "*p
    nnoremap <silent> <leader>w :cwindow<CR>

    "Filetype shiftwidths
    autocmd Filetype html setlocal sts=2 sw=2 noexpandtab
    autocmd Filetype css setlocal sts=2 sw=2 noexpandtab
    autocmd Filetype latex setlocal sts=2 sw=2 expandtab
    autocmd Filetype haskell setlocal sts=4 sw=4 expandtab

    "Make defaults
	"python
    autocmd Filetype python setlocal makeprg=python3\ %
    autocmd Filetype python setlocal autowrite
    nmap <Leader>m :make<CR>
    nmap <Leader>mm :make<CR>
    nmap <Leader>mn :set makeprg=
    nmap <Leader>mp :set makeprg=python3\ %<CR>
    nmap <Leader>mP :set makeprg=python\ %<CR>
    nmap <Leader>ma :set autowrite<CR>
	"c
    autocmd Filetype c setlocal makeprg=gcc\ %\ &&\ ./a.out
    autocmd Filetype c setlocal autowrite
    nmap <Leader>mc :set makeprg=gcc\ %\ &&\ ./a.out<CR>
	"haskell
    "autocmd Filetype haskell setlocal makeprg=ghc\ -o\ vimout\ %\ &&\ ./vimout
    autocmd Filetype haskell setlocal makeprg=ghci\ %
    autocmd Filetype haskell setlocal autowrite
    nmap <Leader>mh :set makeprg=ghci\ %<CR>
    nmap <Leader>mH :set makeprg=ghc\ -o\ vimout\ %\ &&\ ./vimout<CR>

    "Prolog Settins
    let g:filetype_pl="prolog"
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
	let g:user_emmet_leader_key='<C-J>'
	"let g:user_emmet_install_global = 0
	"autocmd FileType html,css,javascript,php EmmetInstall
    endif

    "Ctrlp
    if isdirectory(expand("~/.vim/bundle/ctrlp.vim"))
	let g:ctrlp_working_path_mode = 'ra'
	 set wildignore+=*/tmp/*,*.so,*.swp,*.zip  
    endif
