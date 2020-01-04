"                #
"               ###
"   ##           #
"   ##
"    ##    ### ###   ### /### /###   ###  /###     /###
"     ##    ### ###   ##/ ###/ /##  / ###/ #### / / ###  /
"     ##     ### ##    ##  ###/ ###/   ##   ###/ /   ###/
"     ##      ## ##    ##   ##   ##    ##       ##
"     ##      ## ##    ##   ##   ##    ##       ##
"     ##      ## ##    ##   ##   ##    ##       ##
"     ##      ## ##    ##   ##   ##    ##       ##
"     ##      /  ##    ##   ##   ##    ##       ###     /
"      ######/   ### / ###  ###  ###   ###       ######/
"       #####     ##/   ###  ###  ###   ###       #####

"vim-plug Plugins
call plug#begin('~/.vim/plugged')
	Plug 'junegunn/goyo.vim'
	Plug 'airblade/vim-gitgutter'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-repeat'
call plug#end()

"cursor changes according to mode
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' |
    \   silent execute '!echo -ne "\e[5 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[3 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

set nocompatible              " be iMproved, required
filetype off                  " required
syntax on
set number relativenumber
set wrapmargin=8
colorscheme iceberg
set tabstop=2
set shiftwidth=2
set timeoutlen=2000
set laststatus=2
"
"My custom Vimscripts
let mapleader=","	"Leader key is ,

"Editing my .vimrc on the fly
nnoremap <leader>ev :split $MYVIMRC<cr>
"Sourcing the shit out of that .vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>
"Opening Terminal
nnoremap <leader>t :term<cr>

" Copy selected text to system clipboard:
	vnoremap <C-c> "+y
	map <C-p> "+P

"Navigating with guides
inoremap <leader><leader> <Esc>/<++><Enter>"_c4l
vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
map <leader><leader> <Esc>/<++><Enter>"_c4l

" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l
" Splits open at the bottom and right
set splitbelow splitright
" Enable tab autocompletion
set wildmode=longest,list,full

" Select all in normal mode
nnoremap <c-a> gg^vG$
" Select all in visual mode
vnoremap <c-a> <Esc>gg^vG$
" Select all in insert mode
inoremap <c-a> <Esc>gg^vG$
" Operator all
onoremap <c-a> :<c-u>normal! gg^vG$<cr>

" operator in next parentheses
"onoremap in( :<c-u>normal! f(vi(<cr>
" operator in last parentheses
"onoremap il( :<c-u>normal! F(vi(<cr>
" operator around next parentheses
"onoremap an( :<c-u>normal! f(va(<cr>
" operator around last parentheses
"onoremap al( :<c-u>normal! F(va(<cr>

" operator in next curly brackets
"onoremap in{ :<c-u>normal! f{vi{<cr>
"" operator in last curly brackets
"onoremap il{ :<c-u>normal! F{vi{<cr>
"" operator around next curly brackets
"onoremap an{ :<c-u>normal! f{va{<cr>
"" operator around last curly brackets
"onoremap al{ :<c-u>normal! F{va{<cr>
"
"Code Snippets
""Bash
augroup filetype_bash
		autocmd!
		autocmd Filetype sh inoremap ,if if<space>[[<space><++><space>]];<space>then<cr><++><cr>fi<esc>2k^
		autocmd Filetype sh inoremap ,else if<space>[[<space><++><space>]];<space>then<cr><++><cr>else<cr><++><cr>fi<Esc>2k^
		autocmd Filetype sh inoremap ,elif if<space>[[<space><++><space>]];<space>then<cr><++><cr>elif<space>[[<space><++><space>]];<space>then<cr><++><cr>else<cr><++><cr>fi<Esc>6k^
		autocmd Filetype sh inoremap ,case case<space>$<++>in<space><cr>(<space><++><space>)<cr><++><cr>;;<cr>esac<Esc>4k^
		autocmd Filetype sh inoremap ,for for<space>((<space><++><space>));<space>do<cr><++><cr>done<Esc>2k^
		autocmd Filetype sh inoremap ,forin for<space><++><space>in<space>{<space><++><space>};<space>do<cr><++><cr>done<Esc>2k^
		autocmd Filetype sh inoremap ,while while<space>[[<space><++><space>]];<space>do<cr><++><cr>done<Esc>2k^
		autocmd Filetype sh inoremap ,until until<space>[[<space><++><space>]];<space>do<cr><++><cr>done<Esc>2k^
		autocmd Filetype sh inoremap ,select select<space>$<++><space>in<space><++>;do<cr><++><cr>done<Esc>2k^
		autocmd Filetype sh inoremap ,func <++><space>()<space>{<cr><Tab><++><cr>return<space><++><cr><BS>}<Esc>3k^
		autocmd Filetype sh inoremap ,( $((<space><++><space>))<Esc>^
		autocmd Filetype sh inoremap ,{ {<space><++><space>}<Esc>^
augroup END
""
"" Markdown
augroup filetype_markdown
		autocmd!
		" operator inside Heading 1
		autocmd Filetype markdown onoremap iH :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>
		"" operator around Heading 1
		autocmd Filetype markdown onoremap aH :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rg_vk0"<cr>
		"" operator inside Heading 2
		autocmd Filetype markdown onoremap ih :<c-u>execute "normal! ?^--\\+$\r:nohlsearch\rkvg_"<cr>
		" operator around Heading 2
		autocmd Filetype markdown onoremap ah :<c-u>execute "normal! ?^--\\+$\r:nohlsearch\rg_vk0"<cr>
augroup END
""
"" CPlusPlus
""augroup filetype_cpp
""				autocmd!
""				autocmd BufWritePost *.cpp :! g++ % -o %:r && ./%:r
""augroup END
""
"" stage current file to git
nnoremap <leader>ga :! git add %<cr>
""
"" Latex
augroup filetype_tex
				autocmd!
				autocmd BufWritePost *.tex :! pdflatex -output-directory .. -jobname NXCCheatsheet main.tex
				autocmd Filetype tex inoremap ,env <Bslash>begin{<++>}<cr><Tab><++><cr><Bslash>end{<++>}<Esc>2k^
augroup END
