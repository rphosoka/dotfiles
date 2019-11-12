" mattn/emmet-vim
let g:user_emmet_mode = 'iv'
let g:user_emmet_leader_key = '<C-T>'
let g:use_emmet_complete_tag = 1
let g:user_emmet_settings = {
\	'variables' : {
\		'lang' : "ja"
\	},
\	'html' : {
\		'indentation' : '  ',
\		'snippets' : {
\		'html:5': "<!DOCTYPE html>\n"
\			."<html lang=\"${lang}\">\n"
\			."<head>\n"
\			."\t<meta charset=\"${charset}\">\n"
\			."\t<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n"
\			."\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n"
\			."\t<title></title>\n"
\			."</head>\n"
\			."<body>\n\t${child}|\n</body>\n"
\			."</html>",
\		}
\	}
\}

" tyru/open-browser.vim
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
