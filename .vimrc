" ====================
" ======NeoBundle===== 
" ====================
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

" <=== NeoBundle Plugins
NeoBundle 'tpope/vim-surround'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'felipesousa/rupza'
" <=== NeoBundle Plugins

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck


" <===== vim-airline ======
" vim-airline: Settings
let g:airline_powerline_fonts = 1
set laststatus=2
let g:airline_theme = 'bubblegum'
" ====== vim-airline =====>

" <===================
" ======一般設定====== 
" ====================

" 文字コードをUTF-8に
set fenc=utf8
" 日本語文字の幅補正
set ambiwidth=double
" 行番号を表示する
set number
" 実行中のコマンドを表示する
set showcmd
" カレント行を強調する
set cursorline
" 行末は+1文字カーソル移動可能に
set virtualedit=onemore
" スマートインデントを使用する
set smartindent
" ステータスラインを常に表示する
set showmatch

" タブ幅=2
set tabstop=2
set shiftwidth=2

" 折返しを無効化
set nowrap

" クリップボード有効化
set clipboard=unnamed,autoselect

" マウス操作有効化
set mouse=a

" 色空間拡張
" if has('nvim') || has('termguicolors')
"     set termguicolors
" endif
let g:hybrid_use_iTerm_colors = 1
" カラースキーム変更
colorscheme rupza
" シンタックスハイライトを有効化
syntax on

" ====ステータスライン設定====
" ファイル名表示
set statusline=%F
" 変更チェック表示
set statusline+=%m
" 読み込み専用かどうか表示
set statusline+=%r
" ヘルプページなら[HELP]と表示
set statusline+=%h
" プレビューウインドウなら[Prevew]と表示
set statusline+=%w
" これ以降は右寄せ表示
set statusline+=%=
" file encoding
set statusline+=[ENC=%{&fileencoding}]
" 現在行数/全行数
set statusline+=[LOW=%l/%L]
" ステータスラインを常に表示(0:表示しない、1:2つ以上ウィンドウがある時だけ表示)
set laststatus=2

" ==== キーマップ設定 ====
" Ctrl-Q を ESC と同様の操作に
noremap! <C-q> <esc>
noremap    <C-q> <esc>
" [Insert] プレフィックスキー
inoremap <C-f> <C-o>
" [Insert] h, l で左右移動する
inoremap ^H ^[ha
inoremap ^L ^[la

" 一部のCtrlと組み合わせるショートカットの有効化(sttyのvim使用時の挙動変更)
" REF: https://vi.stackexchange.com/questions/2419/mapping-ctrls-does-not-work 
silent !stty -ixon
" Vim終了時に変更していたsttyの挙動を復元する
autocmd VimLeave * silent !stty ixon

" 自動コメントアウト挿入を無効にする(autocmd)
" REF: http://d.hatena.ne.jp/hyuki/20140122/vim
augroup auto_comment_off
    autocmd!
    autocmd BufEnter * setlocal formatoptions-=r
    autocmd BufEnter * setlocal formatoptions-=o
augroup END

