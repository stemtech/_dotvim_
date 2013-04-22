" Inspired from VIMCASTS

" No VI compatiblity
set nocompatible

filetype on

" First, load all plugins
" runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()

" Remap the leader key
let mapleader = ','

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
 
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:◈

" Colors
colorscheme desert

" Display
" 
set t_Co=256 
let colors_name = "desert256" " enable cool colour scheme 
syntax enable           " enable without overwriting current colours
set number              " display line numbers

" Formatting
"
set backspace=indent,eol,start " allow backspace over all in insert mode
set nowrap                " soft wrap
set linebreak           " wrap on space
set expandtab           " tabs to spaces
set softtabstop=2       " spaces per tab
set foldmethod=indent   " zr and zm work by indent level
set foldlevel=24        " initially fold levels to 16
set shiftwidth=2        " size for folding
set autoindent          " indent of new line
set smartindent         " indent of new line too (C-style)   

" Searching
"
set ignorecase smartcase " abd case insensitive Abc not
set hlsearch            " highlight search items in text
set incsearch           " search as search term is being typed
set showmatch           " show matching brackets

" Status line
"
set laststatus=2        " always show status line
set ruler               " show cursor position
set showmode            " show current vim mode
set showcmd             " display incomplete commands
let &statusline = ' %f %m %r%{&foldenable!=0?"[fen]":""}%=%l/%L (%p%%) %{"[".(&fenc!=""?&fenc:&enc)."][".&ff."]"}'

" Command line
"
set history=5000        " keep 5000 lines of command line history
set report=0            " always report num lines changed
set wildchar=<TAB>      " command line expansion char  

" Miscellaneous
" 
set nocompatible        " not vi compatible
set noautowrite         " autosave off :next etc
set nobackup            " don't keep a backup file
set modeline
set modelines=8
set vb t_vb=            " silent bell

" GUI
"
"set mouse=a             " enable the mouse

" Autocompletion mode
set ofu=syntaxcomplete#Complete
highlight Pmenu      ctermfg = green  ctermbg = blue
highlight PmenuSel   ctermfg = blue   ctermbg = green
highlight PmenuSbar  ctermfg = yellow ctermbg = blue
"highlight PmenuThumb ctermfg = gray   ctermbg = red


"Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

autocmd VimEnter * NERDTree
autocmd BufEnter * NERDTreeMirror
autocmd VimEnter * wincmd w
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" NERD Commenter
let g:NERDAllowAnyVisualDelims = 1
let g:NERDBlockComIgnoreEmpty = 1
let g:NERDCommentWholeLinesInVMode = 2
let g:NERDCreateDefaultMappings = 1
" let g:NERDCustomDelimiters = 
let g:NERDDefaultNesting = 1
let g:NERDMenuMode = 3
" let g:NERDLPlace = 
let g:NERDUsePlaceHolders = 1
let g:NERDRemoveAltComs = 0
let g:NERDRemoveExtraSpaces = 1
" let g:NERDRPlace = 
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 0

" Doxygen
let g:load_doxygen_syntax=1
autocmd FileType    c               set syntax=c.doxygen
autocmd FileType    cpp             set syntax=cpp.doxygen


"Whitespace preferences and filetypes
" Only do this part when compiled with support for autocommands
if has("autocmd")
  " Enable file type detection
  filetype on
   
  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab foldmethod=indent smartindent
  autocmd FileType c    setlocal ts=8 sts=4 sw=4 expandtab foldmethod=indent smartindent
  autocmd FileType cpp  setlocal ts=8 sts=4 sw=4 expandtab foldmethod=indent smartindent

  " Trace32 
  autocmd FileType trace32  source  

  " PlantUML file
  autocmd FileType plantuml  setlocal ts=8 sts=4 sw=4 expandtab foldmethod=indent smartindent

  " Customisations based on house-style (arbitrary)
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
   
  " Treat ho,hi,hc,hm,ht files as C files
  autocmd BufNewFile,BufRead *.h[otmic] set filetype c
  " Treat .rss files as XML
  autocmd BufNewFile,BufRead *.rss set filetype xml
  " PlantUML file
  autocmd BufNewFile,BufRead *.uml set filetype=plantuml
  " Trace32 
  autocmd BufNewFile,BufRead *.t32 set filetype=trace32
  autocmd BufNewFile,BufRead *.cmm set filetype=trace32

""  " When starting to edit a file:
""  "   For C and C++ files set formatting of comments and set C-indenting
""  "   on. For other files switch it off. Don't change the order, it's
""  "   important that the line with * comes first.
""  autocmd FileType *          set formatoptions=tcql nocindent comments&
""  autocmd FileType c,cpp      set formatoptions=croql
""  autocmd FileType c,cpp      set cindent
""  autocmd FileType c,cpp      set comments=sr:/*,mb:*,el:*/,://
""  autocmd FileType c,cpp      set foldmethod=syntax
""  autocmd FileType c,cpp      set foldnestmax=1
""  if &columns >= 85
""    autocmd FileType c,cpp  set foldcolumn=2
""  endif
""  autocmd FileType c,cpp      set foldlevel=99
""
""  " >     normal indent
""  " e     additional indent for stuff inside braces
""  " n     additional indent code after if (etc)
""  "       without following braces
""  " f     first opening brace
""  " {     opening braces
""  " }     closing braces
""  " ^     additional indent first indention
""  " :     case labels
""  " =     idention after case labels
""  " l     case labels
""  " b     indention of final break in switch() { ... }
""  " g     c++ scope declarations
""  " h     c++ indention after scope labels
""  " p     parameter idention for k&r style code
""  " t     indent for type declaration on its own line
""  " i     c++ class decl and constructor indent
""  " +     indention of continuation lines
""  " c     comment indention
""  " C     see :help (comments with non-default openers)
""  " /     additional indent for comments
""  " (     additional indent for lines with unclosed parens
""  " u     same as ( but one level deeper
""  " U     see :help (unclosed parens with ')' as the
""  "       1st non-whitespace character)
""  " w     unclosed parens; alignment to to first condition
""  " W     unclosed parens with the opening paren as
""  "       the last non-ws character on the previous line
""  " m     align closing braces to lines of the opening one
""  " M     do not align closing braces the the opening one
""  " j     indent anon java classes correctly
""  " )     how many lines to search for unclosed parens
""  " *     how many lines to search for unclosed comments
""  " #     recognize shell/Perl comments
""  autocmd FileType c,cpp
""  \ set cinoptions=>s,e0,f0,{0,}0,^0,:0,=s,l1,b0,g0,h0,ps,t0,is,+s,c3,C0,/0,(0,u0,U0,w1,Ws,m1,M0,j1,)20,*30,#0
endif

" Strip trailing whitespaces
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" Capitalize, UPPERCASE & lowercase
if (&tildeop)
  nmap gcw guw~l
  nmap gcW guW~l
  nmap gciw guiw~l
  nmap gciW guiW~l
  nmap gcis guis~l
  nmap gc$ gu$~l
  nmap gcgc guu~l
  nmap gcc guu~l
  vmap gc gu~l
else
  nmap gcw guw~h
  nmap gcW guW~h
  nmap gciw guiw~h
  nmap gciW guiW~h
  nmap gcis guis~h
  nmap gc$ gu$~h
  nmap gcgc guu~h
  nmap gcc guu~h
  vmap gc gu~h
endif

" Execute 'cmd' while redirecting output.
" Delete all lines that do not match regex 'filter' (if not empty).
" Delete any blank lines.
" Delete '<whitespace><number>:<whitespace>' from start of each line.
  " Display result in a scratch buffer.
function! s:Filter_lines(cmd, filter)
  let save_more = &more
  set nomore
  redir => lines
  silent execute a:cmd
  redir END
  let &more = save_more
  new
  setlocal buftype=nofile bufhidden=hide noswapfile
  put =lines
  g/^\s*$/d
  %s/^\s*\d\+:\s*//e
  if !empty(a:filter)
    execute 'v/' . a:filter . '/d'
  endif
  0
endfunction

command! -nargs=? Scriptnames call s:Filter_lines('scriptnames', <q-args>)

