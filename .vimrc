" --------------------------------------------------------------------------------------------
" 基本設定
" --------------------------------------------------------------------------------------------
" 文字コード
set encoding=utf-8
scriptencoding utf-8

" --------------------------------------------------------------------------------------------
" vim-plug
" --------------------------------------------------------------------------------------------
" 初期設定
let s:plug = {
	\"plugs": get(g:, 'plugs', {})
	\}

function! s:plug.is_installed(name)
	return has_key(self.plugs, a:name) ? isdirectory(self.plugs[a:name].dir) : 0
endfunction

" プラグイン読込
call plug#begin('~/.vim/plugged')

"" 見た目系
Plug 'tomasr/molokai'					" カラースキーム
Plug 'itchyny/lightline.vim'			" ステータスラインをいい感じにしてくれる奴
Plug 'itchyny/vim-gitbranch'			" ステータスラインにbranchを表示
"" 便利系
Plug 'bronson/vim-trailing-whitespace'	" 末尾の不要文字をハイライト
Plug 'ConradIrwin/vim-bracketed-paste'	" paste時にautoindentを無効にする
Plug 'airblade/vim-gitgutter'			" 行番号の箇所に、gitの追加・削除・変更された行を表示
Plug 'cohama/lexima.vim'				" 対応する括弧等を自動補完
Plug 'thinca/vim-zenspace'				" 全角スペースの可視化
"" HTML/CSS
Plug 'mattn/emmet-vim'					" 言わずもがなemmet
Plug 'tyru/open-browser.vim'			" URLをブラウザで開く
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"" Markdown
Plug 'plasticboy/vim-markdown'				" Markdown
"" Flutter Dart
Plug 'dart-lang/dart-vim-plugin'
Plug 'thosakwe/vim-flutter'
call plug#end()

" プラグイン設定
"" cohama/lexima.vim
""" 行末でのみ括弧を補完する
call lexima#add_rule({'at': '\%#.*[-0-9a-zA-Z_,:]', 'char': '{', 'input': '{'})
call lexima#add_rule({'at': '\%#.*[-0-9a-zA-Z_,:]', 'char': '(', 'input': '('})
call lexima#add_rule({'at': '\%#.*[-0-9a-zA-Z_,:]', 'char': '[', 'input': '['})
call lexima#add_rule({'at': '\%#.*[-0-9a-zA-Z_,:]', 'char': '"', 'input': '"'})
call lexima#add_rule({'at': '\%#.*[-0-9a-zA-Z_,:]', 'char': "'", 'input': "'" })
" ステータスライン設定
let g:lightline = {
	\'active': {
	\'left': [ [ 'mode', 'paste'  ],
	\	[ 'gitbranch', 'readonly', 'filename', 'modified'  ] ]
	\},
	\'component_function': {
	\	'gitbranch': 'gitbranch#name'
	\},
	\}

" --------------------------------------------------------------------------------------------
" 標準機能関連
" --------------------------------------------------------------------------------------------
set list										" 特殊文字の可視化
set listchars=tab:>-,trail:-,nbsp:%				" 特殊文字の表示設定
set number										" 行番号表示
set laststatus=2								" ステータスラインを常に表示
set showmode									" 現在のモードを表示
set showcmd										" 打ったコマンドをステータスラインの下に表示
set ruler										" ステータスラインの右側にカーソルの現在位置(行:列)を表示する
colorscheme molokai								" カラースキームにmolokaiを設定する
set t_Co=256									" iTerm2など既に256色環境なら無くても良い
syntax enable									" 構文に色を付ける
set fileencoding=utf-8							" 保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932	" 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac					" 改行コードの自動判別. 左側が優先される
set ambiwidth=double							" □や○文字が崩れる問題を解決
set nocompatible								" 方向キーでアルファベットが入力されないようにする
set tabstop=4									" 画面上でタブ文字が占める幅
set softtabstop=4								" 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent									" 改行時に前の行のインデントを継続する
set smartindent									" 改行時に前の行の構文をチェックし次の行のインデントを増減する
set shiftwidth=4								" smartindentで増減する幅
set backspace=indent,eol,start					" backspaceが効かない問題
set wildmenu									" コマンドモードの補完
set history=5000								" 保存するコマンド履歴の数
set nocursorline								" カーソル移動を軽くする為に無効化
set hlsearch									" 検索結果をハイライト
set clipboard+=unnamed							" clipboard
hi Comment ctermfg=Grey							" コメントの色を変更
filetype plugin indent on						" filetypeによって設定を変える

" --------------------------------------------------------------------------------------------
" 出力先設定
" --------------------------------------------------------------------------------------------
" ~/.bkfilesが存在しなければ作成する
if !isdirectory(expand('~/.bkfiles'))
	:call mkdir(expand('~/.bkfiles'))
endif

set directory=~/.bkfiles/		" swpファイル
set backupdir=~/.bkfiles/		" バックアップファイル
set undodir=~/.bkfiles/			" undoファイル

" --------------------------------------------------------------------------------------------
" autocmd設定
" --------------------------------------------------------------------------------------------
" インサートモードに入る時に、コメントにしないようにする。
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" 行末の空白を保存時に削除する。
autocmd BufWritePre * :%s/\s\+$//ge

" --------------------------------------------------------------------------------------------
" マウス設定
" --------------------------------------------------------------------------------------------
" マウスでのカーソル移動等を可能にする
if has('mouse')
	set mouse=a
	if has('mouse_sgr')
		set ttymouse=sgr
	elseif v:version > 703 || v:version is 703 && has('patch632')
		set ttymouse=sgr
	else
		set ttymouse=xterm2
	endif
endif

" --------------------------------------------------------------------------------------------
" その他設定
" --------------------------------------------------------------------------------------------
" 個別設定ファイル読込
source ~/.vim/.vim_settings/html_css.vimrc
source ~/.vim/.vim_settings/markdown.vimrc
source ~/.vim/.vim_settings/flutter_dart.vimrc


" .vimrc.localがあれば読み込む
if filereadable(expand('~/.vimrc.local'))
  source ~/vimrc.local
endif
