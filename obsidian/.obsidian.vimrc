

" Easy visual indentation ---------------
vnoremap < <gv
vnoremap > >gv


"" Highlight search clear ---------------
nmap <esc><esc> :noh<return>

" Insert empty line below or above and re-enter normal mode
nmap oo o<Esc>m
nmap OO O<Esc>n

" Movement in Normal Mode ---------------
noremap t h
noremap n gj
noremap m gk
noremap s l

noremap T H
noremap S L

" --- Movement in Visual Mode ---------------
vnoremap t h
vnoremap n j
vnoremap m k
vnoremap s l
vnoremap T H
vnoremap S L

" Next matching search pattern and previous match ---------------
noremap j n
noremap J N

" prev word, next word and end next word ---------------
noremap k w
noremap K W
noremap h b
noremap H B
noremap b e
noremap B E

vnoremap k w
vnoremap K W
vnoremap h b
vnoremap H B
vnoremap b e
vnoremap B E

"" BOL, EOL and Soft BOL
noremap å 0
noremap ö $
noremap Å _

noremap ä s
noremap Ä S

exmap surround_wiki surround [[ ]]
exmap surround_double_quotes surround " "
exmap surround_single_quotes surround ' '
exmap surround_backticks surround ` `
exmap surround_brackets surround ( )
exmap surround_square_brackets surround [ ]
exmap surround_curly_brackets surround { }

" NOTE: must use 'map' and not 'nmap'
map [[ :surround_wiki
nunmap w
vunmap w
map w" :surround_double_quotes
map w' :surround_single_quotes
map w` :surround_backticks
map wb :surround_brackets
map w( :surround_brackets
map w) :surround_brackets
map w[ :surround_square_brackets
map w[ :surround_square_brackets
map w{ :surround_curly_brackets