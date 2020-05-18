"This is my vimrc file

"Set compatibility to Vim only.
  set nocompatible

"Get the defaults that most users want.
  source $VIMRUNTIME/defaults.vim

"Spellchecks and spelling correction
  autocmd FileType latex,tex,md setlocal spell
  set spell spelllang=en_gb 
  inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

"Turn on syntax highlighting.
  syntax on
  autocmd BufEnter * :syntax sync fromstart

"For plug-ins to load correctly.
  filetype plugin indent on

"Turn off modelines
  set modelines=0

"Automatically wrap text that extends beyond the screen length.
  set wrap

"Vim's auto indentation feature does not work properly with text copied from outside of Vim. Press the <F2> key to toggle paste mode on/off - not sure I understnad this at the moment.
	nnoremap <F2> :set invpaste paste?<CR>
	imap <F2> <C-O>:set invpaste paste?<CR>
	set pastetoggle=<F2>

"Uncomment below to set the max textwidth. Use a value corresponding to the width of your screen.
	set textwidth=100
	set formatoptions=tcqrn1
	set tabstop=2
	set shiftwidth=2
	set softtabstop=2
	set expandtab
	set noshiftround

"Display 5 lines above/below the cursor when scrolling with a mouse.
	set scrolloff=5

"Fixes common backspace problems
	set backspace=indent,eol,start

"Speed up scrolling in Vim
	set ttyfast

"Status bar
	set laststatus=2

"Display options
	set showmode
	set showcmd

"Highlight matching pairs of brackets. Use the '%' character to jump between them.
	set matchpairs+=<:>

"Display different types of white spaces.
	set list
	set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

"Show line numbers
	set number

"Set status line display
	set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

"Encoding
	set encoding=utf-8

"Switch on highlighting the last used search pattern
	if &t_Co > 2 || has("gui_running")
  	set hlsearch
	endif

"Enable incremental search
	set incsearch

"Include matching uppercase words with lowercase search term
	set ignorecase

"Include only uppercase words with uppercase search term
	set smartcase

"Clear highlighting
nnoremap <silent> <S-h> :let @/="" <return><esc>

"Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
	set viminfo='100,<9999,s100

"Map the <Space> key to toggle a selected fold opened/closed.
	nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
	vnoremap <Space> zf

"Automatically save and load folds
	autocmd BufWinLeave *.* mkview
	autocmd BufWinEnter *.* silent loadview"

"When started as "evim", evim.vim will already have done these settings, bail
"out.
	if v:progname =~? "evim"
  	finish
	endif

"###################################################################"
"------------------------Related to backups-------------------------"
"###################################################################"
	if has("vms")
  	set nobackup		" do not keep a backup file, use versions instead
	else
  	set backup		" keep a backup file (restore to previous version)
  	if has('persistent_undo')
    	set undofile	" keep an undo file (undo changes after closing)
  	endif
	endif

"Vim backups when writing to a file

"Where to store backups
	set backupdir=~/.vim/backup//

"Make backup before overwriting the current buffer
  set writebackup

"Overwrite the original backup file
  set backupcopy=yes

  "Meaningful backup name, ex: filename@2015-04-05.14:59
  au BufWritePre * let &bex = '@' . strftime("%F.%H:%M")

"###################################################################"

"Put these in an autocmd group, so that we can delete them easily.
"	augroup vimrcEx
"  	au!

"Allows profiling in Syntastic - must be placed before plugin manager
	profile start syntastic.log
	profile! file */syntastic/*

"Automatically install vim_plug manager
	if empty(glob('~/.vim/autoload/plug.vim'))
  	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plu:let @/=""g.vim
  	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
	endif

"#######################################"
"Vim plugins - directory below is default
"#######################################"

	call plug#begin(expand('~/.vim/plugged'))

"Awesome vim-airline theme
	Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
  let g:airline_theme='solarized'
  let g:airline_solarized_bg='dark'
  let g:airline_powerline_fonts = 1
  let g:airline_statusline_ontop=1
  let g:airline_whitespace=1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline#extensions#tabline#formatter = 'default'

"Syntastic code syntax checker - requires external syntax executables
  Plug 'vim-syntastic/syntastic'
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0

"Miscellaneous vim-script functions plugin required by some plugins
	Plug 'xolox/vim-misc' 

"Easytags makes automatic tags and tag syntax highlighting - IDE tool
"Requires exctags!
	Plug  'xolox/vim-easytags'

"Tagbar - a class outline viewer for Vim
	Plug 'majutsushi/tagbar'

"Vimtex
	Plug 'lervag/vimtex'
  let g:tex_flavor='latex'
  let g:vimtex_view_method='zathura'
  let g:vimtex_quickfix_mode=0
  set conceallevel=1
  let g:tex_conceal='abdmg'
  hi Conceal ctermbg=none

"CSV files plugin 
  "csv.vim

"Vimtex shortcuts
  nnoremap <space> <Nop>
  let mapleader="\<space>"
  let maplocalleader="\<space>"

"Ultisnips
	Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsJumpForwardTrigger="<tab>"
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
  let g:UltiSnipsEditSplit="vertical"
  let g:UltiSnipsSnippetsDir = $HOME.'/.vim/UltiSnips'

"Nord colorscheme
	"Plug 'arcticicestudio/nord-vim'

"Gruvbox colorscheme
	Plug 'morhetz/gruvbox'

"nerdtree file manager in vim
	Plug 'preservim/nerdtree'
"Autostarts if no file chosen
	autocmd StdinReadPre * let s:std_in=1 
	autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"Key binding to open
	map <C-S-p> :NERDTreeToggle<CR>

"Showing git changes
	Plug 'airblade/vim-gitgutter'

"vim-eunuch bash file commands in vim
	"Plug 'tpope/vim-eunuch'

"Multiple cursors
	Plug 'terryma/vim-multiple-cursors'

"Git commands in vim
"Plug 'tpope/vim-fugitive'

"True Git integration in vim
	Plug 'jreybert/vimagit'

call plug#end()

"#######################################"

"Gruvbox options - more online
	let g:gruvbox_contrast_dark= 'hard'
	let g:gruvbox_italic = '1'
	let g:gruvbox_italicize_comments = '1'
	let g:gruvbox_vert_split = 'bg0'

"Apply Gruvbox colorscheme
	"autocmd vimenter * colorscheme gruvbox
