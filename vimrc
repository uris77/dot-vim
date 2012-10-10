" Example Vim configuration.
" Copy or symlink to ~/.vimrc or ~/_vimrc.

set nocompatible                  " Must come first because it changes other options.

silent! call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
call pathogen#infect()
set backupdir=/home/rguerra/tmp
set directory=/home/rguerra/tmp

let mapleader = ","

set mouse=a
set nocopyindent

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

runtime macros/matchit.vim        " Load the matchit plugin.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location
set noswapfile                    "disable swap files"

" UNCOMMENT TO USE
set tabstop=3                   " Global tab width.
set shiftwidth=3                 " And again, related.
set softtabstop=3
set expandtab                    " Use spaces instead of tabs
set autoindent shiftwidth=3
filetype plugin on

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

"easier formatting of paragraphs
"Automatically wrap a block of code to the colorcolumn length.
"vmap Q gq
"nmap Q gqap

" Tab mappings.
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove

" Uncomment to use Jamis Buck's file opening plugin
"map <Leader>t :FuzzyFinderTextMate<Enter>

" Controversial...swap colon and semicolon for easier commands
"nnoremap ; :
"nnoremap : ;

"vnoremap ; :
"vnoremap : ;

" Automatic fold settings for specific files. Uncomment to use.
autocmd FileType ruby setlocal foldmethod=syntax tabstop=2 autoindent shiftwidth=2 softtabstop=2 expandtab
autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2
autocmd FileType python  setlocal foldmethod=indent shiftwidth=4 tabstop=4 softtabstop=4 expandtab autoindent colorcolumn=80
autocmd FileType groovy setlocal foldmethod=syntax tabstop=4 autoindent shiftwidth=4 softtabstop=4 expandtab
au BufNewFile, BufRead *.groovy setf groovy
highlight ColorColumn ctermbg=233

" For the MakeGreen plugin and Ruby RSpec. Uncomment to use.
autocmd BufNewFile,BufRead *_spec.rb compiler rspec


" Jump to last cursor position unless it's invalid or in an event handler
autocmd BufReadPost * 
   \ if line("'\"") > 0 && line("'\"") <= line("$") | 
   \     exe "normal g'\"" |
   \ endif

" Map ,e and ,v to open files in the same directory as the current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

" Ignore some files from ctrlp search
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class,*.git,*/.git/*,*.cvs,*.svn,*.pyc

" Misc Key Maps
" Insert a hash rocket with <c-l>
imap <c-l> <space>=><space>
" Clear the search buffer when hitting return
nnoremap <CR> :nohlsearch<cr>

" MULTIPURPOSE TAB KEY
" Indent if we are at the beginning of line. Else do completion.
function! InsertTabWrapper()
   let col = col('.') - 1
   if !col || getline('.')[col - 1] !~ '\k'
      return "\<tab>"
   else
      return "\<c-p>"
   endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

" Map :W to :w
command! W :w

set cmdheight=1

ab teh the
ab require_reltaive require_relative
ab require_relateive require_relative
ab jqi $('');
ab koo ko.observable();
ab kooa ko.observableArray([]);
ab kodb data-bind=""
ab koapb ko.applyBinding();
ab <html> <html><CR></html>
ab <body> <body><CR></body>
ab <head> <head><CR></head>
ab <title> <title><CR></title>
ab htable <table><CR></table>
ab <g:link> <g:link><CR></g:link>
ab <g:form> <g:form><CR></g:form>
ab sgwt <Tab>def ""()<CR>{<CR><Tab>given:<CR><CR>when:<CR><CR>then:<CR>}
ab jblock {% block %}<CR>{% endblock %}
ab jfor {% for %}<CR>{% endfor %}


"Show whitespace
"MUST come BEFORE colorscheme command
"autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
"au InsertLeave * match ExtraWhitespace /\s\+$/

"Solarized Theme
"syntax enable
"set background=dark
"colorscheme solarized
" Or use vividchalk
colorscheme vividchalk
"colorscheme pablo

hi CursorLine cterm=None ctermbg=lightgreen ctermfg=yellow guibg=darkred guifg=white
hi CursorColumn cterm=None ctermbg=lightgreen ctermfg=yellow guibg=darkred guifg=white
nnoremap <Leader>h :set cursorline! cursorcolumn! <CR>

set omnifunc=htmlcomplete#CompleteTags
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType gsp set omnifunc=htmlcomplete#CompleteTags
autocmd FileType jinja set omnifunc=htmlcomplete#CompleteTags
let b:closetag_html_style=1
source ~/.vim/dotvim-full/plugin/closetag.vim
au FileType html,xml,xsl,gsp,jinja source ~/.vim/dotvim-full/plugin/closetag.vim

augroup BWCCreateDir
    au!
    autocmd BufWritePre * if expand("<afile>")!~#'^\w\+:/' && !isdirectory(expand("%:h")) | execute "silent! !mkdir -p ".shellescape(expand('%:h'), 1) | redraw! | endif
augroup END

"Automatic reloading of vimrc
autocmd! bufwritepost .vimrc source %

"Better copy & paste
set pastetoggle=<F2>
set clipboard=unnamed

" bind Ctrl+<movement> keys to move around windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-l> <c-w>l

" Create vertical split with c-m
map <c-m> :vnew<CR>

" map sort function to a key
" useful for sortin python imports alphabetically
vnoremap <Leader>S :sort<CR>

" easier moving of code blocks
"Allows you to select a block of code and indent the entire block
vnoremap < <gv
vnoremap > >gv 

"Only enable closetag for html, jinja, erb and gsp files.
autocmd FileType html,jinja,erb,gsp,mako,xhtml let b:closetag_html_style=1
autocmd FileType html,jinja,erb,gsp,mako,xhtml source ~/.vim/bundle/closetag.vim/plugin/closetag.vim

"dwm width
"let dwm_master_pane_width="70%"
"
"Automatic resize split
set winwidth=30
set winminwidth=5
set winheight=30
"set winminheight=5

"Use + or - to increease or decrease windows by same amount
nnoremap <silent> + :exe "vertical resize " . (winwidth(0) * 3/2) <CR>
nnoremap <silent> - :exe "vertical resize " . (winwidth(0) * 2/3) <CR>
