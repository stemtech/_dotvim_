" Inspired from VIMCASTS

" No VI compatiblity
set nocompatible

filetype on

" Remove pesky messages when buffers are modified and not saved
set hidden

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
set columns             " display columns numbers
hi CursorLine   cterm=bold ctermbg=blue  ctermfg=NONE guibg=darkred guifg=white
" hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
nnoremap <Leader>h :set cursorline!<CR>
" nnoremap <Leader>h :set cursorline! cursorcolumn!<CR>

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
" Indent program
set equalprg=astyle


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
let &statusline = ' %f %m %r%{&foldenable!=0?"[fen]":""}%=%c %l/%L (%p%%) %{"[".(&fenc!=""?&fenc:&enc)."][".&ff."]"}'

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
  autocmd FileType trace32  setlocal ts=2 sts=2 sw=2 expandtab
  "autocmd FileType trace32  source  

  " PlantUML file
  autocmd FileType plantuml  setlocal ts=8 sts=4 sw=4 expandtab foldmethod=indent smartindent

  " Customisations based on house-style (arbitrary)
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab
   
  " Treat ho,hi,hc,hm,ht files as C files
  autocmd BufNewFile,BufRead *.h[cimoptv] set filetype=c
  " Treat .rss files as XML
  autocmd BufNewFile,BufRead *.rss set filetype=xml
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

" Butane plugin shortcuts to handle buffers
noremap <leader>bd :Bclose<CR>      " Close the buffer.
noremap <leader>bl :ls<CR>          " List buffers.
noremap <leader>bn :bn<CR>          " Next buffer.
noremap <leader>bp :bp<CR>          " Previous buffer.
noremap <leader>bt :b#<CR>          " Toggle to most recently used buffer.
noremap <leader>bq :Bclose!<CR>     " Close the buffer & discard changes.

" Doxygen shortcuts
nmap <leader>dh :DoxyFILEHeader<CR>
nmap <leader>df :DoxyFunction<CR>
nmap <leader>dd :DoxyBriefDetailed<CR>
nmap <leader>db :DoxyBlockLong<CR>
nmap <leader>dc :DoxyBlockShort<CR>
nmap <leader>dm :DoxyBriefAfterMember<CR>
nmap <leader>dn :DoxyNote<CR>

" TagList plugin configuration
" filetype on
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_Close_On_Select      = 0 " Don't close the window when a tag or a file has been selected
let Tlist_Exit_OnlyWindow      = 1 " Close Vim when tags window is the last one
let Tlist_Use_SingleClick      = 0 " Double click
let Tlist_Auto_Highlight_Tag   = 0 " Highllight is enabled
let Tlist_Show_One_File        = 0 " Display all files
let Tlist_File_Fold_Auto_Close = 1 " Fold automatically inactive files
let Tlist_Display_Prototype    = 0 " Display only the tag, not its prototype
let Tlist_Use_Horiz_Window     = 0 " Use a vertical window instead of an horizontal one
let Tlist_Use_Right_Window     = 1 " Tags window is on the right
let Tlist_Auto_Open            = 0 " Open automatically the tags window when Vim starts

" CLang autocompletion
" Avoid freezing on offending code
let g:clang_user_options='|| exit 0'
let g:clang_close_preview=1
" highlight the warnings and errors
let g:clang_hl_errors=1
" open quickfix window on error
let g:clang_complete_copen=1
" use libclang directly, fast due to caching
let g:clang_use_library=1
" tell clang_complete where to find libclang
let g:clang_library_path = '/usr/lib'
" Complete options (disable preview scratch window)
" set completeopt = menu,menuone,longest
" Limit popup menu height
" set pumheight = 15
" Disable auto popup, use <Tab> to autocomplete
let g:clang_complete_auto = 0
" Show clang errors in the quickfix window
let g:clang_complete_copen = 1
" SuperTab option for context aware completion
let g:SuperTabDefaultCompletionType = "context"
       

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

function! UpdateTags()
  execute ":!ctags -R --exclude=\"*qct*\" --exclude=\"*ykem*\" --exclude=\"*out*\" --exclude=\"*svn*\" --exclude=\"build/*\" --fields=+l --c-kinds=+p --c++-kinds=+p --extra=+q --file-scope=no --langmap=c:+.ht.hm.hc.hi.ho.hp.hv"
"  execute ":!ctags -R --languages=C++ --c++-kinds=+p --fields=+iaS --extra=+q ./"
  echohl StatusLine | echo "C/C++ tag updated" | echohl None
endfunction
nnoremap <F4> :call UpdateTags()

if has("cscope")
        set csprg=/usr/bin/cscope
        set csto=0
        set cst
        set nocsverb
        " add any database in current directory
        if filereadable("cscope.out")
            cs add cscope.out
        " else add database pointed to by environment
        elseif $CSCOPE_DB != ""
            cs add $CSCOPE_DB
        endif
        set csverb

        map <F5> :!cscope -Rbq<CR>:cs reset<CR><CR> 

	map <C-_> :cstag <C-R>=expand("<cword>")<CR><CR>
	map g<C-]> :cs find 3 <C-R>=expand("<cword>")<CR><CR>
	map g<C-\> :cs find 0 <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-_>i :cs find i <C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>

	" Using 'CTRL-spacebar' then a search type makes the vim window
	" split horizontally, with search result displayed in
	" the new window.

	nmap <C-Space>s :scs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>g :scs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>c :scs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>t :scs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>e :scs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-Space>i :scs find i <C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-Space>d :scs find d <C-R>=expand("<cword>")<CR><CR>

	" Hitting CTRL-space *twice* before the search type does a vertical
	" split instead of a horizontal one

	nmap <C-Space><C-Space>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space><C-Space>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space><C-Space>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space><C-Space>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space><C-Space>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space><C-Space>i :vert scs find i <C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-Space><C-Space>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>
endif

